class AddNameToPost < ActiveRecord::Migration
  def self.up
    add_column :posts, :name, :string
  end

  def self.down
    remove_column :posts, :name
  end
end
