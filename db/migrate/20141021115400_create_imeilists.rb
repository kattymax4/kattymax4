class CreateImeilists < ActiveRecord::Migration
  def change
    create_table :imeilists do |t|
      t.integer :user_id
      t.string :imei

      t.timestamps
    end
  end
end
