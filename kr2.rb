# Використання Ractor для передачі масиву між потоками і обробки його елементів

# Ініціалізуємо головний Ractor для створення ізольованого масиву
input_array = [1, 2, 3, 4, 5]

# Створюємо перший Ractor, який приймає ізольований масив для обробки
processor_ractor = Ractor.new(input_array) do |arr|
  # Обробляємо масив: множимо кожен елемент на 2
  arr.map { |n| n * 2 }
end

# Створюємо другий Ractor, який обробляє результат з першого Ractor'а
final_ractor = Ractor.new(processor_ractor) do |previous_ractor|
  # Отримуємо результат з першого Ractor'а
  processed_array = previous_ractor.take
  # Обробляємо масив: додаємо 3 до кожного елемента
  processed_array.map { |n| n + 3 }
end

# Отримуємо кінцевий результат з другого Ractor'а
final_result = final_ractor.take

# Виводимо результат на екран
puts final_result.inspect # Очікуваний результат: [5, 7, 9, 11, 13]
