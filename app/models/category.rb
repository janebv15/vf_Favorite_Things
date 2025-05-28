# == Schema Information
#
# Table name: categories
#
#  id                    :bigint           not null, primary key
#  favorite_things_count :integer
#  max_items             :integer
#  name                  :text
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class Category < ApplicationRecord
    has_many  :favorite_things, class_name: "Recommendation", foreign_key: "category_id", dependent: :destroy
end
