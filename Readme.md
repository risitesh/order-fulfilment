# Automated Order Flow Completion System

Project contains two directories : -
  1. lib
    contains the logical functionalities

  2. spec
    contains the test files

# lib/order_flow.rb

Contains Class OrderFlow which on initialize accepts comma separated integers as Drug inventory

orders_recieved method
  - requires json data like
    {
        "O1" => {
            "D1" => [3, 2],
            "D2" => [5, 3],
            "D3" => [8, 5]
        },
        "O2" => {
            "D1" => [2, 5],
            "D2" => [5, 4],
            "D3" => [10, 5]
        },
        "O3" => {
            "D1" => [3, 3],
            "D2" => [10, 2],
            "D3" => [7, 5]
        }
    }
    as per example.
    D* is an array with 1st element as number of drugs to be shipped and 2nd element is the profit with each drug shipped
  - performs the automated order completion system and returns and array of order completion steps


# spec/order_flow_spec.rb

This is the test file containing 2 test cases for this operation.

To run the test cases
  - open the terminal
  - move to the project directory
  - bundle install (if not done)
  - run bundle exec rspec spec/order_flow_spec.rb
