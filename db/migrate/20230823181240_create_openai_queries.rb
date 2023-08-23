class CreateOpenaiQueries < ActiveRecord::Migration[7.0]
  def change
    create_table :openai_queries do |t|
      t.string :query
      t.text :answer
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
