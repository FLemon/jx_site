class AddEmailToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :email, :string, :null => false
  end
end
