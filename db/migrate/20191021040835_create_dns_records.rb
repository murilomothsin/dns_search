class CreateDNSRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :dns_records do |t|
      t.belongs_to :dns
      t.belongs_to :hostname

      t.timestamps
    end
  end
end
