#lib/order_flow.rb

class OrderFlow
  def initialize(*drugs)
    @drugs_list = drugs
  end

  def orders_recieved(*orders)
    orders.each do |order|
      price = {}
      order.each do |single|
        calc = 0
        single[1].each do |drug|
          calc = calc + drug[1][0]*drug[1][1]
        end
        price[single[0]] = calc
      end
      price_hash = price.sort_by {|key, value| value}.reverse.to_h
      final_order_flow = []
      price_hash.each do |order_key, order_price|
        order[order_key].each_with_index do |drug, index|
          break if @drugs_list.include?(0)
          result = @drugs_list[index] - drug[1][0]
          break if result < 0
          final_order_flow.push(order_key)
          @drugs_list[index] = result
        end
      end
      return final_order_flow.uniq!
    end
  end
end
