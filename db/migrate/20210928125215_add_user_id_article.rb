class AddUserIdArticle < ActiveRecord::Migration[6.1]
  def change
    change_table :articles do |t|
      t.references :user, foreign_key: true
    end
  end
end
