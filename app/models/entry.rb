class Entry < ApplicationRecord
    validates_presence_of :content, message: 'You can\'t have done nothing!'
end
