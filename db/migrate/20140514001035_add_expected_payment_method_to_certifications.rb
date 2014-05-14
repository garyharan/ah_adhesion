class AddExpectedPaymentMethodToCertifications < ActiveRecord::Migration
  def change
    add_column :certifications, :expected_payment_method, :string
  end
end
