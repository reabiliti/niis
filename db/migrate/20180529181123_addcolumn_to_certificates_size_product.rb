class AddcolumnToCertificatesSizeProduct < ActiveRecord::Migration[5.2]
  def change
    add_column :certificates, :cert_name_product_size_font, :integer
  end
end
