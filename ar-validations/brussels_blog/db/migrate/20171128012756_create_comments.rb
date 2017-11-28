class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |table|
      table.integer :article_id, null: false
      table.text :body, null: false
    end
  end
end
