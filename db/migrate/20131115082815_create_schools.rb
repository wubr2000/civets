class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :location
      t.string :major
      t.date :enrolled_on
      t.date :left_on
      t.boolean :did_graduate
      t.references :user, index: true

      t.timestamps
    end
    
    create_table :schools_vitaes, id: false do |t|
      t.integer :school_id, index: true
      t.integer :vitae_id, index: true
    end
  end
end
