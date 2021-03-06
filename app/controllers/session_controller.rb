# This controller handles the login/logout function of the site.  
class SessionController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem

  # render new.rhtml
  def new
  end

  def create
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
      if params[:remember_me] == "1"
        current_user.remember_me unless current_user.remember_token?
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
      session[:turno] = params[:turno]
      redirect_back_or_default('/')
      #flash[:notice] = "Logged in successfully"
    else
      flash[:notice] = "Error de logado"
      render :action => 'new'
    end
  end

  def destroy
    self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    #flash[:notice] = "You have been logged out."
    redirect_back_or_default('/')
  end
  
  def send_pass
  	Correo.deliver_lost_pass("jorge","jorge.mollon@gmail.com")
  	redirect_back_or_default('/')
  end
end
