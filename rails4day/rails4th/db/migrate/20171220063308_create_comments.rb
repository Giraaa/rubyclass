class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id #모델에 id를 가져오겠다.

      t.timestamps null: false
    end
  end
end
