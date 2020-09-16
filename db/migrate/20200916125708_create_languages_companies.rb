class CreateLanguagesCompanies < ActiveRecord::Migration
  def change
    create_table :languages_companies do |t|
      t.string :name 
      t.text :description
      t.string :image 
      end
  end
end
