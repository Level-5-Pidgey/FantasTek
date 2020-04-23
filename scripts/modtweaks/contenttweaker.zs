import mods.dropt.Dropt;

print("~~~ Begin ContentTweaker recipes Init ~~~");

//Steel Blend Crafting
recipes.addShaped(scripts.helpers.createRecipeName(<contenttweaker:steel_blend>), <contenttweaker:steel_blend> * 2, [[<contenttweaker:coke_dust>, <ore:dustIron>, <contenttweaker:coke_dust>],[<contenttweaker:coke_dust>, <ore:dustIron>, <contenttweaker:coke_dust>], [<contenttweaker:coke_dust>, <ore:dustIron>, <contenttweaker:coke_dust>]]);

//Melt Steel Blend into Crude Steel
mods.tconstruct.Melting.addRecipe(<liquid:crude_steel> * 144, <contenttweaker:steel_blend>, 450);

//Cast Crude Steel into Ingots or Blocks or Nuggets
mods.tconstruct.Casting.addTableRecipe(<ore:ingotCrudeSteel>.firstItem, <tconstruct:cast_custom>, <liquid:crude_steel>, 144, false);
mods.tconstruct.Casting.addTableRecipe(<ore:nuggetCrudeSteel>.firstItem, <tconstruct:cast_custom:1>, <liquid:crude_steel>, 16, false);
mods.tconstruct.Casting.addBasinRecipe(<ore:blockCrudeSteel>.firstItem, null, <liquid:crude_steel>, 1296);

//Add Plate Press for Wooden Boards
for wood in <ore:logWood>.items
{
	mods.advancedrocketry.PlatePresser.addRecipe(<contenttweaker:wood_plate> * 2, wood);
}

//Add Prismarine Shard Crafting
for prismarine in <ore:prismarine>.items
{
	mods.advancedrocketry.PlatePresser.addRecipe(<contenttweaker:prismarine_nugget> * 16, prismarine);
	scripts.helpers.AddTooltip(prismarine, ["Prismarine can be found in Ocean Monuments,", "or obtained by mining Prismarine Boulders", "found on the seabed."]);
}
recipes.addShapeless(scripts.helpers.createRecipeName(<contenttweaker:prismarine_nugget>), <contenttweaker:prismarine_nugget> * 2, [<embers:tinker_hammer>, <ore:shardPrismarine>]);

//Add Tooltip for Artifact
scripts.helpers.AddTooltip(<contenttweaker:strange_treasure>, ["Rare treasure that villagers may have a bounty for!", "Can be sold for a high price."]);

//Thaumcraft Infused Stones
//Changing block drops
Dropt.list("thaumcraft_crystal_ores")

	.add(Dropt.rule()
		.matchBlocks(["contenttweaker:infused_stone_aer"])
		.addDrop(Dropt.drop()
		.items([<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aer"}]})], Dropt.range(1, 3))
	))
	.add(Dropt.rule()
		.matchBlocks(["contenttweaker:infused_stone_aqua"])
		.addDrop(Dropt.drop()
		.items([<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aqua"}]})], Dropt.range(1, 3))
	))
	.add(Dropt.rule()
		.matchBlocks(["contenttweaker:infused_stone_ignis"])
		.addDrop(Dropt.drop()
		.items([<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ignis"}]})], Dropt.range(1, 3))
	))
	.add(Dropt.rule()
		.matchBlocks(["contenttweaker:infused_stone_ordo"])
		.addDrop(Dropt.drop()
		.items([<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ordo"}]})], Dropt.range(1, 3))
	))
	.add(Dropt.rule()
		.matchBlocks(["contenttweaker:infused_stone_perditio"])
		.addDrop(Dropt.drop()
		.items([<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "perditio"}]})], Dropt.range(1, 3))
	))
	.add(Dropt.rule()
		.matchBlocks(["contenttweaker:infused_stone_terra"])
		.addDrop(Dropt.drop()
		.items([<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "terra"}]})], Dropt.range(1, 3))
	))
	.add(Dropt.rule()
		.matchBlocks(["contenttweaker:infused_stone_vitium"])
		.addDrop(Dropt.drop()
		.items([<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]})], Dropt.range(1, 3))
	));

