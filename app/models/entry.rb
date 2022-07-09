class Entry < ApplicationRecord
    belongs_to :user
    validates_presence_of :content, message: 'You can\'t have done nothing!'
end
