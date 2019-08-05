# spec/order_flow_spec.rb

require 'rspec'
require 'order_flow'

describe OrderFlow do
  describe "check inventory" do
    context "day 1" do
      it "calls" do
        order = OrderFlow.new(10, 20, 25)
        json = {
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
        order_flow_path = order.orders_recieved(json)
        expect(order_flow_path).to eql(["O2", "O3", "O1"])
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
