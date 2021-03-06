# == Schema Information
# Schema version: 20170112210803
#
# Table name: bills
#
#  id              :integer          not null, primary key
#  meal_id         :integer
#  resident_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  amount_cents    :integer          default(0), not null
#  amount_currency :string           default("USD"), not null
#
# Indexes
#
#  index_bills_on_meal_id      (meal_id)
#  index_bills_on_resident_id  (resident_id)
#
# Foreign Keys
#
#  fk_rails_...  (meal_id => meals.id)
#  fk_rails_...  (resident_id => residents.id)
#

class Bill < ApplicationRecord
  belongs_to :meal
  belongs_to :resident

  counter_culture :meal
  counter_culture :meal, column_name: 'cost', delta_column: 'amount_cents'
  counter_culture :resident, column_name: 'bill_costs', delta_column: 'amount_cents'

  delegate :multiplier, to: :meal

  validates :meal, presence: true
  validates :resident, presence: true
  validates :amount_cents, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  monetize :amount_cents

  # DERIVED DATA
  def reimburseable_amount
    return 0 if amount_cents == 0
    return 0 if multiplier == 0

    value = max_amount
    until value % multiplier == 0 do
      value += 1
    end
    value
  end

  def unit_cost
    return 0 if multiplier == 0
    reimburseable_amount / multiplier
  end

  # HELPERS
  def max_amount
    return amount_cents unless persisted?

    return amount_cents if meal.cost == 0
    (amount_cents / meal.cost).to_f.round(2) * amount_cents
  end

end
