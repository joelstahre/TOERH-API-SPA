object @r
attributes :id, :title, :desciption, :url, :created_at, :updated_at

child :resource_type do
  attributes :id, :resource_type
end

child :licence do
  attributes :id, :licence
end

child :tags do
  attributes :id, :tag
end