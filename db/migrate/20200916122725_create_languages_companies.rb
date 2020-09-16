class CreateLanguagesCompanies < ActiveRecord::Migration
  def change
    create_table :languages_companies do |t|
      t.integer :language_id
      t.integer :company_id 
    end
  end
end
