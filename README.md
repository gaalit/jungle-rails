# Jungle

A mini e-commerce application built with Rails 4.2.

## Features

- Users are able to register, login and logout.
- Users are able to view all the products on the home page
- Users are able to filter products by category
- Users are able to view more details about the product or add it to their cart.
- Users are able to checkout and complete the payment process.
- Admins are able to add/remove products and categories.

## Final Product

### View of all products

!["View of all products"](https://github.com/gaalit/jungle-rails/blob/master/docs/my_cart.png?raw=true)

### View of a specific product's details

!["View of a specific product's details"](https://github.com/gaalit/jungle-rails/blob/master/docs/product.png?raw=true)

### View of a user's cart

!["View of a user's cart"](https://github.com/gaalit/jungle-rails/blob/master/docs/my_cart.png?raw=true)

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

- Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
- PostgreSQL 9.x
- Stripe
