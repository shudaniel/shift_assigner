class ChangeEmployeeIdColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :employees, :employee_id, :employee_num
  end
end
