fx_version 'cerulean'
game 'gta5'

author 'Last Scripts'
description 'safezone script for fivem rp/pvp server made with love :)'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'config.lua'
}
client_script 'client/main.lua'

dependencies {
    'es_extended',
    'ox_lib'
}
