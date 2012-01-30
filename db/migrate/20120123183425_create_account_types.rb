class CreateAccountTypes < ActiveRecord::Migration
  def change
    create_table :account_types do |t|
      t.string  :code,          :limit => 20, :null => false
      t.string  :name,          :limit => 100, :null => false
      t.string  :close_method
      t.string  :report_type
      t.string  :note,          :limit => 255

      t.timestamps
    end
  end
end
