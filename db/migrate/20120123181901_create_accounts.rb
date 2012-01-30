class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.integer :parent_left
      t.integer :parent_right
      t.string  :code,          :limit => 20, :null => false
      t.string  :name,          :limit => 100, :null => false
      t.integer :level
      t.boolean :active,        :default => true
      t.boolean :reconcile,     :default => false
      t.integer :parent_id
      t.integer :currency_id
      t.integer :account_type_id
      t.string  :note,          :limit => 255

      t.timestamps
    end
  end
end
