class ChangeHosts < ActiveRecord::Migration[6.0]
  def change
    add_column :hosts, :sign_in_count, :bigint, default: 0, null: false
    add_column :hosts, :current_sign_in_at, :datetime
    add_column :hosts, :last_sign_in_at, :datetime
    add_column :hosts, :current_sign_in_ip, :string
    add_column :hosts, :last_sign_in_ip, :string
    
    add_column :hosts, :confirmation_token, :string
    add_column :hosts, :confirmed_at, :datetime
    add_column :hosts, :confirmation_sent_at, :datetime
    add_column :hosts, :unconfirmed_email, :string

  end
end
