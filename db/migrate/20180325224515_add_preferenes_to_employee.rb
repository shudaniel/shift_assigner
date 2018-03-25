class AddPreferenesToEmployee < ActiveRecord::Migration[5.1]
  def change
    add_column  :employees, :weekly_preferences, :hstore, default: {}, null: false
  end
end
