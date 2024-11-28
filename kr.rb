def apply_operation_to_array(numbers, operation)
  # Перевіряємо, що numbers є масивом
  unless numbers.is_a?(Array)
    raise ArgumentError, "Перший аргумент має бути масивом"
  end

  # Виконуємо прок або блок для кожного елемента масиву
  numbers.map do |number|
    operation.call(number)
  end
end

# Приклад використання:
# Масив чисел
numbers = [1, 2, 3, 4, 5]

# Прок, що визначає математичну операцію (у цьому випадку множення на 2)
multiply_by_two = proc { |n| n * 2 }

# Викликаємо метод з масивом і проком
result = apply_operation_to_array(numbers, multiply_by_two)
puts result.inspect # Виведе: [2, 4, 6, 8, 10]

# Також можна використовувати блоки замість проків
result_with_block = apply_operation_to_array(numbers, proc { |n| n + 3 })
puts result_with_block.inspect # Виведе: [4, 5, 6, 7, 8]