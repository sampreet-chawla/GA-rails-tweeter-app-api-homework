class AddDefaultValueToContent < ActiveRecord::Migration[6.0]
  def change
    # Note: defaults will not be added to existing data entries. New ones will have to be added.
    change_column_default :tweets, :content, 'Pending content'
  end
end
