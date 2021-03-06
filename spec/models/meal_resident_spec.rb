# == Schema Information
# Schema version: 20170112210803
#
# Table name: meal_residents
#
#  id          :integer          not null, primary key
#  meal_id     :integer
#  resident_id :integer
#  multiplier  :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  vegetarian  :boolean          default(FALSE), not null
#  late        :boolean          default(FALSE), not null
#
# Indexes
#
#  index_meal_residents_on_meal_id                  (meal_id)
#  index_meal_residents_on_meal_id_and_resident_id  (meal_id,resident_id)
#  index_meal_residents_on_resident_id              (resident_id)
#
# Foreign Keys
#
#  fk_rails_...  (meal_id => meals.id)
#  fk_rails_...  (resident_id => residents.id)
#

require 'rails_helper'

RSpec.describe MealResident, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
