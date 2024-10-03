Config = {}
Config.Locale = 'fr'
Config.Debug = false

Config.blips = {
    ['Le Kai'] = {
        coords = vector3(-661.80, -885.79, 24.64),
        sprite = 570,
        scale = 0.7,
        color = 1
    }
}

Config.duty = {
    kai = {
        coords = vector4(-665.98, -882.48, 28.89, 182.03),
        pedModel = 'csb_chef',
    }
}

Config.stash = {
    kai = {
        { -- Frigo
            coords = vector3(-673.25, -882.90, 24.64),
            length = 0.8,
            width = 1.5,
            heading = 90,
            minZ = 23.64,
            maxZ = 26.00,
        },
        { -- Frigo Poissons
            coords = vector3(-672.11, -888.09, 24.64),
            length = 0.8,
            width = 3,
            heading = 180,
            minZ = 23.64,
            maxZ = 24.64,
            option = { maxweight = 500000, slots = 50 }
        },
        { -- Frigo Boisson Mini bar
            coords = vector3(-664.85, -885.10, 24.64),
            length = 0.5,
            width = 3,
            heading = 270,
            minZ = 23.64,
            maxZ = 24.64,
            option = { maxweight = 200000, slots = 50 }
        },
    },
}

Config.clothingRoomsZones = {
    kai = {
        {
            coords = vector3(-665.98, -884.24, 28.89),
            length = 3,
            width = 3,
            heading = 270,
            minZ = 27.89,
            maxZ = 29.89,
        },
    },
}



Config.clothingRoomsOutfit = {
    ['kai'] = {
        [0] = {
            outfitLabel = 'Travail',
            male = {
                outfitData = {
                    ['t-shirt'] = {item = 15, texture = 0, defaultItem = 0, defaultTexture = 0}, -- T Shirt
                    ['torso2'] = {item = 562, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Jacket
                    ['arms'] = {item = 14, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Arms
                    ['decals'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Badge
                    ['vest'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Body Vest
                    ['pants'] = {item = 10, texture = 4, defaultItem = 0, defaultTexture = 0}, -- Pants
                    ['shoes'] = {item = 163, texture = 1, defaultItem = 0, defaultTexture = 0}, -- Shoes
                    ['accessory'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Neck Accessory
                    ['bag'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Bag
                    ['hat'] = {item = -1, texture = -1, defaultItem = 0, defaultTexture = 0}, -- Hat
                    ['glass'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Glasses
                    ['mask'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0} -- Mask
                }
            },
            female = {
                outfitData = {
                    ['t-shirt'] = {item = 14, texture = 0, defaultItem = 0, defaultTexture = 0}, -- T Shirt
                    ['torso2'] = {item = 552, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Jacket
                    ['arms'] = {item = 6, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Arms
                    ['decals'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Badge
                    ['vest'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Body Vest
                    ['pants'] = {item = 6, texture = 1, defaultItem = 0, defaultTexture = 0}, -- Pants
                    ['shoes'] = {item = 139, texture = 1, defaultItem = 0, defaultTexture = 0}, -- Shoes
                    ['accessory'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Neck Accessory
                    ['bag'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Bag
                    ['hat'] = {item = -1, texture = -1, defaultItem = 0, defaultTexture = 0}, -- Hat
                    ['glass'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0}, -- Glasses
                    ['mask'] = {item = 0, texture = 0, defaultItem = 0, defaultTexture = 0} -- Mask
                }
            },
        },
    }
}

Config.bossMenu = {
    kai = {
        {
            coords = vector3(-662.64, -882.64, 28.89),
            length = 1.3,
            width = 2.7,
            heading = 185,
            minZ = 27.89,
            maxZ = 29.89,
        },
    },
}

Config.radialMenu = {
    ["kai"] = {
        {
            id = "entreprise",
            title = "Entreprise",
            icon = "shop",
            items = {
                {
                    id = 'openStore',
                    title = 'Ouvrire',
                    icon = 'door-open',
                    type = 'client',
                    event = 'togolo_lib:client:showAdvancedNotification',
                    params = {
                        global = true,
                        message = 'Le Kai est désormais ouvert !',
                        sender = 'Le Kai',
                        subject = 'Ouvert',
                        textureDict = 'CHAR_MP_MORS_MUTUAL',
                        iconType = 2,
                        color = 18,
                    },
                    shouldClose = true
                },
                {
                    id = 'closeStore',
                    title = 'Fermer',
                    icon = 'door-closed',
                    type = 'client',
                    event = 'togolo_lib:client:showAdvancedNotification',
                    params = {
                        global = true,
                        message = 'Le Kai est désormais fermer !',
                        sender = 'Le Kai',
                        subject = 'Fermer',
                        textureDict = 'CHAR_MP_MORS_MUTUAL',
                        iconType = 2,
                        color = 6,
                    },
                    shouldClose = true
                },
            },
        },
        {
            id = "job",
            title = "Job",
            icon = "screwdriver-wrench",
            items = {
                -- {
                --     id = 'fixvehicle',
                --     title = 'Réparer le véhicule',
                --     icon = 'wrench',
                --     type = 'client',
                --     event = 'qb-mechanicjob:client:RepairVehicleFull',
                --     shouldClose = true
                -- },
                {
                    id = 'emote',
                    title = 'Emote',
                    icon = 'list',
                    items = {
                        {
                            id = 'tablet',
                            title = 'Tablette',
                            icon = 'tablet',
                            type = 'command',
                            event = 'e tablet',
                            shouldClose = true
                        },
                    }
                },
            },
        }
    },
}
