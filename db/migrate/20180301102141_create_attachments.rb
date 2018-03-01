class CreateAttachments < ActiveRecord::Migration[5.1]
  def change
    create_table :attachments do |t|
      t.belongs_to :certificate, index: true
      t.string :att_blank_num
      t.string :att_code_okp
      t.string :att_code_tn_ved
      t.string :att_name_product
      t.string :att_manuf_name
      t.string :att_regulations

      t.timestamps
    end
  end
end
