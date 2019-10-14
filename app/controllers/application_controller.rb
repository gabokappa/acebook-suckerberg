class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(user)
    userswall_path
  end

  def after_update_path_for(user)
    userswall_path
  end

end
