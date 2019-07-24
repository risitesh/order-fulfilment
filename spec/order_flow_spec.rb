# spec/order_flow_spec.rb

require 'rspec'
require 'order_flow'

describe OrderFlow do
  describe "check inventory" do
    context "day 1" do
      it "calls" do
        order = OrderFlow.new(10, 20)
        json = {
          "O1" => {
            "D1" => [3, 2],
            "D2" => [5, 3]
          },
          "O2" => {
            "D1" => [2, 5],
            "D2" => [5, 4]
          },
          "O3" => {
            "D1" => [3, 3],
            "D2" => [15, 2]
          }
        }
        order_flow_path = order.orders_recieved(json)
        expect(order_flow_path).to eql(["O3", "O2"])
      end
    end

    context "day 2" do
      it "calls" do
        order = OrderFlow.new(15, 30)
        json = {
          "O1" => {
            "D1" => [10, 4],
            "D2" => [5, 3]
          },
          "O2" => {
            "D1" => [4, 5],
            "D2" => [4, 4]
          },
          "O3" => {
            "D1" => [3, 3],
            "D2" => [15, 2]
          }
        }
        order_flow_path = order.orders_recieved(json)
        expect(order_flow_path).to eql(["O1", "O3"])
      end
    end
  end
end
