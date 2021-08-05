class CreateOffers < ActiveRecord::Migration[6.1]
  def change
    enable_extension("citext")

    create_table :offers do |t|
      t.citext :title
      t.text :description
      t.decimal :price, precision: 8, scale: 2

      t.timestamps
    end
  end
end
