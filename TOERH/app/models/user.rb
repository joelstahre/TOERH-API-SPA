class User < ActiveRecord::Base
    has_many :resource

    def as_json(options={})
        super(options.merge(:include => [:resource => {:except => [:user_id, :resource_type_id, :licence_id]}]))
    end

    def to_xml(options={})
        super(options.merge(:include => [:resource => {:except => [:user_id, :resource_type_id, :licence_id]}]))
    end

end
