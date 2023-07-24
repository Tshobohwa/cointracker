class Entity < ApplicationRecord
  belongs_to :user, foreign_key: 'author_id'
  has_many :groups, foreign_key: :Entity_id, dependent: :destroy

  validates :name, :amount, presence: true
  validates :amount, numericality: { greater_than_or_equal_to: 0 }
end
