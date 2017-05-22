#Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). 
#Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным. 
#(Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?) 
#Год високосный, если он делится на четыре без остатка, но если он делится на 100 без остатка, это не високосный год. 
#Однако, если он делится без остатка на 400, это високосный год. 
#Таким образом, 2000 г. является особым високосным годом, который бывает лишь раз в 400 лет.
require 'date'
p "day?"
day = gets.chomp.to_i
p "month?"
month = gets.chomp.to_i
p "year?"
year = gets.chomp.to_i

def isYearLeap?(year)
  leapYear = false 
  if year%4 == 0 
    leapYear = true
    if year%100 == 0
      leapYear = false
      if year%400 == 0 
        leapYear = true
      end
    end
  end
  return leapYear
end

months = {1=>31, 2=>isYearLeap?(year) ? 29 : 28, 3=>31, 4=>30, 5=> 31, 6=>30, 7=>31, 8=>31, 9=>30, 10=>31, 11=>30, 12=>31}
i = 0
months.each do |k,v| 
  if k < month
    i += v
  end
end
i += day
p "Количество дней с начала года #{i}"
p "Проверка #{Date.new(year,month,day).yday}"