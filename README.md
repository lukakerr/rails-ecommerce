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

You need to change these from the placeholders to your specific variables.

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
- Admin features:
  - Can edit/update/delete records
- User features:
  - Can add products to cart with multiple quantities

- Users are able to create/edit/delete accounts
- Admin users can create/edit/delete products, categories, banners, pictures
- Admin users can view orders, users
- Users can add products to the cart or go straight to checkout
- Products can be on sale, featured, sold out

### To Do

- [ ] Integrate Stripe for payments
- [ ] Add email confirmation
- [ ] Add styling for products that are: on sale, featured or sold out
- [ ] Integrate 'buy now' feature
- [ ] Add pagination for products
- [ ] Improve overall styling
- [ ] Fix validations that don't appear when image size is too large
