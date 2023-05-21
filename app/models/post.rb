class Post < ApplicationRecord
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
 
  validate :clickbaity_title

      def clickbaity_title
          clickbait_phrases = ["Won't Believe", "Secret", "Top", "Guess"]
           if title.nil? || clickbait_phrases.none? { |phrase| title.include?(phrase) }
            errors.add(:title, "must be sufficiently clickbait-y")
        end
      end
end
