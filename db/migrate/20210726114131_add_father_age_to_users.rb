class AddFatherAgeToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :father_age, :string
  end
end
