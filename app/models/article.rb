class Article < ApplicationRecord
    # make these two fields required
    validates :title, presence: true  
    validates :body, presence: true

end
