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

  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :category, required: true, class_name: "Category", foreign_key: "category_id", counter_cache: :favorite_things_count
validates :category_id, presence: true
end
