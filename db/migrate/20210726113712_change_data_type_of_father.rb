class ChangeDataTypeOfFather < ActiveRecord::Migration[5.0]
  def up
    change_column :users, :father_name, :string
  end
  def down
    change_column :users, :father_name, :integer
  end
end
