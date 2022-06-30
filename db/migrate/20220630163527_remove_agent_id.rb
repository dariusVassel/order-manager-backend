class RemoveAgentId < ActiveRecord::Migration[7.0]
  def change
    remove_column :orders, :agent_id
  end
end
