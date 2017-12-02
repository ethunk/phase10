class CreateCheckoutTable < ActiveRecord::Migration
  def change
    create_table :checkouts do |table|
      # table.decimal :price, precision: 5, scale: 2
      table.integer :book_id
    end
  end
end

#precision is the total number of digits
#scale is the number of digits to the right of the decimal
#https://academy.vertabelo.com/blog/understanding-numerical-data-types-sql/
