class EmployeeProject < ActiveRecord::Base
    has_and_belongs_to_many :employee_tasks
end
