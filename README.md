# README
  Read me first!
## Configuration
``` rails db:drop ``` remove existing database

``` rails db:create ```

``` rails db:migrate ```

``` rails db:seed ```

# Usage
Access ```localhost:3000/login``` to login

Redirects you here
``` localhost:3000/dasboard``` after successful login

## Credentials
username: ```user1```  password: ```user1```

### Creating Users
* Use ```rails c```

* Then
```User.create(username: "<username>", password: "<password>")```
