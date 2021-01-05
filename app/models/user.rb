class User < ApplicationRecord
    # define M part of users 1:M relationship with calculations, and maintain relationship structure when deleting 
    has_many :calculations, :dependent => :destroy

    # validations before saving records to db 
    validates_presence_of :first_name
    validates_presence_of :last_name
    validates_uniqueness_of :email # emails must be unique 
end
