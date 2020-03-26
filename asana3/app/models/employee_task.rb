class EmployeeTask < ActiveRecord::Base
    has_and_belongs_to_many :employee_projects
end
