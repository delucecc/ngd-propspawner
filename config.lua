Config = {}

Config.Persistent = true --Spawn props on player load.
Config.FrameWork = 'qb'  --qb or esx
Config.debug = false     --Enables prints and commands below.
Config.SpawnCommand = 'spawnprops'
Config.DeleteCommand = 'deleteprops'

Config.PropLocations = {
    [1] = { coords = vector4(-1652.76, -3143.40, 13.99, 76), model = `bkr_prop_clubhouse_jukebox_02a` },
    [2] = { coords = vector4(-1658.76, -3143.40, 13.99, 76), model = `hei_prop_heist_box` },
}
