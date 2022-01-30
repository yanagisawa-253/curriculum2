class Book < ApplicationRecord
  belongs_to :user
  
  # バリデーション設定
  validates :name, presence: true
  validates :body, {presence: true, length: { maximum: 200}}
end
