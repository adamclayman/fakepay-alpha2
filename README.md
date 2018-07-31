# README

A Chargify Code Challenge response. To get this running, you need to add a .env file with a FAKEPAY_SECRET. Write if you need to ask me for mine. The API works for all exemplary and all six types of malformed requests, as long as you have a FAKEPAY_SECRET and work off the sample request below. At the moment, unlike the Fakepay.io endpoint, no authorization token is required to submit requests to _this_ API endpoint. But never fear ... JSON Web Tokens are coming soon to an API near you, along with a bundle of other features that this developer is anxious to learn and implement.

### Exemplary Valid Subscription Request Sample

__POST to root_path/api/alpha2/subscriptions__
```
Exemplary Request
{	
	"subscription": {
		"customer_id": 1,
		"plan_id": 1
	},
	"shipping": {
		"shipping_address": "7930 Palacio del Mar Drive, Boca Raton, FL 33433"
	},
	"billing": {
		"card_number": "4242424242424242",
		"expiration_month": "01",
		"expiration_year": "2021",
		"cvv": "123",
		"zip_code": "33433"
	}
}
```

### Reponses to Requests, Successful and Malformed

#### Successful request (matches exemplary parameters above)
```
Exemplary Response
{
    "status": 200,
    "type": "subscription",
    "error": "subscribe_successful",
    "error_code": "null",
    "title": "Subscribe successful",
    "detail": "Subscription was a success",
    "confirmation_object": {
        "id": 81,
        "customer_id": 1,
        "plan_id": 1,
        "plan_name": "Bronze Box",
        "plan_price": "1999",
        "plan_period": "Monthly",
        "subscribe_date": "2018-07-30",
        "expiration_date": "2019-07-31",
        "shipping_address": "7930 Palacio del Mar Drive, Boca Raton, FL 33433",
        "payment_token": "6896a3f889e8781632cdbe45cf74f1",
        "created_at": "2018-07-31T01:55:20.546Z",
        "updated_at": "2018-07-31T01:55:20.546Z"
    }
}
```

#### Invalid Card ("card_number": "4242424242424241")
```
Response: Invalid card
{
    "status": 400,
    "type": "charge",
    "error": "invalid_card_number",
    "error_code": 1000001,
    "title": "Invalid card number",
    "detail": "The card number is invalid",
    "confirmation_object": null
}
```
#### Insufficient Funds ("card_number": "4242424242420089")
```
Response: Insufficient funds
{
    "status": 400,
    "type": "charge",
    "error": "insufficient_funds",
    "error_code": 1000002,
    "title": "Insufficient funds",
    "detail": "The account has insufficient funds",
    "confirmation_object": null
}
```
#### CVV Failure ("cvv": "124")
```
Response: CVV failure
{
    "status": 400,
    "type": "charge",
    "error": "cvv_failure",
    "error_code": 1000003,
    "title": "CVV failure",
    "detail": "CVV failure",
    "confirmation_object": null
}
```
#### Expired Card ("expiration_month": "01", "expiration_year": "2018")
```
Response: Expired card
{
    "status": 400,
    "type": "charge",
    "error": "expired_card",
    "error_code": 1000004,
    "title": "Expired card",
    "detail": "The card is expired",
    "confirmation_object": null
}
```
#### Invalid ZIP Code ("zip_code": "334")
```
Response: Invalid ZIP code
{
    "status": 400,
    "type": "charge",
    "error": "invalid_zip_code",
    "error_code": 1000005,
    "title": "Invalid ZIP code",
    "detail": "The ZIP code is invalid",
    "confirmation_object": null
}
```
#### Invalid Purchase Amount (Plan Model Validation Prevents This Error)
##### Warning: All Plan Prices / Amounts Must Be "Hectared" Before Submission (i.e. "9900" = $99.00)
The nearest thing to an invalid purchase amount you can achieve is a plan not found response.
```
Response: 404 Plan Not Found
{
    "status": 404,
    "error": "Not Found",
    "exception": "#<ActiveRecord::RecordNotFound: Couldn't find Plan with 'id'=5>",
    ....
```

## Error-Driven Development Paradigm

This was written by grace of [Error-Driven Development](https://halogenandtoast.com/error-driven-development/) (EDD™), with manual rather than automated testing, and plenty of elbow grease. More tests will be added to RSpec next week.

Mea maxima culpa.
