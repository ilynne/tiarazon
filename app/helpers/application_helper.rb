module ApplicationHelper

  def devise_links
    if current_user #user_signed_in?
      link_to 'Log Out User', destroy_user_session_path, method: :delete
    else
      link_to 'Log In', new_user_session_path
    end
  end

  def shop_name_link product
    if current_user && current_user.admin?
      link_to "##{product.shop_id}-#{product.shop.name}", edit_shop_path(product.shop) rescue 'n/a'
    else
      "#{product.shop.name}" rescue 'n/a'
    end
  end

end
