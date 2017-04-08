class Post < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user, optional:true
  belongs_to :category, optional: true
  validates :body, presence: true

  # def product_params
  #   params.require(:post).permit([:title, :body, :date, :category])
  # end
end
