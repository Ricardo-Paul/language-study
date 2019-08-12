class AddPubIdToAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :answers, :pub_id, :integer
  end
end
