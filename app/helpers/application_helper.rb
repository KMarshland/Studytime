module ApplicationHelper

  def is_home
    #puts 'Controller Name: ' << controller_name
    return controller_name == 'home'
  end
end
