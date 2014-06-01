module ApplicationHelper

  def devise_links
    if current_user #user_signed_in?
      link_to 'Log Out User', destroy_user_session_path, method: :delete
    else
      link_to 'Log In', new_user_session_path
    end
  end

  def devise_admin_links
    if current_admin #user_signed_in?
      link_to 'Log Out Admin', destroy_admin_session_path, method: :delete
    else
      link_to 'Log In', new_admin_session_path
    end
  end

end
