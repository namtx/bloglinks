class AddNameToProvider < ActiveRecord::Migration[5.0]
  def change
    add_column :providers, :name, :string
  end
end
