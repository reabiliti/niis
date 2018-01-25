class Setting < ApplicationRecord

  validates :set_indent_down, numericality: { only_integer: true }

end
