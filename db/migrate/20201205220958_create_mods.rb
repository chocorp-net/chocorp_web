class CreateMods < ActiveRecord::Migration[6.0]
  def change
    create_table :mods do |t|
      t.string :name
      t.string :webpage
      t.text :desc
      t.string :logo

      t.timestamps
    end
  end
end
