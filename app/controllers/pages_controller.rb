require 'net/http'

class PagesController < ApplicationController
  def mcmods
    am = Mod.new(name: "AuthMod", desc: "AuthMod is an authentication Forge mod which allows modded server owners to accept free versions of Minecraft on their server without wondering about security issues. It forces players to login with a password dedicated to the server.", webpage: "https://www.curseforge.com/minecraft/mc-mods/authmod", logo: "https://raw.githubusercontent.com/Chocorean/authmod/main/src/main/resources/logo.png")
    mc = Mod.new(name: "MoreCommands", desc: "MoreCommands is a Forge mod that adds a few command to your modded Minecraft server", webpage: "https://www.curseforge.com/minecraft/mc-mods/more-commands-mod", logo: "https://github.com/Chocorean/morecommands/raw/master/src/main/resources/assets/morecommands/textures/logo.png")
    ms = Mod.new(name: "MoreSnowballs", desc: "MoreSnowballs adds a few snowballs with unique effects", webpage: "https://www.curseforge.com/minecraft/mc-mods/more-snowballs", logo: "https://media-cdn.overwolf.wtf/avatars/176/960/636767575153316345.png")
    @mods = [am, mc, ms]
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