//Adding Smelting Recipes
furnace.addRecipe(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aer"}]}) * 4, <contenttweaker:infused_stone_aer>, 0.7);
mods.minecraftfuture.BlastFurnace.addRecipe(<contenttweaker:infused_stone_aer>, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aer"}]}) * 4);

furnace.addRecipe(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aqua"}]}) * 4, <contenttweaker:infused_stone_aqua>, 0.7);
mods.minecraftfuture.BlastFurnace.addRecipe(<contenttweaker:infused_stone_aqua>, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aqua"}]}) * 4);

furnace.addRecipe(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ignis"}]}) * 4, <contenttweaker:infused_stone_ignis>, 0.7);
mods.minecraftfuture.BlastFurnace.addRecipe(<contenttweaker:infused_stone_ignis>, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ignis"}]}) * 4);

furnace.addRecipe(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ordo"}]}) * 4, <contenttweaker:infused_stone_ordo>, 0.7);
mods.minecraftfuture.BlastFurnace.addRecipe(<contenttweaker:infused_stone_ordo>, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ordo"}]}) * 4);

furnace.addRecipe(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "perditio"}]}) * 4, <contenttweaker:infused_stone_perditio>, 0.7);
mods.minecraftfuture.BlastFurnace.addRecipe(<contenttweaker:infused_stone_perditio>, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "perditio"}]}) * 4);

furnace.addRecipe(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "terra"}]}) * 4, <contenttweaker:infused_stone_terra>, 0.7);
mods.minecraftfuture.BlastFurnace.addRecipe(<contenttweaker:infused_stone_terra>, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "terra"}]}) * 4);

furnace.addRecipe(<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) * 4, <contenttweaker:infused_stone_vitium>, 0.7);
mods.minecraftfuture.BlastFurnace.addRecipe(<contenttweaker:infused_stone_vitium>, <thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) * 4);

//Add Prismarine Nugget to OreDict
<ore:nuggetPrismarine>.add(<contenttweaker:prismarine_nugget>);

//Sanguine Gem
mods.inworldcrafting.FluidToItem.transform(<contenttweaker:sanguine_gem>, <liquid:lifeessence>, <ore:gemDiamond>, true);
mods.bloodmagic.BloodAltar.addRecipe(<contenttweaker:sanguine_gem>, <ore:gemDiamond>.firstItem, 0, 1000, 50, 75);
<ore:gemSanguine>.add(<contenttweaker:sanguine_gem>);

//Sanguine Ingots
mods.inworldcrafting.FluidToItem.transform(<contenttweaker:sanguine_ingot> * 2, <liquid:lifeessence>, <ore:ingotSteel> * 2, true);
mods.bloodmagic.BloodAltar.addRecipe(<contenttweaker:sanguine_ingot>, <ore:ingotSteel>.firstItem, 0, 500, 25, 35);
mods.inworldcrafting.FluidToItem.transform(<contenttweaker:sanguine_ingot>, <liquid:lifeessence>, <ore:ingotCrudeSteel>, true);
mods.bloodmagic.BloodAltar.addRecipe(<contenttweaker:sanguine_ingot>, <ore:ingotCrudeSteel>.firstItem, 0, 1000, 25, 35);
<ore:ingotSanguine>.add(<contenttweaker:sanguine_ingot>);

//Elemental Sanguine Gems
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<contenttweaker:sanguine_gem_fire>), scripts.staging.stages.BloodMagic1.stage, <contenttweaker:sanguine_gem_fire>, [[null, scripts.helpers.T1MagicFireIngredients[0], null],[scripts.helpers.T1MagicFireIngredients[1], <ore:gemSanguine>, scripts.helpers.T1MagicFireIngredients[2]],[null, scripts.helpers.T1MagicFireIngredients[3], null]]);
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<contenttweaker:sanguine_gem_water>), scripts.staging.stages.BloodMagic1.stage, <contenttweaker:sanguine_gem_water>, [[null, scripts.helpers.T1MagicWaterIngredients[0], null],[scripts.helpers.T1MagicWaterIngredients[1], <ore:gemSanguine>, scripts.helpers.T1MagicWaterIngredients[2]],[null, scripts.helpers.T1MagicWaterIngredients[3], null]]);
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<contenttweaker:sanguine_gem_air>), scripts.staging.stages.BloodMagic1.stage, <contenttweaker:sanguine_gem_air>, [[null, scripts.helpers.T1MagicAirIngredients[0], null],[scripts.helpers.T1MagicAirIngredients[1], <ore:gemSanguine>, scripts.helpers.T1MagicAirIngredients[2]],[null, scripts.helpers.T1MagicAirIngredients[3], null]]);
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<contenttweaker:sanguine_gem_earth>), scripts.staging.stages.BloodMagic1.stage, <contenttweaker:sanguine_gem_earth>, [[null, scripts.helpers.T1MagicEarthIngredients[0], null],[scripts.helpers.T1MagicEarthIngredients[1], <ore:gemSanguine>, scripts.helpers.T1MagicEarthIngredients[2]],[null, scripts.helpers.T1MagicEarthIngredients[3], null]]);

