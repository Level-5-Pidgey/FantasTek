
print("~~~ Begin Blood Magic Init ~~~");

//Make T1 Slates require Marble Rather than
mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:stone>);
for ore in <ore:blockMarble>.items
{
  mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:slate>, ore, 0, 1000, 25, 15);
}

//Crafting Recipe Changes
val bloodMagic_CRAFTINGTABLE = {
		<bloodmagic:soul_snare> * 6 : [[<ore:string>, <ore:ingotConductiveIron>, <ore:string>], [<ore:ingotConductiveIron>, scripts.helpers.BiomeGemMaterial["gem"], <ore:ingotConductiveIron>], [<ore:string>, <ore:ingotConductiveIron>, <ore:string>]],
		<bloodmagic:altar> : [[<ore:stoneBasalt>, null, <ore:stoneBasalt>], [<ore:stoneBasalt>, <minecraft:bucket>, <ore:stoneBasalt>], [<ore:plateRedstoneAlloy>, <bloodmagic:monster_soul>, <ore:plateRedstoneAlloy>]],
		<bloodmagic:sacrificial_dagger> : [[<ore:nuggetPrismarine>, <ore:nuggetPrismarine>, <ore:nuggetPrismarine>], [null, <betternether:cincinnasite>, <ore:nuggetPrismarine>], [<ore:obsidian>, null, <ore:nuggetPrismarine>]],
		<bloodmagic:pack_sacrifice> : [[<ore:blockGlass>, null, <ore:blockGlass>], [<ore:ingotConductiveIron>, <minecraft:chainmail_chestplate>, <ore:ingotConductiveIron>], [<ore:blockGlass>, <bloodmagic:slate>, <ore:blockGlass>]],
		<bloodmagic:pack_self_sacrifice> : [[<ore:blockGlass>, null, <ore:blockGlass>], [<ore:ingotConductiveIron>, <mekanismtools:lapislazulichestplate>, <ore:ingotConductiveIron>], [<ore:blockGlass>, <bloodmagic:slate>, <ore:blockGlass>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in bloodMagic_CRAFTINGTABLE {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

val bloodMagic_EXTREMECRAFTING = {
		<bloodmagic:soul_forge> : [[<ore:ingotElectrotineAlloy>, null, <ore:ingotElectrotineAlloy>], [<ore:stoneBasalt>, <ore:plateGold>, <ore:stoneBasalt>], [<ore:stoneBasalt>, <betternether:cincinnasite_forge>, <ore:stoneBasalt>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in bloodMagic_EXTREMECRAFTING {
	recipes.remove(key.withAmount(1));
	mods.extendedcrafting.TableCrafting.addShaped(0, key, value);
}

//Blood Alar Recipe Removal
val bloodMagicAltarRemoval =
[
	<minecraft:iron_sword>,
	<minecraft:diamond>,
] as crafttweaker.item.IItemStack[];

for inputItem in bloodMagicAltarRemoval {
	mods.bloodmagic.BloodAltar.removeRecipe(inputItem);
}

//Blood Altar Recipe Additions
val bloodMagicAltarCrafting = {
		[/*Input*/<natura:bloodwood_sword>, /*Output*/ <bloodmagic:dagger_of_sacrifice>] : [/*Tier Required*/ 0, /*LP Required*/ 500, /*Drain Rate*/ 50, /*Syphon Rate*/ 50 ],
} as int[][crafttweaker.item.IItemStack[]];

for items, values in bloodMagicAltarCrafting {
	mods.bloodmagic.BloodAltar.addRecipe(items[1], items[0], values[0], values[1], values[2], values[3]);
	if(values[1] <= 1000 && values[0] < 1)
	{
		mods.inworldcrafting.FluidToItem.transform(items[1], <liquid:lifeessence>, [items[0]], true);
	}
}

//T1 Blood Orb Crafting
for block in scripts.helpers.BiomeGemMaterial["block"].items
{
	mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:weak"}), block, 0, 1000, 4, 2);
}

//Sentient Sword
mods.bloodmagic.TartaricForge.removeRecipe([<bloodmagic:soul_gem>, <minecraft:iron_sword>]);
mods.bloodmagic.TartaricForge.addRecipe(<bloodmagic:sentient_sword>, [<bloodmagic:soul_gem>, <minecraft:diamond_sword>, <contenttweaker:sanguine_ingot>, <contenttweaker:sanguine_ingot>], 0,0);

//Petty Gem
mods.bloodmagic.TartaricForge.removeRecipe([<minecraft:redstone>, <minecraft:gold_ingot>, <minecraft:glass>, <minecraft:dye:4>]);
mods.bloodmagic.TartaricForge.addRecipe(<bloodmagic:soul_gem>, [<ore:gemSanguine>, <ore:dustElectrotine>, <ore:dustElectrotine>, <ore:nuggetPrismarine>], 1,1);

//Lesser Gem
mods.bloodmagic.TartaricForge.removeRecipe([<bloodmagic:soul_gem>, <minecraft:diamond>, <minecraft:redstone_block>, <minecraft:lapis_block>]);
for bloodGem in scripts.helpers.GetBloodMagicCraftingMaterials(1).items
{
	mods.bloodmagic.TartaricForge.addRecipe(<bloodmagic:soul_gem:1>, [<bloodmagic:soul_gem>, bloodGem, <ore:blockRedstone>, <ore:blockLapis>], 60, 20);
}

//Void
mods.bloodmagic.TartaricForge.removeRecipe([<minecraft:bucket>, <minecraft:string>, <minecraft:string>, <minecraft:gunpowder>]);
mods.bloodmagic.TartaricForge.addRecipe(<bloodmagic:component:4>, [<minecraft:bucket>, <ore:ingotPulsatingIron>, <contenttweaker:sanguine_gem_water>, <ore:blockGlass>], 128, 64);
mods.bloodmagic.AlchemyArray.removeRecipe(<bloodmagic:component:4>, <bloodmagic:slate:1>);
mods.bloodmagic.AlchemyArray.addRecipe(<bloodmagic:sigil_void>, <bloodmagic:component:4>, <bloodmagic:slate>);

//Blood Lamp
mods.bloodmagic.TartaricForge.removeRecipe([<minecraft:glowstone>, <minecraft:torch>, <minecraft:redstone>, <minecraft:redstone>]);
mods.bloodmagic.TartaricForge.addRecipe(<bloodmagic:component:11>, [<ore:blockGlowstone>, <ore:blockGlowstone>, <betternether:cincinnasite>, <ore:torch>], 128, 64);
mods.bloodmagic.AlchemyArray.removeRecipe(<bloodmagic:component:11>, <bloodmagic:slate:2>);
mods.bloodmagic.AlchemyArray.addRecipe(<bloodmagic:sigil_blood_light>, <bloodmagic:component:11>, <bloodmagic:slate>);

//Water
mods.bloodmagic.TartaricForge.removeRecipe([<minecraft:sugar>, <minecraft:water_bucket>, <minecraft:water_bucket>]);
mods.bloodmagic.TartaricForge.addRecipe(<bloodmagic:component>, [<minecraft:water_bucket>, <ore:nuggetPrismarine>, <ore:plateGold>, <ore:nuggetPrismarine>], 10, 8);

//Phantom Bridge
mods.bloodmagic.TartaricForge.removeRecipe([<minecraft:soul_sand>, <minecraft:soul_sand>, <minecraft:stone>, <minecraft:obsidian>]);
mods.bloodmagic.TartaricForge.addRecipe(<bloodmagic:component:15>, [<minecraft:chorus_fruit_popped>, <ore:blockGlass>, <ore:blockGlass>, <ore:enderpearl>], 128, 64);
mods.bloodmagic.AlchemyArray.removeRecipe(<bloodmagic:component:15>, <bloodmagic:slate:2>);
mods.bloodmagic.AlchemyArray.addRecipe(<bloodmagic:sigil_phantom_bridge>, <bloodmagic:component:15>, <bloodmagic:slate>);

print("### Blood Magic Init Complete ###");
