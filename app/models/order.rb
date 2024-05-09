# +--------------------+
# |       Order        |
# +--------------------+
# | @id  (Integer)        
# | @meal (instance of Meal)
# | @customer (instance of Customer)
# | @employee (instance of Employee)
# | @delivered (boolean)
# +--------------------+
# | delivered?         |
# | deliver!           |
# | meal           
# | customer          
# | employee          
# | delivered          
# | id          
# | id=
# +--------------------+

class Order
  attr_reader :meal, :customer, :employee
  attr_accessor :id
  def initialize(attributes = {})
    # attributes --> { id: 1, meal: <Meal:XXX >, customer:  <Customer:XXX >, employee:  <Employee:XXX > }
    # attributes --> { id: 1, delivered: true , meal: <Meal:XXX >, customer:  <Customer:XXX >, employee:  <Employee:XXX > }
    @id = attributes[:id]
    @meal = attributes[:meal]
    @customer = attributes[:customer]
    @employee = attributes[:employee]
    # if attributes[:delivered] exists (is not nil), store it into @delivered, 
    # if not store false instead
    @delivered = attributes[:delivered] || false
  end

  def delivered?
    @delivered
  end

  def deliver!
    @delivered = true
  end
end