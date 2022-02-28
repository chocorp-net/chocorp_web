# frozen_string_literal: true

require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test 'GET /' do
    get home_path
    assert_response :success
  end

  test 'GET /mcmods' do
    get mcmods_path
    assert_response :success
  end

  test 'GET /resume' do
    get resume_path
    assert_response :success
  end
end
