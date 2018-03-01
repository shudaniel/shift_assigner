class CreateEmployees < ActiveRecord::Migration[5.1]
  def change
    create_table :employees do |t|
      t.string :name
      t.string :email
      t.integer :employee_id
      t.belongs_to :calendar, foreign_key: true

      t.timestamps
    end
  end
end
