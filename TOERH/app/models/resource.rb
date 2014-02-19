class Resource < ActiveRecord::Base

    belongs_to :user
    belongs_to :resource_type
    belongs_to :licence
    has_and_belongs_to_many :tags

end 