class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: {minimum: 250}
    validates :summary, length: {maximum: 250}
    validates :category, inclusion: ["Fiction", "Non-Fiction"]
    validate :title_custom_validation

    def title_custom_validation
        unless (title.include? "Won't Believe") || (title.include? "Secret") || (title.include? "Top [/\d/]") || (title.include? "Guess")
            errors.add!(:title, "title needs to include clickbait expression")
        end
    end

end
