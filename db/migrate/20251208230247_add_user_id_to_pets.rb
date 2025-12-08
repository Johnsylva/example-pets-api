class AddUserIdToPets < ActiveRecord::Migration[8.1]
  def change
    add_column :pets, :user_id, :integer
  end
end
