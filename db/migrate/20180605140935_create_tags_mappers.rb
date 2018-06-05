class CreateTagsMappers < ActiveRecord::Migration[5.2]
  def change
    create_table :tags_mappers do |t|
      t.references :tag, foreign_key: true
      t.references :note, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
