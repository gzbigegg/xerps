require 'devise/test_helpers'

module ControllerMacros
  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = Factory.create(:normal_user)
      sign_in @user
    end
  end
  
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = Factory.create(:admin_user)
      sign_in @user
    end
  end
end