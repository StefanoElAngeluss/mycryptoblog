class AddCurrencyToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :currency, :string, default: "EUR"
  end
end
