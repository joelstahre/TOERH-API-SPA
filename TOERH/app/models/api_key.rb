class ApiKey < ActiveRecord::Base
	has_one :application
end
