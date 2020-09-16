class CreateLanguagesCompanies < ActiveRecord::Migration
  def change
    create_table :languages_companies do |t|
      t.integer :company_id
      t.integer :language_id
    end
  end 
end
