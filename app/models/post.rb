class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
    validate :sufficiently_clickbait_y
  
    private
  
    def sufficiently_clickbait_y
      return if title.blank?
  
      clickbait_keywords = ['Won\'t Believe', 'Secret', 'Top', 'Guess']
      unless clickbait_keywords.any? { |keyword| title.include?(keyword) }
        errors.add(:title, 'should be sufficiently clickbait-y')
      end
    end
  end
  