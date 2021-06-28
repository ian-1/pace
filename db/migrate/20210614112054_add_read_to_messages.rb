class AddReadToMessages < ActiveRecord::Migration[6.1]
  def change
    add_column :messages, :read, :binary
  end
end
