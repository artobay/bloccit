class AddTopicToPosts < ActiveRecord::Migration[5.1]
  def change
    #note: we add topic_id column to the post table + an index 
    #note: we read it like: add a column to posts table, name it topic_id, option integer
    add_column :posts, :topic_id, :integer
    add_index :posts, :topic_id
  end
end
