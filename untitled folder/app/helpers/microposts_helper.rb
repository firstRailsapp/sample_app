module MicropostsHelper
  private

  def authenticate
    deny_access unless signed_in?
  end

  def deny_access
    flash[:notice] = "Please sign in to access this page."
    redirect_to(signin_path)
  end
end
