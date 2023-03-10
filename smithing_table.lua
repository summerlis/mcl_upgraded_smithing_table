-- Function to upgrade armor to next level
function mcl_smithing_table.upgrade_item(itemstack)
	local def = itemstack:get_definition()

	if not def or not def._mcl_upgradable then
		return
	end
	local itemname = itemstack:get_name()
	local item_change = def._mcl_upgrade_item_name
	local upgrade_item = itemname:gsub(item_change[1], item_change[2])

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

	if netherite_stack:get_name() == diamond_stack:get_definition()._mcl_upgrade_item_material then
		upgraded_item = mcl_smithing_table.upgrade_item(inv:get_stack("diamond_item", 1))
	end

	inv:set_stack("upgraded_item", 1, upgraded_item)
end

minetest.override_item("mcl_smithing_table:table", {
	on_metadata_inventory_put = reset_upgraded_item,
	allow_metadata_inventory_put = function(pos, listname, index, stack, player)
		if (listname == "diamond_item" and mcl_smithing_table.upgrade_item(stack)) or (listname == "netherite" and stack:get_definition().groups.upgrade_material ~= nil) then
			return stack:get_count()
		end

		return 0
	end,
})
