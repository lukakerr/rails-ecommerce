# Ruby on Rails Ecommerce Site

This repository is a starter ecommerce web application written in ruby.

### Setup

To get started:

```bash
# Clone the repository
$ git clone https://github.com/lukakerr/rails-ecommerce.git

# Change directories
$ cd rails-ecommerce

# Start the PostgreSQL server (this command may vary depending on how you installed PostgreSQL)
$ pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

# Setup the database (details for login etc ar in db/seeds.rb)
$ rake db:setup

# Start the rails server
$ rails s

# Navigate to localhost:3000
open http://localhost:3000
```

### Environment Variables

Inside `config/default.yml` is where all the username, passwords, environment variables etc are stored.

This includes things such as:
- PostgreSQL username and password
- Email details
- AWS S3 details
- Facebook key/secrets (for Facebook login)
- Google Analytics tracking code

You need to change at least the PostgreSQL values to your specific values before starting the application.

### Test

Make sure the database is running. Run `bundle exec rspec`.

### Features

- CRUD for: 
  - Users
  - Products
  - Image banners
  - Orders
  - Categories
  - Pages
  - Pictures
  - Checkouts
- Facebook login
- Stripe
- AWS S3
- Google Analytics
- Email via Gmail
- Cart
  
### Stack

The ruby version used is `2.4.2`, and rails version `5.0.5`, although using relatively older/newer versions shouldn't break anything.

The application uses PostgreSQL as its database, so this must be installed.

Images are uploaded to Amazon AWS S3, so an account with Amazon is needed.

Tests are driven by `rspec`, `factory_bot` and `faker`.

### To Do

- [ ] Add more tests
- [ ] Integrate Stripe for payments
- [ ] Add email confirmation
- [ ] Add styling for products that are: on sale, featured or sold out
- [ ] Integrate 'buy now' feature
- [ ] Add pagination for products
- [ ] Improve overall styling
- [ ] Fix validations that don't appear when image size is too large
