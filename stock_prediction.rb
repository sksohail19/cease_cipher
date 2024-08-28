def stock_picker(prices)
  sell = 0
  buy = 0
  i = 0
  j = 1
  max_profit = 0
  while i < prices.length - 1
    if prices[j] - prices[i] > max_profit
      max_profit = prices[j] - prices[i]
      buy = i
      sell = j
    elsif j == prices.length - 1
      i += 1
      j = i + 1
    else
      j += 1
    end
  end
  profit = [buy,sell]
end


puts " The best day to buy and sell is #{stock_picker([17,3,6,9,15,8,6,1,10])} " 
