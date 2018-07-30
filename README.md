# README

A Chargify Code Challenge response. Write to ask me for my FAKEPAY_SECRET. 

The API works, if you use parameters that match my Postman environment. 

### Exemplary Valid Subscription Request Sample

POST to root_path/api/alpha2/subscriptions
```
Exemplary Request
{
	"customer_id": "1", 
	"plan_id": "1",
	"card_number": "4242424242424242",
	"expiration_month": "01",
	"expiration_year": "2021",
	"cvv": "123",
	"zip_code": "33433",
	"shipping_address": "7930 Palacio del Mar Drive, Boca Raton, FL 33433"
}
```

### Reponses to Requests, Successful and Malformed

#### Successful request (matches exemplary parameters above)
```
Exemplary Response
{
    "status": 200,
    "error": "subscribe_successful",
    "error_code": "nil",
    "title": "Subscribe successful.",
    "detail": "Subscription was a success."
}
```

#### Invalid Card ("card_number": "4242424242424241")
```
Response: Invalid card
{
    "status": 400,
    "error": "invalid_card_number",
    "error_code": 1000001,
    "title": "Invalid card number",
    "detail": "The card number is invalid"
}
```
#### Insufficient Funds ("card_number": "4242424242420089")
```
Response: Insufficient funds
{
    "status": 400,
    "error": "insufficient_funds",
    "error_code": 1000002,
    "title": "Insufficient funds",
    "detail": "The account has insufficient funds"
}
```
#### CVV Failure ("cvv": "124")
```
Response: CVV failure
{
    "status": 400,
    "error": "cvv_failure",
    "error_code": 1000003,
    "title": "CVV failure",
    "detail": "CVV failure"
}
```
#### Expired Card ("expiration_month": "01", "expiration_year": "2018")
```
Response: Expired card
{
    "status": 400,
    "error": "expired_card",
    "error_code": 1000004,
    "title": "Expired card",
    "detail": "The card is expired"
}
```
#### Invalid ZIP Code ("zip_code": "334")
```
Response: Invalid ZIP code
{
    "status": 400,
    "error": "invalid_zip_code",
    "error_code": 1000005,
    "title": "Invalid ZIP code",
    "detail": "The ZIP code is invalid"
}
```
#### Invalid Purchase Amount ("plan_id": "4" [=> price: "So invalid"])
##### All Plan Prices / Amounts Must Be "Hectared" Before Submission (i.e. "9900" = $99.00)
```
Response: Invalid purchase amount
{
    "status": 400,
    "error": "invalid_purchase_amount",
    "error_code": 1000006,
    "title": "Invalid purchase amount",
    "detail": "The purchase amount is invalid"
}
```

## Error-Driven Development Paradigm

This was written by grace of [Error-Driven Development][EDD] (EDD™), with manual rather than automated testing, and plenty of elbow grease. More tests will be added to RSpec next week.

Mea maxima culpa.

[EDD]: "Error-driven Development" https://halogenandtoast.com/error-driven-development/