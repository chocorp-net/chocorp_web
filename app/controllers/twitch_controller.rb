# frozen_string_literal: true

require 'net/http'

class TwitchController < ApplicationController
  include TwitchHelper

  # GET /brrr
  def brrr
    @is_printing = printing?
    @is_alive = alive?
    @job_name = job_name
  end
end
