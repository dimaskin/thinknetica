#Заполнить массив числами фибоначчи до 100
arr = []
(0..100).each do |x|
  if x == 0 
    arr << 0
  elsif x == 1
    arr << 1
  else
    arr << arr[-2] + arr[-1]
  end
end
p arr
