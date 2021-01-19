class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :name
      t.string :contractor
      t.text :description
      t.datetime :date

      t.timestamps
    end
  end
end