//Elemental Ember Crystals
scripts.mmhelper.AddEmberAssemblyRecipe(scripts.helpers.createRecipeName(<contenttweaker:crystal_ember_fire>), <contenttweaker:crystal_ember_fire>, [<embers:crystal_ember>, scripts.helpers.T1MagicFireIngredients[0].firstItem, scripts.helpers.T1MagicFireIngredients[1].firstItem, scripts.helpers.T1MagicFireIngredients[2].firstItem, scripts.helpers.T1MagicFireIngredients[3].firstItem], 300);
scripts.mmhelper.AddEmberAssemblyRecipe(scripts.helpers.createRecipeName(<contenttweaker:crystal_ember_water>), <contenttweaker:crystal_ember_water>, [<embers:crystal_ember>, scripts.helpers.T1MagicWaterIngredients[0].firstItem, scripts.helpers.T1MagicWaterIngredients[1].firstItem, scripts.helpers.T1MagicWaterIngredients[2].firstItem, scripts.helpers.T1MagicWaterIngredients[3].firstItem], 300);
for leaves in scripts.helpers.T1MagicEarthIngredients[2].items
{
	scripts.mmhelper.AddEmberAssemblyRecipe(scripts.helpers.createRecipeName(<contenttweaker:crystal_ember_earth>), <contenttweaker:crystal_ember_earth>, [<embers:crystal_ember>, scripts.helpers.T1MagicEarthIngredients[0].firstItem, scripts.helpers.T1MagicEarthIngredients[1].firstItem, leaves, scripts.helpers.T1MagicEarthIngredients[3].firstItem], 300);
}
scripts.mmhelper.AddEmberAssemblyRecipe(scripts.helpers.createRecipeName(<contenttweaker:crystal_ember_air>), <contenttweaker:crystal_ember_air>, [<embers:crystal_ember>, scripts.helpers.T1MagicAirIngredients[0].firstItem, scripts.helpers.T1MagicAirIngredients[1].firstItem, scripts.helpers.T1MagicAirIngredients[2].firstItem, scripts.helpers.T1MagicAirIngredients[3].firstItem], 300);

//Elemental Salis Mundus
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe(scripts.helpers.createRecipeName(<contenttweaker:salis_mundus_fire>), "FIRSTSTEPS", 5, [], <contenttweaker:salis_mundus_fire>, [[null, scripts.helpers.T1MagicFireIngredients[0], null],[scripts.helpers.T1MagicFireIngredients[1], <thaumcraft:salis_mundus>, scripts.helpers.T1MagicFireIngredients[2]],[null, scripts.helpers.T1MagicFireIngredients[3], null]]);
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe(scripts.helpers.createRecipeName(<contenttweaker:salis_mundus_water>), "FIRSTSTEPS", 5, [], <contenttweaker:salis_mundus_water>, [[null, scripts.helpers.T1MagicWaterIngredients[0], null],[scripts.helpers.T1MagicWaterIngredients[1], <thaumcraft:salis_mundus>, scripts.helpers.T1MagicWaterIngredients[2]],[null, scripts.helpers.T1MagicWaterIngredients[3], null]]);
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe(scripts.helpers.createRecipeName(<contenttweaker:salis_mundus_air>), "FIRSTSTEPS", 5, [], <contenttweaker:salis_mundus_air>, [[null, scripts.helpers.T1MagicAirIngredients[0], null],[scripts.helpers.T1MagicAirIngredients[1], <thaumcraft:salis_mundus>, scripts.helpers.T1MagicAirIngredients[2]],[null, scripts.helpers.T1MagicAirIngredients[3], null]]);
mods.thaumcraft.ArcaneWorkbench.registerShapedRecipe(scripts.helpers.createRecipeName(<contenttweaker:salis_mundus_earth>), "FIRSTSTEPS", 5, [], <contenttweaker:salis_mundus_earth>, [[null, scripts.helpers.T1MagicEarthIngredients[0], null],[scripts.helpers.T1MagicEarthIngredients[1], <thaumcraft:salis_mundus>, scripts.helpers.T1MagicEarthIngredients[2]],[null, scripts.helpers.T1MagicEarthIngredients[3], null]]);


