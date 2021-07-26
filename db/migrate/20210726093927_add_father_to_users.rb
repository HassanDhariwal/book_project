class AddFatherToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :father_name, :string
  end
end
