#Заполнить массив числами фибоначчи до 100
arr = []
count = 0
while count < 100
 if count == 0 
    arr << count
  elsif count == 1
    arr << count
  else
    arr << arr[-2] + arr[-1]
  end
  count += 1
end
p arr
p "count = #{count}"