//Add elemental crystal crafting
mods.astralsorcery.Altar.addDiscoveryAltarRecipe(scripts.helpers.createRecipeName(<contenttweaker:astral_crystal_air>), <contenttweaker:astral_crystal_air>, 200, 80,
[
 null, scripts.helpers.T1MagicAirIngredients[0], null,
 scripts.helpers.T1MagicAirIngredients[3], mods.astralsorcery.Utils.getCrystalORIngredient(false, false), scripts.helpers.T1MagicAirIngredients[1],
 null, scripts.helpers.T1MagicAirIngredients[2], null
]); //Air
mods.astralsorcery.Altar.addDiscoveryAltarRecipe(scripts.helpers.createRecipeName(<contenttweaker:astral_crystal_fire>), <contenttweaker:astral_crystal_fire>, 200, 80,
[
 null, scripts.helpers.T1MagicFireIngredients[0], null,
 scripts.helpers.T1MagicFireIngredients[3], mods.astralsorcery.Utils.getCrystalORIngredient(false, false), scripts.helpers.T1MagicFireIngredients[1],
 null, scripts.helpers.T1MagicFireIngredients[2], null
]); //Fire
mods.astralsorcery.Altar.addDiscoveryAltarRecipe(scripts.helpers.createRecipeName(<contenttweaker:astral_crystal_water>), <contenttweaker:astral_crystal_water>, 200, 80,
[
 null, scripts.helpers.T1MagicWaterIngredients[0], null,
 scripts.helpers.T1MagicWaterIngredients[3], mods.astralsorcery.Utils.getCrystalORIngredient(false, false), scripts.helpers.T1MagicWaterIngredients[1],
 null, scripts.helpers.T1MagicWaterIngredients[2], null
]); //Water
mods.astralsorcery.Altar.addDiscoveryAltarRecipe(scripts.helpers.createRecipeName(<contenttweaker:astral_crystal_earth>), <contenttweaker:astral_crystal_earth>, 200, 80,
[
 null, scripts.helpers.T1MagicEarthIngredients[0], null,
 scripts.helpers.T1MagicEarthIngredients[3], mods.astralsorcery.Utils.getCrystalORIngredient(false, false), scripts.helpers.T1MagicEarthIngredients[1],
 null, scripts.helpers.T1MagicEarthIngredients[2], null
]); //Earth

//Add Credits to food items
val foodCredits as string[crafttweaker.item.IItemStack] =
{
	<contenttweaker:vegemite> : "Eunora",
	<contenttweaker:vegemite_sandwich> : "Eunora",
	<contenttweaker:sushi> : "Sei",
	<contenttweaker:steak_and_chips> : "Eunora",
	<contenttweaker:pocky> : "Adora",
	<contenttweaker:meat_pie> : "Vic",
	<contenttweaker:honey_sandwich> : "Eunora",
	<contenttweaker:fairy_bread> : "Eunora",
	<contenttweaker:chicken_bucket> : "Eunora",
	<contenttweaker:chocolate> : "Adora"
};

for foodItem, author in foodCredits {
	scripts.helpers.AddTooltip(foodItem, ["Food sprite made by " ~ author ~ "!", "Doesn't stack as much as other food items."]);
}

//Crafting Food Items
val foodRecipes = {
	<contenttweaker:vegemite> : [<ore:itemSalt>, <ore:itemSalt>, <natura:materials:1>],
	<contenttweaker:vegemite_sandwich> : [<contenttweaker:vegemite>, <minecraft:bread>],
	<contenttweaker:sushi> : [<ore:fish>, <biomesoplenty:seaweed>, <ore:plantWildrice>],
	<contenttweaker:steak_and_chips> : [<minecraft:cooked_beef>, <minecraft:baked_potato>, <ore:itemSalt>],
	<contenttweaker:meat_pie> : [<ore:listAllmeatcooked>, <ore:listAllmeatcooked>, <ore:foodFlour> | <ore:dustWheat>, <ore:itemSalt>],
	<contenttweaker:honey_sandwich> : [<ore:dropHoney> | <minecraftfuture:honey_bottle> | <ore:dropHoneydew>, <minecraft:bread>],
	<contenttweaker:fairy_bread> : [<ore:dye>, <ore:dye>, <minecraft:sugar>, <minecraft:bread>],
	<contenttweaker:chocolate> * 2 : [<minecraft:dye:3>, <minecraft:sugar>, scripts.helpers.formatBucket("milk")],
	<contenttweaker:chicken_bucket> : [<ore:itemSalt>, <minecraft:cooked_chicken>,  <minecraft:cooked_chicken>, <minecraft:cooked_chicken>, <ore:foodFlour> | <ore:dustWheat>],
	<contenttweaker:pocky> * 8 : [<contenttweaker:chocolate>, <minecraft:bread>, <ore:stickWood>]
} as crafttweaker.item.IIngredient[][crafttweaker.item.IItemStack];

for key, value in foodRecipes {
	recipes.remove(key.withAmount(1));
	recipes.addShapeless(scripts.helpers.createRecipeName(key.withAmount(1)), key, value);
}

print("### ContentTweaker recipes Init Complete ###");
