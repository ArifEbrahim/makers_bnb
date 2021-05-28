# MakersBnB

A web application that allows users to list spaces they have available, and to hire spaces for the night.

## Getting Started

1. Clone this repository onto your computer.
2. Install the relevant gems using the command `bundle` in the terminal.
3. Create a database called `makers_bnb` using `psql`.
4. When connected to your database run each `SQL` query saved in the directory `./db/migrations`.
5. Create a test database called `makers_bnb_test` using `psql` and run the same queries as in the main database.

## How to run it

To run this app, run `rackup` in the terminal, and navigate in your web browser to `localhost:9292`

## How to test it

This program is test-driven using RSpec, and you can run the tests anytime by running `rspec` in the terminal

## MVP

1. Users can sign up.
2. Any signed-up user can list a new space.
3. Users can name their space, provide a short description of the space, and a price per night.
4. Users can offer a range of dates where their space is available.
5. Any signed-up user can request to hire any space for one night.

## User stories

```
As a user,
So that I can use the website,
I want to be able to sign up.

As a user, 
So that others can view my property,
I want to list a property.

As a user,
So that I can make more money,
I want to list multiple properties.

As a user,
So I can attract more renters,
I want to display the name, description and price per night.

As a user,
So that I can choose when people rent my property,
I want to be able to set available dates.

As a user,
So that I can rent a space for a night,
I want to make a request to book a listing.

```