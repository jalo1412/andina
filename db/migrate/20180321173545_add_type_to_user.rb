class AddTypeToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :type_of_user, :integer, default: 1
  end
end
