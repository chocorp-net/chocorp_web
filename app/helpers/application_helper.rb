module ApplicationHelper
  def active?(a)
    begin
      current_page?({controller: 'pages', action: a}) ? ' active' : ''
    rescue
      current_page?({controller: 'twitch', action: a}) ? ' active' : ''
    end
  end
end
