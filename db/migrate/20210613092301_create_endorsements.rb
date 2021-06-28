class CreateEndorsements < ActiveRecord::Migration[6.1]
  def change
    create_table :endorsements do |t|
      t.text :body
      t.references :user, null: false, foreign_key: true
      t.integer :endorser_id

      t.timestamps
    end
  end
end
