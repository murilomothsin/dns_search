class CreateDNSRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :dns_records do |t|
      t.references :dns
      t.references :hostname

      t.timestamps
    end
  end
end
