class CreateNewsApiArticles < (Rails.version > '4.2' ? eval("ActiveRecord::Migration[#{Rails.version.to_f}]") : ActiveRecord::Migration)
  def change
    create_table :news_api_articles do |t|
      t.string :source
      t.string :author
      t.string :title
      t.text :description
      t.string :url
      t.string :url_to_image
      t.datetime :published_at
      t.text :content

      t.timestamps
    end
    add_index :news_api_articles, :title
  end
end
