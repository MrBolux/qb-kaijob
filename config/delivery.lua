
Config.limitDelivery = { min = 5, max = 8 }

Config.deliveryBlip = {
    label = 'Livraison',
    sprite = 280,
    scale = 1.0,
    color = 0
}

Config.deliveryPedMission = {
    coords = vector4(-676.36, -882.91, 24.43, 96.90),
    pedModel = 's_m_y_busboy_01',
    animation = 'WORLD_HUMAN_CLIPBOARD',
    options = {
        {
            type = 'client',
            event = 'qb-kaijob:client:stopDelivery',
            icon = 'fas fa-sign-in-alt',
            label = 'Arreter les livraison',
            job = 'kai',
        },
        {
            type = 'client',
            event = 'qb-kaijob:client:startDelivery',
            icon = 'fas fa-sign-in-alt',
            label = 'Commencer les livraison',
            job = 'kai',
        }
    }
}

Config.deliveryPedLocations = {
    vector4(223.87, -857.82, 30.14, 340.72),
    vector4(-1414.08, -320.16, 44.26, 89.00),
    vector4(-1111.18, -1479.66, 4.86, 33.34),
    vector4(190.15, -1309.50, 29.31, 245.38),
    vector4(962.78, -1786.23, 31.24, 80.45),
    vector4(1083.02, -483.55, 63.89, 80.90),
    vector4(5.94, -984.79, 29.36, 340.23),
    vector4(175.90, 226.25, 106.04, 156.12),
    vector4(-1022.99, 815.22, 172.28, 179.38),
    vector4(-3076.95, 659.50, 11.63, 306.89),
}

Config.deliveryPedModel = {
    'csb_abigail',
    'u_m_y_abner',
    'a_m_y_cyclist_01',
    'a_m_y_gay_02',
    'a_f_y_hipster_04',
    'u_m_y_imporage',
    'cs_josh',
    'u_m_y_pogo_01',
    'a_f_y_soucent_01',
}

Config.deliveryProductAmount = { min = 1, max = 3 }
Config.deliveryProduct = {
    'sushi',
    'kimchi',
    'nems',
    'yakitori',
    'ramen_boeuf',
    'soju',
    'lait_banane',
    'limonadelitchi',
}
