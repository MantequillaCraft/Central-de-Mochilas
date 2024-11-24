class CreateChangeHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :change_histories do |t|
      t.date :modification_date
      t.string :change_description
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
