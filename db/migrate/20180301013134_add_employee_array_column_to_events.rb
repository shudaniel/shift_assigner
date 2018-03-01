class AddEmployeeArrayColumnToEvents < ActiveRecord::Migration[5.1]
  def change
    add_column :shifts, :assigned_to, :integer, array: true, default: []
  end
end
