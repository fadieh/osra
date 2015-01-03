module Helpers
  
  DEFAULT_ADMIN = {
    :email => 'default@man.net',
    :password => 'defaultpass'    
  }

  def create_admin_user email= DEFAULT_ADMIN[:email], password= DEFAULT_ADMIN[:password]
    AdminUser.new(email: email, password: password, password_confirmation: password).save!
  end

  def login email= DEFAULT_ADMIN[:email], password= DEFAULT_ADMIN[:password]
    visit new_admin_user_session_path
    fill_in "admin_user_email", :with => email
    fill_in "admin_user_password", :with => password
    click_button "Login"
  end

  def logout
    visit destroy_admin_user_session_path
  end

  def path_to_admin_role(page_name, id = '')
    name = page_name.downcase
    case name
      when 'login' then
        new_admin_user_session_path    #this will be changed to new_hq_user_session_path once rails login is implemented
      when 'partners' then
        hq_partners_path
      else
        raise('path to specified is not listed in #path_to')
    end
  end

end
