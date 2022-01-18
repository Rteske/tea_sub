# Tea Subscription

Proof of concept tea subscription API where a customer can be subscribed to a tea. Using Rails 5 and Postgres Database tested with RSpec.

### Deployment instructions

  ``` 
  git clone https://github.com/Rteske/tea_sub
  
  bundle install 
  
  rake db:{create,migrate}
  ```

### How to run the test suite

  ``` bundle exec rspec ```

### API Endpoints

<details>
  
  <summary>Get All Teas</summary>
  
  * Method: GET
  
  * Endpoint: /teas
  
```
  {
    data:
    [
      {
        id: integer,
        title: string,
        description: string,
        tempature: float,
        brew_time: integer,
        price_per_gram: float
      }
    ]
  }
```
  
</details>

<details>
  
  <summary>Create a subscription</summary>
  
  * Method: POST
  
  * Endpoint: /subscriptions
  
  * Body: Raw JSON Format { "customer_id": 1, "tea_id": 1, "amount": 2 } 
  
```
{
    "data": {
        "id": integer,
        "title": string,
        "price": float,
        "status": integer,
        "frequency": sting(timestamp),
        "customer_id": integer,
        "tea_id": integer,
        "created_at": timestamp,
        "updated_at": timestamp,
        "amount": integer
    }
}
```
  
</details>

<details>
  
  <summary>Delete a Subscription</summary>
  
  * Method: DELETE
  
  * Endpoint: /subscriptions/:id
  
  * Response: 204 No Content
  
</details>
