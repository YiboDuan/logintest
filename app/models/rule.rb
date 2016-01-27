class Rule < ActiveRecord::Base
    enum permission: [ :allow, :deny ]

    belongs_to :user
end
