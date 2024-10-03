
-- Config Zones
Config.zones = {
    cutArea = {
        coords = vector3(-669.87, -883.85, 24.64),
        length = 0.8,
        width = 3,
        heading = 89.23,
        animation = {
            animDict = "anim@amb@business@coc@coc_unpack_cut@",
            anim = "fullcut_cycle_v3_cokecutter",
        }
    },
    cookingArea = {
        coords = vector3(-670.10, -885.85, 24.64),
        length = 0.8,
        width = 1.5,
        heading = 358.13,
        animation = {
            animDict = "timetable@ron@ig_4_smoking_meth",
            anim = "chefiscookingup",
        }
    },
    assemblyArea = {
        coords = vector3(-667.38, -885.56, 24.64),
        length = 0.8,
        width = 2.5,
        heading = 268.68,
        animation = {
            animDict = "anim@amb@business@coc@coc_unpack_cut@",
            anim = "fullcut_cycle_v3_cokecutter",
        }
    }
}

-- Config Recipes
Config.recipes = {
    cutArea = {
        piecesalmon = {
            amount = 5,
            requiredItems = {
                salmon = 1,
            }
        },
        piecetrout = {
            amount = 3,
            requiredItems = {
                trout = 1,
            }
        },
        piecechicken = {
            amount = 5,
            requiredItems = {
                chicken = 1,
            }
        },
        piecemeat = {
            amount = 3,
            requiredItems = {
                meat = 1,
            }
        },
        chouxcouper = {
            amount = 2,
            requiredItems = {
                choux = 1,
            }
        }
    },
    cookingArea = {
        rizcuit = {
            amount = 1,
            requiredItems = {
                riz = 1,
            }
        },
        feuilleriz = {
            amount = 1,
            requiredItems = {
                riz = 2,
            }
        },
        oeufdur = {
            amount = 1,
            requiredItems = {
                oeuf = 1,
            }
        },
        ramen_boeuf = {
            amount = 1,
            requiredItems = {
                oeufdur = 2,
                nouille = 3,
                piecemeat = 2,
            }
        },
        yakitori = {
            amount = 1,
            requiredItems = {
                yakitoricrue = 1,
            }
        },
        nems = {
            amount = 1,
            requiredItems = {
                nemscrue = 1,
            }
        },
    },
    assemblyArea = {
        sushi = {
            amount = 1,
            requiredItems = {
                algue = 1,
                rizcuit = 2,
                piecesalmon = 2,
            }
        },
        kimchi = {
            amount = 1,
            requiredItems = {
                chouxcouper = 6,
                epices = 2,
            }
        },
        yakitoricrue = {
            amount = 1,
            requiredItems = {
                fromage = 4,
                piecemeat = 2,
            }
        },
        nemscrue = {
            amount = 1,
            requiredItems = {
                feuilleriz = 1,
                melangelegumes = 1,
                piecechicken = 1,
                piecetrout = 1,
            }
        },
    }
}