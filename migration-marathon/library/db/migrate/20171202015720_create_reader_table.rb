class CreateReaderTable < ActiveRecord::Migration
  def change
    create_table :readers do |table|
      table.text :first_name
      table.text :last_name
      table.text :email, uniqness: true
      table.text :phone_number, uniqness: true
    end
  end
end
