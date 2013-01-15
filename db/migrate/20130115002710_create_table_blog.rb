class CreateTableBlog < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.text :content
      t.timestamps
    end
  end
end
