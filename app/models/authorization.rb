class Authorization < ActiveRecord::Base
belongs_to :user
validates :provider, :uid, :presence => true

def self.find_from_hash(hash)
  find_by_provider_and_uid(hash['provider'], hash['uid'])
end

def self.create_from_hash(hash, user = nil)
  user ||= User.create_from_hash!(hash)
  Authorization.create(:user => user, :uid => hash['uid'], :provider => hash['provider'])
end

end
