class User < ApplicationRecord
    has_secure_password
    validates :name, uniqueness: true
    has_many :sites
    belongs_to :current_site, class_name: "Site", foreign_key: "current_site_id"
    def create_current_site
        new_site = sites.create
        self.current_site_id = new_site.id
        save
    end
    def remove_site
        self.current_site_id = nil
      save
    end
end
#http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html