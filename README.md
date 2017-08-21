## Rails Ecommerce Site

### Setup

Setup the database with rake db:setup. This will seed the database with placeholder values including a test account.

Go to db/seeds.rb for the user account details.

### Features

- Users are able to create/edit/delete accounts
- Admin users can create/edit/delete products, categories, banners, pictures
- Admin users can view orders, users
- Users can add products to the cart or go straight to checkout
- Products can be on sale, featured, sold out

### Models

- User
- Order 
- Product 
- Picture 
- Category 
- Banner

### Gems

- Devise for users
- Client-side-validations for real time inline validations from the model
- Paperclip for image uploads
- Simple form for forms