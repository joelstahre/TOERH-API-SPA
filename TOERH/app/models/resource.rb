class Resource < ActiveRecord::Base

    belongs_to :user
    belongs_to :resource_type
    belongs_to :licence
    has_and_belongs_to_many :tags

    def as_json(options={})
        super(options.merge(:except => [:user_id, :resource_type_id, :licence_id],
                            :include => [:user, :resource_type, :licence, :tags]))
    end

    def to_xml(options={})
        super(options.merge(:except => [:user_id, :resource_type_id, :licence_id],
                            :include => [:user, :resource_type, :licence, :tags]))
    end

end 