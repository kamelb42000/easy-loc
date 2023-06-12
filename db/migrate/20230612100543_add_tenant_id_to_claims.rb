class AddTenantIdToClaims < ActiveRecord::Migration[7.0]
  def change
    add_column :claims, :tenant_id, :integer
  end
end
