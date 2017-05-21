#Заданы три числа, которые обозначают число, месяц, год (запрашиваем у пользователя). 
#Найти порядковый номер даты, начиная отсчет с начала года. Учесть, что год может быть високосным. 
#(Запрещено использовать встроенные в ruby методы для этого вроде Date#yday или Date#leap?) 
#Год високосный, если он делится на четыре без остатка, но если он делится на 100 без остатка, это не високосный год. 
#Однако, если он делится без остатка на 400, это високосный год. 
#Таким образом, 2000 г. является особым високосным годом, который бывает лишь раз в 400 лет.
#p "day?"
#day = gets.chomp.to_i
#p "month?"
#month = gets.chomp.to_i
p "year?"
year = gets.chomp.to_i


def isYearLeap?(year)
  leapYear = false 
  #p "1#{leapYear}" 
  if year%4 == 0 
    leapYear = true
    #p "2#{leapYear}"
    if year%100 == 0
      leapYear = false
      #p "3#{leapYear}"
      if year%400 == 0 
        leapYear = true
        #p "4#{leapYear}"
      end
    end
  end
  #p "5#{leapYear}"
  return leapYear
end

p isYearLeap?(year)