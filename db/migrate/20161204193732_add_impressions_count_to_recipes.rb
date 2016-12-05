class AddImpressionsCountToRecipes < ActiveRecord::Migration[5.0]
  def change
    add_column :recipes, :impressions_count, :integer, :default => 0
  end
end