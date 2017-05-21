#Заполнить хеш гласными буквами, где значением будет являтся порядковый номер буквы в алфавите (a - 1).
result = {}
vowels = ["A", "E", "I", "O", "U"]
index = 1
("A".."Z").each do |l|
  result.merge!({index => l}) if vowels.include?(l)
  #p "#{l} #{index}" if vowels.include?(l)
  #hash.merge!({:item2 => 2})
  index += 1
end
p result