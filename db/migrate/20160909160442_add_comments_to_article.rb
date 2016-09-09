class AddCommentsToArticle < ActiveRecord::Migration[5.0]
  def change
    remove_column :comments, :article_id, :integer
  end

  def self.up
      add_column :comments, :article_id, :integer
      add_index 'comment', ['comment_id'], name: 'comment_article_id'
  end

  def self.down
      remove_column :comments, :comment_id
  end
end
