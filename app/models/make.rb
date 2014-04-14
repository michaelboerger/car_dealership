class Make < ActiveRecord::Base
  has_many :cars, dependent: :nullify
  validates :name, presence: true
  validates :country, presence: true
end
