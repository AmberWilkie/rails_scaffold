class TryToFixThisMess < ActiveRecord::Migration[5.0]
  def change
    drop_table :comments
    drop_table :articles

    create_table :articles do |t|
      t.string :title
      t.text :content

      t.timestamps
    end

    create_table :comments do |t|
      t.text :body
      t.belongs_to :article

      t.timestamps
    end
  end
end
