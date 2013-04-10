class AddGrantedToBlog < ActiveRecord::Migration
  def change
    add_column :blogs, :granted, :boolean, :default => false
  end
end
