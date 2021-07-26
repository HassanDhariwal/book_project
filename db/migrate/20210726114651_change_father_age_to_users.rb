class ChangeFatherAgeToUsers < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :father_age, :integer
  end

  def down
    change_column :users, :father_age, :integer
  end
end
