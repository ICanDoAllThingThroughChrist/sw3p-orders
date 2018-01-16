class User < ApplicationRecord
    has_many :sites
    belongs_to :current_site, class_name: "Site", foreign_key: "current_site_id"
    has_secure_password
    validates :name, presence: true, uniqueness: true, length: { maximum: 100 }
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