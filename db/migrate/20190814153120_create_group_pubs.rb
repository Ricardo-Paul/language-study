class CreateGroupPubs < ActiveRecord::Migration[5.2]
  def change
    create_table :group_pubs do |t|
      t.string :content
      t.integer :user_id
      t.integer :group_id

      t.timestamps
    end
  end
end
