class AddHasManyToArticle < ActiveRecord::Migration[5.0]
  def self.up
    add_column :comments, :comment_id, :integer

  end
end
