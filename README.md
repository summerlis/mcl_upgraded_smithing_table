# Upgraded Smithing Tables for MineClone 2
### Modified version of mcl_upgraded_smithing_table (by mt-mods) that allows for differently sized upgrade material requirements, multiple different upgrades for a single item, and fixes a crash with mod-ids being overwritten by material names.
### NOTE: Currently doesn't support custom recipies with armor trims.
This mod adds the ability to upgrade all the other tiers of tools and armor besides the usual diamond armor.

Supported upgrade items include:
* Wood -> Stone
* Chain Mail -> Iron
* Stone -> Iron
* Iron -> Gold
* Gold -> Diamond
* Diamond -> Netherite

## API
To use these changes, you need to add the following lines to your definition.
```lua
_mcl_upgradable = true,
_mcl_upgrade_item_material = final_material,
_mcl_upgrade_item_name = {upgraded_material_name, final_material_name},

-- or:

_mcl_upgradable = true,
_mcl_upgrade_items = {
    {final_material, upgraded_material_name, final_material_name, final_material_amount}, -- and / or
    {final_material2, upgraded_material_name, final_material_name2, final_material_amount, modname_override},
},
```
This API relies on the item strings to be close other than the material name.

Replace the `_mcl_upgrade_item_material` paramter to the upgrade material to use. For example, to upgrade a wood sword to stone sword, this paramater would be "mcl_core:cobble". The upgrade material should also be in the `upgrade_material` group for this to work.

Replace the `_mcl_upgrade_item_name` paramter in the following pattern: first part is the material type for item the line is in; while the second line is the material type of the upgraded item. For example, to upgrade a wood sword to stone sword, the defintion would be `{"wood", "stone"}`.

## License
GNU General Public License

## Credits
Original mod by mt-mods
Special thank you to Fleckentstein and Code-Sploit for writing the original mcl_smithing_table mod.

## Contributing
Found a bug or want a mod to work with this mod? Submit an issue on the [bug tracker](https://codeberg.org/PrairieWind/mcl_upgraded_smithing_table/issues). If you have a code fix, create a [pull request](https://codeberg.org/PrairieWind/mcl_upgraded_smithing_table/pulls) or post the code in an issue on the bug tracker.
