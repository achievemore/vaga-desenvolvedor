class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  self.strict_loading_by_default = true
end
