class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :name
      t.text :body
      t.string :date
      t.references :post, foreign_key: true

      t.timestamps
    end
  end
end
