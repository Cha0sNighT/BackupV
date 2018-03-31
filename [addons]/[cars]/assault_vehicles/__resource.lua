resource_manifest_version "44febabe-d386-4d18-afbe-5e627f4af937"



files {
  'data/ai/vehiclelayouts.meta',
  'data/ai/vehicleweapons_caracara.meta',
  'data/anim/clip_sets/clip_sets.xml',
  'data/levels/gta5/vehicles.meta',
  'data/carcols.meta',
  'data/carvariations.meta',
  'data/handling.meta',
  'audio/sfx/dlc_assault/as_trp_01.awc',
  'audio/sfx/dlc_assault/as_trp_02.awc',
  'audio/sfx/dlc_assault/as_vnt_01.awc',
  'audio/sfx/dlc_assault/as_vnt_02.awc',
  'audio/sfx/dlc_assault/caracara.awc',
  'audio/sfx/dlc_assault/caracara_npc.awc',
  'audio/sfx/dlc_assault/cheburek.awc',
  'audio/sfx/dlc_assault/cheburek_npc.awc',
  'audio/sfx/dlc_assault/dominator3.awc',
  'audio/sfx/dlc_assault/dominator3_npc.awc',
  'audio/sfx/dlc_assault/ellie.awc',
  'audio/sfx/dlc_assault/ellie_npc.awc',
  'audio/sfx/dlc_assault/entity2.awc',
  'audio/sfx/dlc_assault/entity2_npc.awc',
  'audio/sfx/dlc_assault/fagaloa.awc',
  'audio/sfx/dlc_assault/fagaloa_npc.awc',
  'audio/sfx/dlc_assault/flashgt.awc',
  'audio/sfx/dlc_assault/flashgt_npc.awc',
  'audio/sfx/dlc_assault/gb200.awc',
  'audio/sfx/dlc_assault/gb200_npc.awc',
  'audio/sfx/dlc_assault/hotring.awc',
  'audio/sfx/dlc_assault/hotring_npc.awc',
  'audio/sfx/dlc_assault/issi3.awc',
  'audio/sfx/dlc_assault/issi3_npc.awc',
  'audio/sfx/dlc_assault/jester3.awc',
  'audio/sfx/dlc_assault/jester3_npc.awc',
  'audio/sfx/dlc_assault/michelli.awc',
  'audio/sfx/dlc_assault/michelli_npc.awc',
  'audio/sfx/dlc_assault/taipan.awc',
  'audio/sfx/dlc_assault/taipan_npc.awc',
  'audio/sfx/dlc_assault/target_assault_01.awc',
  'audio/sfx/dlc_assault/target_assault_02.awc',
  'audio/sfx/dlc_assault/tyrant.awc',
  'audio/sfx/dlc_assault/tyrant_npc.awc',
  'data/effects/peds/first_person_alternates.meta',
  'audio/dlcassault_amp.dat10',
  'audio/dlcassault_amp.dat10.nametable',
  'audio/dlcassault_amp.dat10.rel',
  'audio/dlcassault_game.dat151',
  'audio/dlcassault_game.dat151.nametable',
  'audio/dlcassault_game.dat151.rel',
  'audio/dlcassault_mix.dat15',
  'audio/dlcassault_mix.dat15.nametable',
  'audio/dlcassault_mix.dat15.rel',
  'audio/dlcassault_sounds.dat54',
  'audio/dlcassault_sounds.dat54.nametable',
  'audio/dlcassault_sounds.dat54.rel',
  'audio/dlcassault_speech.dat4',
  'audio/dlcassault_speech.dat4.nametable',
  'audio/dlcassault_speech.dat4.rel', 
  'data/overlayinfo.xml',
  'data/shop_vehicle.meta',
}
data_file 'VEHICLE_LAYOUTS_FILE' 'data/ai/vehiclelayouts.meta'


data_file 'WEAPONINFO_FILE' 'data/ai/vehicleweapons_caracara.meta'
data_file 'CLIP_SETS_FILE' 'data/anim/clip_sets/clip_sets.xml'
data_file 'HANDLING_FILE' 'data/handling.meta'
data_file 'VEHICLE_METADATA_FILE' 'data/levels/gta5/vehicles.meta'
data_file 'CARCOLS_FILE' 'data/carcols.meta'
data_file 'VEHICLE_VARIATION_FILE' 'data/carvariations.meta'
data_file 'VEHICLE_SHOP_DLC_FILE' 'data/shop_vehicle.meta'

data_file 'AUDIO_WAVEPACK' 'audio/sfx/dlc_assault'
data_file 'AUDIO_SYNTHDATA' 'audio/dlcassault_amp.dat'
data_file 'AUDIO_GAMEDATA' 'audio/dlcassault_game.dat'
data_file 'AUDIO_SOUNDDATA' 'audio/dlcassault_sounds.dat'
data_file 'PED_FIRST_PERSON_ALTERNATE_DATA' 'data/effects/peds/first_person_alternates.meta'


client_script 'names.lua'