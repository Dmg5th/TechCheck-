class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name 
      t.text :description 
      t.string :logo_image
    end
  end
end
