# == Schema Information
#
# Table name: recommendations
#
#  id          :bigint           not null, primary key
#  description :string
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  category_id :integer
#  user_id     :integer
#
class Recommendation < ApplicationRecord
end
