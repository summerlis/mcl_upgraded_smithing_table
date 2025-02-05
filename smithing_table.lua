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

function mcl_smithing_table.upgrade_item_netherite(itemstack, material)
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
	mcl_armor.reload_trim_inv_image(itemstack)

	-- Reload the ToolTips of the tool

	tt.reload_itemstack_description(itemstack)

	-- Only return itemstack if upgrade was successfull
	return itemstack
end

local function reset_upgraded_item(pos)
	local inv = minetest.get_meta(pos):get_inventory()
	local upgraded_item
	local upgrade_item_stack = inv:get_stack("upgrade_item", 1)
	local mineral_stack = inv:get_stack("mineral", 1)
	local upgradeitems

	local original_itemname = inv:get_stack("upgrade_item", 1):get_name()
	local template_present = inv:get_stack("template",1):get_name() ~= ""
	local is_armor = original_itemname:find("mcl_armor:") ~= nil
	local is_trimmed = original_itemname:find("_trimmed") ~= nil

	if template_present then
		if template_present and is_armor and not is_trimmed and mcl_smithing_table.is_smithing_mineral(inv:get_stack("mineral", 1):get_name()) then
			upgraded_item = mcl_smithing_table.upgrade_trimmed(upgrade_item_stack,inv:get_stack("mineral", 1),inv:get_stack("template", 1))
		end
	else
		if upgrade_item_stack:get_definition()._mcl_upgrade_item_material then
			if mineral_stack:get_name() == upgrade_item_stack:get_definition()._mcl_upgrade_item_material then
				upgraded_item = mcl_smithing_table.upgrade_item_netherite(inv:get_stack("upgrade_item", 1), 1)
			end
		elseif upgrade_item_stack:get_definition()._mcl_upgrade_items then
			upgradeitems = upgrade_item_stack:get_definition()._mcl_upgrade_items

			for i = 1, #upgradeitems do
				if upgradeitems[i][1] == mineral_stack:get_name() and upgradeitems[i][4] <= mineral_stack:get_count() then
					upgraded_item = mcl_smithing_table.upgrade_item_netherite(inv:get_stack("upgrade_item", 1), i)
					break
				end
			end
		end
	end
	inv:set_stack("upgraded_item", 1, upgraded_item)

end

minetest.override_item("mcl_smithing_table:table", {
	on_metadata_inventory_put = reset_upgraded_item,

	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		local stackname = stack:get_name()
		local def = stack:get_definition()

		if (listname == "upgrade_item" and (def._mcl_upgradable or (def._mcl_armor_element and not mcl_armor.trims.blacklisted[stackname])))
		or (listname == "mineral" and (stack:get_definition().groups.upgrade_material ~= nil or mcl_smithing_table.is_smithing_mineral(stackname)))
		or (listname == "template" and string.find(stack:get_name(), "mcl_armor"))
		then
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
			local ddef = inv:get_stack("upgrade_item", 1):get_definition()
			
			take_item("upgrade_item")

			if ddef._mcl_upgrade_items then
				ddef = ddef._mcl_upgrade_items
				for i = 1, #ddef do
					if ddef[i][1] == inv:get_stack("mineral", 1):get_name() then
						for i = 1, ddef[i][4] do
							take_item("mineral")
						end
						break
					end
				end
			else
				take_item("mineral")
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
