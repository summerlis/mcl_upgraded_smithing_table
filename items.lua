if minetest.get_modpath("mcl_tools") then
	-- Swords
	minetest.override_item("mcl_tools:sword_wood", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_core:cobble",
		_mcl_upgrade_item_name = {"wood", "stone"},
	})

	minetest.override_item("mcl_tools:sword_stone", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_core:iron_ingot",
		_mcl_upgrade_item_name = {"stone", "iron"},
	})

	minetest.override_item("mcl_tools:sword_iron", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_core:gold_ingot",
		_mcl_upgrade_item_name = {"iron", "gold"},
	})

	minetest.override_item("mcl_tools:sword_gold", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_core:diamond",
		_mcl_upgrade_item_name = {"gold", "diamond"},
	})

	minetest.override_item("mcl_tools:sword_diamond", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_nether:netherite_ingot",
		_mcl_upgrade_item_name = {"diamond", "netherite"},
	})

	-- Shovels
	minetest.override_item("mcl_tools:shovel_wood", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_core:cobble",
		_mcl_upgrade_item_name = {"wood", "stone"},
	})

	minetest.override_item("mcl_tools:shovel_stone", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_core:iron_ingot",
		_mcl_upgrade_item_name = {"stone", "iron"},
	})

	minetest.override_item("mcl_tools:shovel_iron", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_core:gold_ingot",
		_mcl_upgrade_item_name = {"iron", "gold"},
	})

	minetest.override_item("mcl_tools:shovel_gold", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_core:diamond",
		_mcl_upgrade_item_name = {"gold", "diamond"},
	})

	minetest.override_item("mcl_tools:shovel_diamond", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_nether:netherite_ingot",
		_mcl_upgrade_item_name = {"diamond", "netherite"},
	})

	-- Axes
	minetest.override_item("mcl_tools:axe_wood", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_core:cobble", "wood", "stone", 2},
		},
	})

	minetest.override_item("mcl_tools:axe_stone", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_core:iron_ingot", "stone", "iron", 2},
		},
	})

	minetest.override_item("mcl_tools:axe_iron", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_core:gold_ingot", "iron", "gold", 2},
		},
	})

	minetest.override_item("mcl_tools:axe_gold", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_core:diamond", "gold", "diamond", 1},
		},
	})

	minetest.override_item("mcl_tools:axe_diamond", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_nether:netherite_ingot", "diamond", "netherite", 1},
		},
	})

	-- Pickaxes
	minetest.override_item("mcl_tools:pick_wood", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_core:cobble", "wood", "stone", 2},
		},
	})

	minetest.override_item("mcl_tools:pick_stone", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_core:iron_ingot", "stone", "iron", 2},
		},
	})

	minetest.override_item("mcl_tools:pick_iron", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_core:gold_ingot", "iron", "gold", 2},
		},
	})

	minetest.override_item("mcl_tools:pick_gold", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_core:diamond", "gold", "diamond", 2},
		},
	})

	minetest.override_item("mcl_tools:pick_diamond", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_nether:netherite_ingot", "diamond", "netherite", 1},
		},
	})
end

if minetest.get_modpath("mcl_farming") then
	-- Hoes
	minetest.override_item("mcl_farming:hoe_wood", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_core:cobble",
		_mcl_upgrade_item_name = {"wood", "stone"},
	})

	minetest.override_item("mcl_farming:hoe_stone", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_core:iron_ingot",
		_mcl_upgrade_item_name = {"stone", "iron"},
	})

	minetest.override_item("mcl_farming:hoe_iron", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_core:gold_ingot",
		_mcl_upgrade_item_name = {"iron", "gold"},
	})

	minetest.override_item("mcl_farming:hoe_gold", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_core:diamond",
		_mcl_upgrade_item_name = {"gold", "diamond"},
	})

	minetest.override_item("mcl_farming:hoe_diamond", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_nether:netherite_ingot",
		_mcl_upgrade_item_name = {"diamond", "netherite"},
	})
end

if minetest.get_modpath("mcl_armor") then
	-- Chain Armor
	minetest.override_item("mcl_armor:helmet_chain", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_core:iron_ingot",
		_mcl_upgrade_item_name = {"chain", "iron"},
	})

	minetest.override_item("mcl_armor:chestplate_chain", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_core:iron_ingot",
		_mcl_upgrade_item_name = {"chain", "iron"},
	})

	minetest.override_item("mcl_armor:leggings_chain", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_core:iron_ingot",
		_mcl_upgrade_item_name = {"chain", "iron"},
	})

	minetest.override_item("mcl_armor:boots_chain", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_core:iron_ingot",
		_mcl_upgrade_item_name = {"chain", "iron"},
	})

	-- Iron Armor
	minetest.override_item("mcl_armor:helmet_iron", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_core:gold_ingot", "iron", "gold", 3},
		},
	})

	minetest.override_item("mcl_armor:chestplate_iron", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_core:gold_ingot", "iron", "gold", 4},
		},
	})

	minetest.override_item("mcl_armor:leggings_iron", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_core:gold_ingot", "iron", "gold", 4},
		},
	})

	minetest.override_item("mcl_armor:boots_iron", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_core:gold_ingot", "iron", "gold", 2},
		},
	})

	-- Gold Armor
	minetest.override_item("mcl_armor:helmet_gold", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_core:diamond", "gold", "diamond", 3},
		},
	})

	minetest.override_item("mcl_armor:chestplate_gold", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_core:diamond", "gold", "diamond", 4},
		},
	})

	minetest.override_item("mcl_armor:leggings_gold", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_core:diamond", "gold", "diamond", 4},
		},
	})

	minetest.override_item("mcl_armor:boots_gold", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_core:diamond", "gold", "diamond", 2},
		},
	})

	-- Diamond Armor
	minetest.override_item("mcl_armor:helmet_diamond", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_nether:netherite_ingot", "diamond", "netherite", 1},
		},
	})

	minetest.override_item("mcl_armor:chestplate_diamond", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_nether:netherite_ingot", "diamond", "netherite", 1},
		},
	})

	minetest.override_item("mcl_armor:leggings_diamond", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_nether:netherite_ingot", "diamond", "netherite", 1},
		},
	})

	minetest.override_item("mcl_armor:boots_diamond", {
		_mcl_upgradable = true,
		_mcl_upgrade_items = {
			{"mcl_nether:netherite_ingot", "diamond", "netherite", 1},
		},
	})
end

if minetest.get_modpath("mcl_mobitems") then
	-- Hors Armor
	minetest.override_item("mcl_mobitems:iron_horse_armor", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_core:gold_ingot",
		_mcl_upgrade_item_name = {"iron", "gold"},
	})

	minetest.override_item("mcl_mobitems:gold_horse_armor", {
		_mcl_upgradable = true,
		_mcl_upgrade_item_material = "mcl_core:diamond",
		_mcl_upgrade_item_name = {"gold", "diamond"},
	})
end

-- Upgrade Items
minetest.override_item("mcl_core:cobble", {
	groups = {pickaxey=1, building_block=1, material_stone=1, cobble=1, upgrade_material=1},
})

minetest.override_item("mcl_core:iron_ingot", {
	groups = {craftitem=1, upgrade_material=1},
})

minetest.override_item("mcl_core:gold_ingot", {
	groups = {craftitem=1, upgrade_material=1},
})

minetest.override_item("mcl_core:diamond", {
	groups = {craftitem=1, upgrade_material=1},
})

minetest.override_item("mcl_nether:netherite_ingot", {
	groups = {craftitem = 1, fire_immune=1, upgrade_material=1},
})
