# user model 
has_one :profile 
after_create :create_profile
def create_profile
    self.profile.create(:name => self.user_name)
end