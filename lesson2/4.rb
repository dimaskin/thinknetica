#Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
result = {}
vowels = ["A", "E", "I", "O", "U"]
#index = 1
#чтобы не считать индекс вручную, можно использовать конструкцию each.with_index(1), 
#тогда в блок вторым аргументом будет передаваться еще и индекс, причем с единицы.
#("A".."Z").each do |l|
("A".."Z").each.with_index(1) do |letter, index|
  #result.merge!({index => l}) if vowels.include?(l)
  result[letter] = index if vowels.include?(letter)
  #index += 1
end
p result