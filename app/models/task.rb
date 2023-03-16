class Task < ApplicationRecord
  validates :title, :description, presence: true

  def short_description
    description.length > 50 ? description[0..50] : description
  end
end
