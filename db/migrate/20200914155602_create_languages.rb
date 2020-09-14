class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
        t.string :name 
        t.text :description 
        t.string :logo_image 
        t.string :companies 
        t.integer :user_id 
    end
  end
end
