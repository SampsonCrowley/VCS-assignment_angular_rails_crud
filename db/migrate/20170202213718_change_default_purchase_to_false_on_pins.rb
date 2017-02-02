class ChangeDefaultPurchaseToFalseOnPins < ActiveRecord::Migration[5.0]
  def change
    change_column :pins, :purchase, :boolean, default: false
  end
end
