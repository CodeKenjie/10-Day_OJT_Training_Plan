# stock picker

def stock_picker(arr)
  return [] if arr.length < 2

  min_price = arr[0]
  min_day = 0
  max_profit = 0
  best_day = []

  arr.each_with_index do |price, day|
    profit = price - min_price

    if profit > max_profit
      max_profit = profit
      best_day = [min_day, day]
    end

    if price < min_price
      min_price = price
      min_day = day
    end
  end

  best_day
end

print stock_picker([17,3,6,9,15,8,6,1,10])
puts ""

