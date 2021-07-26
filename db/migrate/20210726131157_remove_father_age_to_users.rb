class RemoveFatherAgeToUsers < ActiveRecord::Migration[5.0]
  def up
    remove_column :users, :father_age, :integer
  end

  def down
    add_column :users, :father_age, :integer  
  end
end
