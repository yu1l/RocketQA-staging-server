# == Schema Information
#
# Table name: preorders
#
#  id         :integer          not null, primary key
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Preorder < ActiveRecord::Base
  validates :email, presence: true
  validates :email, uniqueness: true
end
