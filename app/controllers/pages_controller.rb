require 'net/http'

class PagesController < ApplicationController
  def mcmods
    @mods = Mod.all
  end

  def cv
  end

  def hnh
  end

  def hnh_r
    # reCAPTCHA
    resp = params['g-recaptcha-response']
    secret = ENV['CAPTCHA_SECRET']
    uri = URI.parse('https://www.google.com/recaptcha/api/siteverify')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/x-www-form-urlencoded'})
    request.body = "secret=#{secret}&response=#{resp}"
    response = http.request(request)
    if JSON.parse(response.body)['success'] != true
      render status: 400
    end

    addr = params[:contact]
    msg = params[:content]
    msg_p = "msg"
    fn = Time.new.strftime("%Y-%m-%d_%H:%M:%S.%L.txt")
    begin
      Dir.mkdir(msg_p) unless File.exists?(msg_p)
      File.open("#{msg_p}/#{fn}", "w") { |f|
        f.write("From: #{addr}\n#{msg}")
      }
    rescue => err
      if not Rails.env.production?
        raise err
      end
      p err
      render status: 500
    end
  end
end
