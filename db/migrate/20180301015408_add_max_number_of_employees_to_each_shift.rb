class AddMaxNumberOfEmployeesToEachShift < ActiveRecord::Migration[5.1]
  def change
    add_column :shifts, :max_employees, :integer
  end
end
