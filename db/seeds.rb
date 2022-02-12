# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Adding the three
Mod.create(name: "AuthMod", desc: "AuthMod is an authentication Forge mod which allows modded server owners to accept free versions of Minecraft on their server without wondering about security issues. It forces players to login with a password dedicated to the server.", webpage: "https://www.curseforge.com/minecraft/mc-mods/authmod", logo: "https://raw.githubusercontent.com/Chocorean/authmod/main/src/main/resources/logo.png")
Mod.create(name: "MoreCommands", desc: "MoreCommands is a Forge mod that adds a few command to your modded Minecraft server", webpage: "https://www.curseforge.com/minecraft/mc-mods/more-commands-mod", logo: "https://github.com/Chocorean/morecommands/raw/master/src/main/resources/assets/morecommands/textures/logo.png")
Mod.create(name: "MoreSnowballs", desc: "MoreSnowballs adds a few snowballs with unique effects", webpage: "https://www.curseforge.com/minecraft/mc-mods/more-snowballs", logo: "https://media-cdn.overwolf.wtf/avatars/176/960/636767575153316345.png")
