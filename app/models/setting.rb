class Setting < ApplicationRecord
  validates :set_os_registration_num, :set_os_registration_date, presence: true
  validates :set_at_x, numericality: { only_integer: true }
  validates :set_at_y, numericality: { only_integer: true }

end
