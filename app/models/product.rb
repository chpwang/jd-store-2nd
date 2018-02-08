# == Schema Information
#
# Table name: products
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  price       :decimal(, )
#  quantity    :integer
#  is_sold_out :boolean          default(FALSE)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Product < ApplicationRecord
  validates :price, numericality: { greater_than: 0.0 }
  validates :quantity, numericality: { greater_than: 0.0 }
  validates :title, presence: true
  validates :description, presence: true

  mount_uploader :image, ImageUploader


  def is_hidden?
    is_sold_out
  end
end
