class Users::RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def create
    if(params['role_key'] == "admin" || params['role_key'] == "user") then
      params['user']['role'] = params['role_key']
      params['user']['available'] = true
      puts "################################################"
      puts @user
      super
    else
      flash[:notice] = "sign up error : " + params['role_key'] +  "is not allowed"
      redirect_to :action => "new"
    end
  end

end
