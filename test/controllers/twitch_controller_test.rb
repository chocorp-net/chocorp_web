# frozen_string_literal: true

require 'test_helper'

class TwitchControllerTest < ActionDispatch::IntegrationTest
  test 'GET /brrr - printer OFF' do
    get brrr_path
    assert_response :success
  end

  test 'GET /brrr - printer printing' do
    get brrr_path
    assert_response :success
  end

  test 'GET /brrr - printer not printing' do
    get brrr_path
    assert_response :success
  end
end
