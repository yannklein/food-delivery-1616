require_relative '../views/orders_view'

class OrdersController
  def initialize(order_repo, meal_repo, customer_repo, employee_repo)
    @order_repo = order_repo
    @meal_repo = meal_repo
    @customer_repo = customer_repo
    @employee_repo = employee_repo
    @orders_view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
    @sessions_view = SessionsView.new
  end

  def list_undelivered
    orders = @order_repo.all_undelivered
    @orders_view.display(orders)
  end

  def add
    # 1. get the meals (meal_repo)
    meals = @meal_repo.all
    # 2. display the meals (meals_view)
    @meals_view.display(meals)
    # 3. ask the user what meal
    index = @meals_view.ask_user_for(:meal).to_i - 1  # ---> an index of meal starting from 1
    meal = meals[index]
    # 4. same for employee, same for customer
    customers = @customer_repo.all
    @customers_view.display(customers)
    index = @customers_view.ask_user_for(:customer).to_i - 1
    customer = customers[index]

    employees = @employee_repo.all_riders
    @sessions_view.display(employees)
    index = @sessions_view.ask_user_for(:employees).to_i - 1
    employee = employees[index]

    # 5. create an order and save it
    order = Order.new(meal: meal, customer: customer, employee: employee )
    @order_repo.create(order)

    # 6. shows the created order in the list
    list_undelivered
  end
end