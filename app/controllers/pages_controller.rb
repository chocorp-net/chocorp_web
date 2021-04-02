class PagesController < ApplicationController
  # @ rend les variables visibles pour les vues
  def home
  end

  def inteam
  end

  def tqtmemepas
  end

  def brrr
  end

  def mcmods
    am = Mod.new(name: "AuthMod", desc: "AuthMod is an authentication Forge mod which allows modded server owners to accept free versions of Minecraft on their server without wondering about security issues. It forces players to login with a password dedicated to the server.", webpage: "https://www.curseforge.com/minecraft/mc-mods/authmod", logo: "https://github.com/Chocorean/authmod/raw/master/src/main/resources/logo.png")
    mc = Mod.new(name: "MoreCommands", desc: "MoreCommands is a Forge mod that adds a few command to your modded Minecraft server", webpage: "https://www.curseforge.com/minecraft/mc-mods/more-commands-mod", logo: "https://github.com/Chocorean/morecommands/raw/master/src/main/resources/assets/morecommands/textures/logo.png")
    ms = Mod.new(name: "MoreSnowballs", desc: "MoreSnowballs adds a few snowballs with unique effects", webpage: "https://www.curseforge.com/minecraft/mc-mods/more-snowballs", logo: "https://media-cdn.overwolf.wtf/avatars/176/960/636767575153316345.png")
    @mods = [am, mc, ms]
  end

  def resume
  end

  def hnh
  end

  def hnh_r
    ctt = params[:contact]
    msg = params[:content]
    msg_p = "msg"
    time = Time.new.strftime("%Y-%m-%d_%H:%M:%S.%L.txt")
    Dir.mkdir(msg_p) unless File.exists?(msg_p)
    File.open("#{msg_p}/#{time}", "w") { |f|
      f.write("From: #{ctt}\n#{msg}")
    }
  end
end
