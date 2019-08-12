class AddTypeIdToPub < ActiveRecord::Migration[5.2]
  def change
    add_column :pubs, :type_id, :integer
  end
end
