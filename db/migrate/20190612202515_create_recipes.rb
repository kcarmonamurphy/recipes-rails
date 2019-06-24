class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.timestamps
      t.string :name
      t.text :description
    end
  end
end
