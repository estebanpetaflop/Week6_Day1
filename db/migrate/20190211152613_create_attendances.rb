class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.string :stripe_custor_id
      t.references :participant, index: true
      t.references :organiser, index: true
      t.references :event, foreign_key: true
      t.timestamps
    end
  end
end
