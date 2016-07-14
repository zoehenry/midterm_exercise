class DeleteColumnsFromTag < ActiveRecord::Migration
  def change
    remove_column :tags, :time
  end
end
