class CreateRefs < ActiveRecord::Migration
  def change
    create_table :refs do |t|
      t.string :name
      t.string :title
      t.string :email
      t.string :phone
      t.string :relationship
      t.references :user, index: true

      t.timestamps
    end
    
    create_table :refs_vitaes, id: false do |t|
      t.integer :ref_id, index: true
      t.integer :vitae_id, index: true
    end
  end
end
