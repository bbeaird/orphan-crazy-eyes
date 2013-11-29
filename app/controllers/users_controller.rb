class UsersController <ApplicationController
# order: index show new create edit update destroy

  def index

  end

  def create
    @access_token = auth_hash.credentials.token
    @uid = auth_hash.uid
    @instagram = Instagram.user_recent_media("#{@uid}")
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end