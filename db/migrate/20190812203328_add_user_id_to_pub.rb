class AddUserIdToPub < ActiveRecord::Migration[5.2]
  def change
    add_column :pubs, :user_id, :integer
  end
end
