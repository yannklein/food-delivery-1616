require_relative "../views/sessions_view"

class SessionsController
  def initialize(employee_repo)
    @view = SessionsView.new
    @repo = employee_repo
  end

  def login
    username = @view.ask_for("username")
    password = @view.ask_for("password")
    employee = @repo.find_by_username(username)
    return employee if employee && employee.password == password

    @view.print_wrong_credentials
    login
  end
end
