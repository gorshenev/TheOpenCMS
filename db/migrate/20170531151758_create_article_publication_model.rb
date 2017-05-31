class CreateArticlePublicationModel < ActiveRecord::Migration[5.0]
  def change
    create_table 'articles' do |t|
      t.integer :user_id

      # Friendly ID
      t.string :slug,        default: ''
      t.string :short_id,    default: ''
      t.string :friendly_id, default: ''

      # Main Image (gem `paperclip`)
      t.string   :main_image_file_name
      t.string   :main_image_content_type
      t.integer  :main_image_file_size, default: 0
      t.datetime :main_image_updated_at

      # Base
      t.string :title, default: ''

      t.text :raw_intro
      t.text :intro

      t.text :raw_content
      t.text :content

      # Editor
      t.string :editor_type, default: :ckeditor

      # View Templates
      t.string :view_layout,   default: ''
      t.string :view_template, default: ''

      # Counters
      t.integer :view_counter, default: 0

      # Publication State: draft | published | deleted
      t.string :state, default: :draft

      # Access tocken to draft publications
      t.string :access_token, default: ''

      # DateTime
      t.datetime :published_at
      t.timestamps
    end
  end
end