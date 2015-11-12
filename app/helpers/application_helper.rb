module ApplicationHelper
  def setting
    @setting ||= Setting.first
  end
end
