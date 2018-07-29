module SubscriptionsHelper
  def first_charge
    authorization = "Token token=" + ENV['FAKEPAY_SECRET']
    url = "https://www.fakepay.io/purchase"
    plan = Plan.find(params['subscription']['plan_id'])
    plan_name = plan.name
    plan_period = plan.period
    plan_price = plan.price

    params['subscription'].merge!('plan_name' => plan_name)
    params['subscription'].merge!('plan_price' => plan_price)
    params['subscription'].merge!('plan_period' => plan_period)
    params['subscription'].merge!('subscribe_date' => Date.today)
    params['subscription'].merge!('expiration_date' => 1.year.from_now)

    amount = plan.price
    card_number = params['card_number']
    expiration_month = params['expiration_month']
    expiration_year = params['expiration_year']
    cvv = params['cvv']
    zip_code = params['zip_code']

    # Run FakePay API POST Request
    payload = {"amount":amount,
        "card_number":card_number,
        "cvv":cvv,
        "expiration_month":expiration_month,
        "expiration_year":expiration_year,
        "zip_code":zip_code}.to_json
    puts "Payload: #{payload}"
    rest_response = RestClient::Request.new(
        method: :post,
        url: url, 
        payload: payload, 
        headers: {content_type: :json, accept: :json, Authorization: authorization}).execute do |response, request, result|
            JSON.parse(response.to_s)
        end

    # Clean-out credit card from params immediately
    params['subscription'].delete('card_number')
    params['subscription'].delete('expiration_month')
    params['subscription'].delete('expiration_year')
    params['subscription'].delete('cvv')
    params['subscription'].delete('zip_code')

    case rest_response['error_code']
        when nil
            payment_token = rest_response['token']
            params['subscription'].merge!('payment_token' => payment_token)
        when 1000001
            render_payload :invalid_card_number
        when 1000002
            render_payload :insufficient_funds
        when 1000003
            render_payload :cvv_failure
        when 1000004
            render_payload :expired_card
        when 1000005
            render_payload :invalid_zip_code
        when 1000006
            render_payload :invalid_purchase_amount
        else
            render_payload :error_code_unrecognized
    end
    return rest_response
  end
end
