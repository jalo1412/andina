module CurrentUser
  private

    def set_user
      @user = User.find(session[:user_id])
    rescue ActiveRecord::RecordNotFound
    end
end
