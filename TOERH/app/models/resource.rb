class Resource < ActiveRecord::Base

    belongs_to :user
    belongs_to :resource_type
    belongs_to :licence
    has_and_belongs_to_many :tags

    def self.search(search)
        find(:all, :conditions => ['title LIKE ?', "%#{search}%"])
    end
 
    def self.get_resources_by_user_id(id)
        where(user_id: id)
    end

    def self.get_resources_by_resource_type(resource_type_id, limit, offset)
        limit(limit).offset(offset).order(id: :desc).where(resource_type_id: resource_type_id)
    end

    def self.get_resources_by_licence_id(licence_id, limit, offset)
        limit(limit).offset(offset).order(id: :desc).where(licence_id: licence_id)
    end

    def self.get_resources_by_tag_id(tag_id, limit, offset) 
        limit(limit).offset(offset).order(id: :desc)
    end

    def self.get_all_resources(limit, offset)
        limit(limit).offset(offset).order(id: :desc)
    end

end 