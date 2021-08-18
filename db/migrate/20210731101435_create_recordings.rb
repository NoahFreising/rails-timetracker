class CreateRecordings < ActiveRecord::Migration[6.1]
  def change
    create_table :recordings do |t|
      t.string :title
      t.text :comment
      t.datetime :starts_at
      t.datetime :ends_at
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
