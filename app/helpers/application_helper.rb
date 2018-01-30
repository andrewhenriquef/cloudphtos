module ApplicationHelper

  def nav_bar_helper ul_class
    nav_links = ''

    if user_signed_in?
      nav_links << "<ul class='#{ul_class}'>"
      nav_bar_items.each do |item|
        nav_links << "<li><a href='#{item[:url]}' data-method='#{item[:method]}'> #{item[:title]} </a></li>"
      end
      nav_links << "</ul>"
    end

    return nav_links.html_safe
  end

  def nav_bar_items
    [
      {
        url: photos_path,
        title: 'Gallery',
        method: 'get'
      },
      {
        url: edit_user_registration_path,
        title: 'Profile',
        method: 'get'
      },
      {
        url: destroy_user_session_path,
        title: 'Logout',
        method: 'delete'
      }
    ]
  end
end