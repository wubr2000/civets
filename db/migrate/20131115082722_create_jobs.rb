class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :company
      t.string :location
      t.string :title
      t.date :hired_on
      t.date :left_on
      t.text :responsibilities
      t.references :user, index: true

      t.timestamps
    end
    
    create_table :jobs_vitaes, id: false do |t|
      t.integer :job_id, index: true
      t.integer :vitae_id, index: true
    end
  end
end
