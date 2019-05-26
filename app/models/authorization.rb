class Authorization < ApplicationRecord
  belongs_to :admin_user, foreign_key: 'user_id'
end
