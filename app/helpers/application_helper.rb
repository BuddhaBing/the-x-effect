module ApplicationHelper

  def root_path
    user_signed_in? ? authenticated_root_path : unauthenticated_root_path
  end
end
