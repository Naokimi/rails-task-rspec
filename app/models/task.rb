class Task < ApplicationRecord
  validates :title, :description, presence: true

  def truncated_description
    description.length > 10 ? "#{description[0..10]}..." : description
  end
end
