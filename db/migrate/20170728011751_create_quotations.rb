class CreateQuotations < ActiveRecord::Migration[5.1]
  def change
    create_table :quotations do |t|
      t.references :currency, foreign_key: true
      t.float :buy, null: false
      t.float :sell, null: false
      t.float :variation, null: false

      t.timestamps
    end
  end
end
