require_relative 'app/repositories/meal_repository'

csv_path = 'data/meals.csv'
repo = MealRepository.new(csv_path)

repo.add(Meal.new(name: 'Regina', price: 10))

p repo
