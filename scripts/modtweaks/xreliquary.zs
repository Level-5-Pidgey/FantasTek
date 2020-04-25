print("~~~ Begin xReliquary Init ~~~");

//Hide Unused Items
val lootItems =
[
	<xreliquary:salamander_eye>,
	<xreliquary:serpent_staff>,
	<xreliquary:sojourner_staff>,
	<xreliquary:magicbane>,
	<xreliquary:phoenix_down>,
	<xreliquary:pyromancer_staff>,
	<xreliquary:rod_of_lyssa>,
	<xreliquary:midas_touchstone>,
	<xreliquary:lantern_of_paranoia>,
	<xreliquary:kraken_shell>,
	<xreliquary:infernal_tear>,
	<xreliquary:infernal_claws>,
	<xreliquary:infernal_chalice>,
	<xreliquary:ice_magus_rod>,
	<xreliquary:harvest_rod>,
	<xreliquary:glacial_staff>,
	<xreliquary:fortune_coin>,
	<xreliquary:ender_staff>,
	<xreliquary:emperor_chalice>,
	<xreliquary:angelic_feather>,
	<xreliquary:mercy_cross>,
	<xreliquary:destruction_catalyst>,
	<xreliquary:gun_part:1>,
	<xreliquary:gun_part:2>,
	<xreliquary:gun_part>
] as crafttweaker.item.IItemStack[];

for item in lootItems
{
	recipes.remove(item);
	scripts.helpers.AddTooltip(item, ["This item can be found within dungeon chests!"]);
}

//Change Handgun Recipe
recipes.remove(<xreliquary:handgun>);
recipes.addShaped(scripts.helpers.createRecipeName(<xreliquary:handgun>), <xreliquary:handgun>, [[<xreliquary:gun_part:1>, <ore:ingotIron>, <xreliquary:gun_part:2>], [<ore:ingotIron>, <ore:gemDiamond>, <ore:ingotIron>], [<ore:plateSteel>, <xreliquary:gun_part>, <ore:plateSteel>]]);
print("### xReliquary Init Complete ###");