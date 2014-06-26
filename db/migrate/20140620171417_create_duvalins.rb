class CreateDuvalins < ActiveRecord::Migration
  def change
    create_table :duvalins do |t|
    	t.string :nombre
    	t.string :desrip
      t.timestamps
    end
  end
end
