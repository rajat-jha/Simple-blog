class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :apellation
      t.text :caption
      t.text :specification   
    end
  end
end
