# frozen_string_literal: true

class ChangeColomnCertificateProduct < ActiveRecord::Migration[5.1]
  def change
    remove_column :certificates, :cer_product_name
    add_column :certificates, :cer_product_name, :text
  end
end
