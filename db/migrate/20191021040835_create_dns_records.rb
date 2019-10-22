class CreateDNSRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :dns_records do |t|
      t.belongs_to :dns
      t.belongs_to :hostname

      t.timestamps
    end
    add_index :dns_records, [:dns_id, :hostname_id], unique: true
  end
end
