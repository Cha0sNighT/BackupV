resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

description 'ESX Car Thief Job'

version '1.0.0'

client_scripts {
'@es_extended/locale.lua',
  'locales/br.lua',
  'locales/en.lua',
  'locales/fr.lua',
  'locales/es.lua',
  'config.lua',
  'client/main.lua'
}

server_scripts {
'@es_extended/locale.lua',
'@mysql-async/lib/MySQL.lua',
  'locales/br.lua',
  'locales/en.lua',
  'locales/fr.lua',
  'locales/es.lua',
  'config.lua',
  'server/main.lua'
}
