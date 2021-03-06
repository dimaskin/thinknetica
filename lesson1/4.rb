#Квадратное уравнение. Пользователь вводит 3 коэффициента a, b и с. Программа вычисляет дискриминант (D) и корни уравнения (x1 и x2, если они есть) 
#и выводит значения дискриминанта и корней на экран. При этом возможны следующие варианты:
#  Если D > 0, то выводим дискриминант и 2 корня
#  Если D = 0, то выводим дискриминант и 1 корень (т.к. корни в этом случае равны)
#  Если D < 0, то выводим дискриминант и сообщение "Корней нет"
#Подсказка: Алгоритм решения с блок-схемой (www.bolshoyvopros.ru). Для вычисления квадратного корня, нужно использовать Math.sqrt
#Например, Math.sqrt(16) вернет 4, т.е. квадратный корень из 16.

#Квадратное уравнение — это уравнение вида ax2 + bx + c = 0, где a не равно 0.
#D = b**2 - 4ac дискриминант

p "a?"
a = gets.chomp.to_f
p "b?"
b = gets.chomp.to_f
p "c?"
c = gets.chomp.to_f
d = b**2 - 4*a*c

if d > 0
  d_sqrt = Math.sqrt(d) 
  x_plus  = (-b + d_sqrt)/2*a
  x_minus = (-b - d_sqrt)/2*a
  p " d > 0, 2 корня #{x_plus}, #{x_minus}"
elsif d == 0 
  p "d = 0, 1 корень #{-b/2*a}"
else
  p "корней нет, d=#{d}"
end