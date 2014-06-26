class CreateCelulars < ActiveRecord::Migration
  def change
    create_table :celulars do |t|
      t.string :nombre
      t.string :descrip
      t.timestamps
    end
  end
end
