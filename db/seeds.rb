Customer.create([{name: "Adam Clayman", handle: "adamclayman", email: "adam@clayman.org", profile_address: "San Antonio, TX"},
                {name: "David Clayman", handle: "dclayman", email: "david@clayman.org", profile_address: "Youngstown, OH"},
                {name: "Ariel Clayman", handle: "amc123", email: "ariel@clayman.org", profile_address: "NYC, NY"},
                {name: "Joel Clayman", handle: "joelclayman", email: "joel@clayman.org", profile_address: "Boca Raton, FL"}])

              
Plan.create([{name: "Bronze Box", price: "1999", period: "Monthly"},
            {name: "Silver Box", price: "4900", period: "Monthly"},
            {name: "Gold Box", price: "9900", period: "Monthly"},
            {name: "Invalid Purchase Amount", price: "So invalid", period: "Monthly"}])