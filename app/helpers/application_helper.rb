# frozen_string_literal: true

module ApplicationHelper
  def active?(action)
    current_page?({ controller: 'pages', action: action }) ? ' active' : ''
  rescue StandardError
    current_page?({ controller: 'twitch', action: action }) ? ' active' : ''
  end
end
