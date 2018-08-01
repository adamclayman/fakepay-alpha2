Customer.create([{name: "Adam Clayman", handle: "adamclayman", email: "adam@clayman.org", profile_address: "San Antonio, TX"},
                {name: "David Clayman", handle: "dclayman", email: "david@clayman.org", profile_address: "Youngstown, OH"},
                {name: "Ariel Clayman", handle: "amc123", email: "ariel@clayman.org", profile_address: "NYC, NY"},
                {name: "Joel Clayman", handle: "joelclayman", email: "joel@clayman.org", profile_address: "Boca Raton, FL"}])

              
Plan.create([{name: "Bronze Box", price: "1999", period: "Monthly"},
            {name: "Silver Box", price: "4900", period: "Monthly"},
            {name: "Gold Box", price: "9900", period: "Monthly"},
            {name: "Invalid Purchase Amount", price: "99.00", period: "Monthly"}])

Subscription.create([{customer_id: "1", plan_id: "1", plan_name: "Bronze Box", plan_price: "1999", plan_period: "Monthly", shipping_address: "7930 Palacio del Mar Drive, Boca Raton, FL 33433", subscribe_date: "2018-07-01", payment_token: "abcdefg_fake_payment_token"}])