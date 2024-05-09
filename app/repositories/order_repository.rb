require 'csv'
require_relative '../models/order'

class OrderRepository
  def initialize(csv_path, meal_repo, customer_repo, employee_repo)
    @csv_path = csv_path
    @meal_repo = meal_repo
    @customer_repo = customer_repo
    @employee_repo = employee_repo
    @orders = []
    @next_id = 1
    load_csv
  end

  # CRUD

  # READ

  def all
    @orders
  end

  def all_undelivered
    @orders.reject { |order| order.delivered? }
  end

  def find(id)
    @orders.find { |order| order.id == id}
  end

  # CREATE

  def create(new_order)
    new_order.id = @next_id
    @next_id += 1
    @orders << new_order
    save_csv
  end

  private
  
  def save_csv
    CSV.open(@csv_path, 'wb') do |csv|
      csv << ['id','delivered','meal_id','customer_id','employee_id']
      @orders.each do |order|
        csv << [order.id, order.delivered?, order.meal.id, order.customer.id, order.employee.id]
      end
    end
  end

  def load_csv
    CSV.foreach(@csv_path, headers: :first_row, header_converters: :symbol) do |row|
      # row --> { id: "1", delivered: "false", meal_id: "1", customer_id: "1", employee_id: "2"  } 
      row[:id] = row[:id].to_i
      # row --> { id: 1, delivered: "false", meal_id: "1", customer_id: "1", employee_id: "2"  } 
      row[:delivered] = row[:delivered] == "true"
      # row --> { id: 1, delivered: false, meal_id: "1", customer_id: "1", employee_id: "2"  } 
      row[:meal] = @meal_repo.find(row[:meal_id].to_i)
      # row --> { id: 1, delivered: false, meal: <Meal:XXX >, meal_id: "1", customer_id: "1", employee_id: "2"  } 
      row[:employee] = @employee_repo.find(row[:employee_id].to_i)
      row[:customer] = @customer_repo.find(row[:customer_id].to_i)
      # row --> { id: 1, delivered: false, meal: <Meal:XXX >, customer:  <Customer:XXX >, employee:  <Employee:XXX > }
      @orders << Order.new(row)
    end
    @next_id = @orders.last.id + 1 unless @orders.empty?
  end
end