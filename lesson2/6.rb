#Сумма покупок. Пользователь вводит поочередно название товара, цену за единицу и кол-во купленного товара (может быть нецелым числом). 
#Пользователь может ввести произвольное кол-во товаров до тех пор, пока не введет "стоп" в качестве названия товара. 
#На основе введенных данных требуется:
#Заполнить и вывести на экран хеш, ключами которого являются названия товаров, а значением - вложенный хеш, 
#содержащий цену за единицу товара и кол-во купленного товара. Также вывести итоговую сумму за каждый товар.
#Вычислить и вывести на экран итоговую сумму всех покупок в "корзине".
result = {}
loop do
  p "item?"
  item = gets.chomp.to_s

  break if item == "stop"

  p "price?"
  price = gets.chomp.to_f
  p "quantity?"
  quantity = gets.chomp.to_i

  if result.has_key? (item)
    current_item = result[item]
    if current_item.has_key? (price)
      current_quantity = current_item[price]
      result[item].merge!({price => quantity + current_quantity})
    else
      result[item].merge!({price => quantity})
    end
  else
    result.merge!({item => {price => quantity}})
  end

end

p result

sum_global = 0
result.each_pair do |key, value|
  sum_item = 0
  value.each_pair do |price, quantity|
    sum_item += price * quantity
  end
  puts "item #{key}, sum_item #{sum_item}"  
  sum_global += sum_item
end  

puts "sum_global #{sum_global}"  
