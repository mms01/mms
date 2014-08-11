class AbolitionUsersController < ApplicationController
  def index
    puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    if !params['abolition_users'].nil? then
        for email in params['abolition_users']
            puts email
            User.where(:email => email).first.update_attribute(:available, false)
        end
    end

    @users = User.where("available = true")
  end
end
