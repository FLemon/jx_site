class CreateUserTable < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, :null => false
      t.string :name
      t.boolean :access_granted, :null => false, :default => true
      t.timestamps
    end
  end
end
