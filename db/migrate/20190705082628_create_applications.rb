class CreateApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :applications do |t|
      t.string :name, null: false, default: ''
      t.text :description

      t.timestamps
    end
  end
end
