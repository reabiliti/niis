class ChangeToConclusionCodeTnVed < ActiveRecord::Migration[5.1]
  def change
    change_column :conclusions, :conc_desc_scheme_cert, :text
    rename_column :conclusions, :conc_tn_ved, :conc_code_tn_ved
  end
end
