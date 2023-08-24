-- Function to upgrade armor to next level

function replace_modname(itemname, modname)
	local a,b = itemname:find(":")
    local itemname_reduced = itemname:sub(a, itemname:len())
	return modname .. itemname_reduced
end

function modname_from_itemname(itemname)
    local a,b = itemname:find(":")
    local result = itemname:sub(0, a - 1)
    return result
end

function mcl_smithing_table.upgrade_item(itemstack, material)
	local def = itemstack:get_definition()

	if not def or not def._mcl_upgradable or (material == nil and def._mcl_upgrade_items) then
		return
	end

	local modname_old = modname_from_itemname(itemstack:get_name())
	local itemname = itemstack:get_name()
	local itemname_stripped = replace_modname(itemname, "")

	local upgrade_item = nil
	local item_change = nil

	if def._mcl_upgrade_item_name then
		item_change = def._mcl_upgrade_item_name
		upgrade_item = itemname_stripped:gsub(item_change[1], item_change[2])
		upgrade_item = modname_old .. upgrade_item
	else
		item_change = def._mcl_upgrade_items[material]
		upgrade_item = itemname_stripped:gsub(item_change[2], item_change[3])
		if item_change[5] then
			upgrade_item = item_change[5] .. upgrade_item
		else
			upgrade_item = modname_old .. upgrade_item
		end
	end

	if def._mcl_upgrade_item and upgrade_item == itemname then
		return
	end

	itemstack:set_name(upgrade_item)

	-- Reload the ToolTips of the tool

	tt.reload_itemstack_description(itemstack)

	-- Only return itemstack if upgrade was successfull
	return itemstack
end


local function reset_upgraded_item(pos)
	local inv = minetest.get_meta(pos):get_inventory()
	local upgraded_item
	local diamond_stack = inv:get_stack("diamond_item", 1)
	local netherite_stack = inv:get_stack("netherite", 1)
	local dstack_upgradeitems

	if diamond_stack:get_definition()._mcl_upgrade_item_material then
		if netherite_stack:get_name() == diamond_stack:get_definition()._mcl_upgrade_item_material then
			upgraded_item = mcl_smithing_table.upgrade_item(inv:get_stack("diamond_item", 1), 1)
		end
	elseif diamond_stack:get_definition()._mcl_upgrade_items then
		dstack_upgradeitems = diamond_stack:get_definition()._mcl_upgrade_items

		for i = 1, #dstack_upgradeitems do
			if dstack_upgradeitems[i][1] == netherite_stack:get_name() and dstack_upgradeitems[i][4] <= netherite_stack:get_count() then
				upgraded_item = mcl_smithing_table.upgrade_item(inv:get_stack("diamond_item", 1), i)
				break
			end
		end
	end

	inv:set_stack("upgraded_item", 1, upgraded_item)

end

minetest.override_item("mcl_smithing_table:table", {
	on_metadata_inventory_put = reset_upgraded_item,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if (listname == "diamond_item" and mcl_smithing_table.upgrade_item(stack, 1)) or (listname == "netherite" and stack:get_definition().groups.upgrade_material ~= nil) then
			return stack:get_count()
		end

		return 0
	end,

	on_metadata_inventory_take = function(pos, listname, index, stack, player)
		local inv = minetest.get_meta(pos):get_inventory()

		local function take_item(listname)
			local itemstack = inv:get_stack(listname, 1)
			itemstack:take_item()
			inv:set_stack(listname, 1, itemstack)
		end

		if listname == "upgraded_item" then
			local ddef = inv:get_stack("diamond_item", 1):get_definition()
			
			take_item("diamond_item")

			if ddef._mcl_upgrade_items then
				ddef = ddef._mcl_upgrade_items
				for i = 1, #ddef do
					if ddef[i][1] == inv:get_stack("netherite", 1):get_name() then
						for i = 1, ddef[i][4] do
							take_item("netherite")
						end
						break
					end
				end
			else
				take_item("netherite")
			end

			-- ToDo: make epic sound
			minetest.sound_play("mcl_smithing_table_upgrade", {pos = pos, max_hear_distance = 16})
		end
		if listname == "upgraded_item" then
			if stack:get_name() == "mcl_farming:hoe_netherite" then
				awards.unlock(player:get_player_name(), "mcl:seriousDedication")
			end
		end

		reset_upgraded_item(pos)
	end,
})
