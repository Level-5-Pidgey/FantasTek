import crafttweaker.item.IItemStack;

print("~~~ Begin Forestry Init ~~~");

//Forestry Ore Dict Additions
<ore:logPile>.add(<forestry:wood_pile>);
<ore:brickGlowingPeat>.add(<forestry:bituminous_peat>);

scripts.helpers.AddTooltip(<forestry:wood_pile>, ["Usage: Create a rectangular prism (even 1x1x1 works) of Wood Piles.", "Cover the prism on all faces with a compatible block (check JEI for usages).", "Set fire to one wood pile, then fully cover.", "Wait until smoke stops appearing through the blocks."]);

//Hide Depreciated Items
val depreciatedForestry = [
	<forestry:greenhouse:3>,
	<forestry:greenhouse:4>,
	<forestry:greenhouse:5>,
	<forestry:climatiser:1>,
	<forestry:climatiser:2>,
	<forestry:climatiser:3>,
	<forestry:climatiser:4>
] as crafttweaker.item.IItemStack[];

for depreciated in depreciatedForestry
{
	scripts.helpers.unstageAndHide(depreciated);
}

//Add more items that produce honey when squeezed
var honeyOutput =
{
	<futuremc:honeycomb> : 50,
	<futuremc:honey_bottle> : 100,
	<biomesoplenty:honeycomb> : 25,
	<biomesoplenty:filled_honeycomb> : 75,
	<futuremc:honeycomb_block> : 200,
	<biomesoplenty:honey_block> : 250,
	<biomesoplenty:jar_filled> : 100
} as int[IItemStack];

for item, fluidAmount in honeyOutput
{
	mods.forestry.Squeezer.addRecipe(<liquid:for.honey> * fluidAmount, [item], 40);
	mods.thermalexpansion.Transposer.addExtractRecipe(<liquid:for.honey> * fluidAmount, item, 2400);
}

//Change Carpenter Recipes
mods.forestry.Carpenter.removeRecipe(<forestry:impregnated_casing>); //Impregnated Casing
mods.forestry.Carpenter.addRecipe(<forestry:impregnated_casing>, [[<embers:sealed_planks>, <embers:sealed_planks>, <embers:sealed_planks>],[<embers:sealed_planks>, null, <embers:sealed_planks>],[<embers:sealed_planks>, <embers:sealed_planks>, <embers:sealed_planks>]], 80, <liquid:seed.oil> * 250);
mods.forestry.Carpenter.addRecipe(<morebees:diamondfragment>, [[<morebees:graincrystal>, <morebees:graincrystal>, <morebees:graincrystal>],[null, <morebees:graincrystal>, null],[<morebees:graincrystal>, <morebees:graincrystal>, <morebees:graincrystal>]], 80, <liquid:water> * 500); //Add Diamond Fragment Crafting to Carpenter
recipes.remove(<forestry:sturdy_machine>);
mods.forestry.Carpenter.addRecipe(<forestry:sturdy_machine>, [[<ore:ingotCrudeSteel>, null, <ore:ingotCrudeSteel>], [null, <forestry:impregnated_casing>, null], [<ore:ingotCrudeSteel>, null, <ore:ingotCrudeSteel>]], 240, <liquid:water> * 1000);
mods.forestry.Carpenter.addRecipe(<forestry:sturdy_machine>, [[<ore:plateSteel>, null, <ore:plateSteel>], [null, <forestry:impregnated_casing>, null], [<ore:plateSteel>, null, <ore:plateSteel>]], 60, <liquid:water> * 500); //Sturdy Casing Recipe Change
mods.forestry.Carpenter.removeRecipe(<forestry:crafting_material:6>);
mods.forestry.Carpenter.addRecipe(<forestry:crafting_material:6>, [[null, <ore:dropRoyalJelly>, null], [<ore:plankSealedWood>, <ore:plankSealedWood>, <ore:plankSealedWood>], [<ore:itemBeeswax>, <ore:itemPollen>, <ore:itemBeeswax>]], 80, <liquid:honey> * 500); //Scented Panelling Recipe Change
mods.forestry.Carpenter.removeRecipe(<forestry:hardened_machine>);
mods.forestry.Carpenter.addRecipe(<forestry:hardened_machine>, [[<embers:wrapped_sealed_planks>, <ore:plateDiamond>, <embers:wrapped_sealed_planks>], [<ore:plateDiamond>, <forestry:impregnated_casing>, <ore:plateDiamond>], [<embers:wrapped_sealed_planks>, <ore:plateDiamond>, <embers:wrapped_sealed_planks>]], 60, <liquid:water> * 5000); //Hardened Machine Casing
mods.forestry.Carpenter.addRecipe(<forestry:hardened_machine>, [[null, <ore:plateDiamond>, null], [<ore:plateDiamond>, <forestry:sturdy_machine>, <ore:plateDiamond>], [null, <ore:plateDiamond>, null]], 60, <liquid:water> * 5000);
mods.forestry.Carpenter.removeRecipe(<forestry:soldering_iron>); //Soldering Iron
mods.forestry.Carpenter.addRecipe(<forestry:soldering_iron>, [[null, <ore:ingotIron>, null],[<ore:ingotIron>, null, <ore:ingotIron>],[null, null, <ore:ingotConductiveIron>]], 40, <liquid:water> * 1000);
mods.forestry.Carpenter.removeRecipe(<forestry:portable_alyzer>); //Portable Analyzer
mods.forestry.Carpenter.addRecipe(<forestry:portable_alyzer>, [[<ore:ingotRedstoneAlloy>, <ore:paneGlass>, <ore:ingotRedstoneAlloy>],[<ore:ingotRedstoneAlloy>, <ore:paneGlass>, <ore:ingotRedstoneAlloy>],[<ore:plateGold>, <ore:gemDiamond>, <ore:plateGold>]], 80, <liquid:water> * 2000);
mods.forestry.Carpenter.removeRecipe(<forestry:habitat_screen>); //Portable Analyzer
mods.forestry.Carpenter.addRecipe(<forestry:habitat_screen>, [[<ore:ingotBlackIron>, <ore:paneGlass>, <ore:ingotBlackIron>],[<ore:ingotBlackIron>, <ore:paneGlass>, <ore:ingotBlackIron>],[<ore:gearGold>, <ore:gemDiamond>, <ore:gearGold>]], 80, <liquid:water> * 2000);

//Remove Tier 1 Ores being output from Metallic Grains
val metallicGrainsDusts = [
	<ore:dustOsmium>.firstItem,
	<ore:dustCopper>.firstItem,
	<ore:dustTin>.firstItem,
	<ore:dustLead>.firstItem,
	<ore:dustSilver>.firstItem,
	<ore:dustNickel>.firstItem,
	<ore:dustAluminum>.firstItem,
	<ore:gemApatite>.firstItem,
] as crafttweaker.item.IItemStack[];

for metallicGrainsDustCraft in metallicGrainsDusts
{
	mods.forestry.Carpenter.removeRecipe(metallicGrainsDustCraft, <liquid:water>);
}

//ExtendedCrafting recipes for forestry Machines in tier1
val machineRecipes_EXTENDEDCRAFTING = {
		<forestry:carpenter> : [[<ore:ingotIron>, <ore:blockGlass>, <ore:ingotIron>], [<ore:ingotIron>, <ore:itemSimpleMachineChassi>, <ore:ingotIron>], [<ore:ingotIron>, <thermalfoundation:material:657>, <ore:ingotIron>]],
		<forestry:squeezer> : [[<ore:ingotIron>, <ore:blockGlass>, <ore:ingotIron>], [<ore:ingotIron>, <ore:itemSimpleMachineChassi>, <ore:ingotIron>], [<ore:ingotIron>, <minecraft:piston>, <ore:ingotIron>]],
		<forestry:centrifuge> : [[<ore:ingotIron>, <ore:blockGlass>, <ore:ingotIron>], [<ore:ingotIron>, <ore:itemSimpleMachineChassi>, <ore:ingotIron>], [<ore:ingotIron>, <magneticraft:crafting:2>, <ore:ingotIron>]],
		<forestry:fabricator> : [[<ore:ingotGold>, <ore:blockGlass>, <ore:ingotGold>], [<ore:blockGlass>, <ore:itemSimpleMachineChassi>, <ore:blockGlass>], [<ore:ingotGold>, <ore:chestWood>, <ore:ingotGold>]],
		<forestry:habitat_former> : [[<ore:blockGlass>, <ore:blockRedstone>, <ore:blockGlass>], [<forestry:thermionic_tubes:3>, <forestry:sturdy_machine>, <forestry:thermionic_tubes:3>], [<ore:gearGold>, scripts.helpers.CircuitTiers[1], <ore:gearGold>]],
		<forestry:database> : [[<ore:ingotRedstoneAlloy>, <forestry:portable_alyzer>, <ore:ingotRedstoneAlloy>], [<forestry:bee_chest> | <forestry:tree_chest> | <forestry:butterfly_chest>, <forestry:sturdy_machine>, <forestry:bee_chest> | <forestry:tree_chest> | <forestry:butterfly_chest>], [<ore:plateWood>, <ore:listAllFruit> | <ore:dropRoyalJelly>, <ore:plateWood>]],
		<forestry:analyzer> : [[<ore:plateIron>, <forestry:portable_alyzer>, <ore:plateIron>], [null, <forestry:sturdy_machine>, null], [<ore:plateIron>, null, <ore:plateIron>]],
		<forestry:alveary.plain> : [[<forestry:crafting_material:6>, <forestry:crafting_material:6>, <forestry:crafting_material:6>], [<forestry:crafting_material:6>, <forestry:sturdy_machine>, <forestry:crafting_material:6>], [<forestry:crafting_material:6>, <forestry:crafting_material:6>, <forestry:crafting_material:6>]],
		<forestry:alveary.swarmer> : [[<ore:ingotGold>, null, <ore:ingotGold>], [<ore:gemDiamond>, <forestry:alveary.plain>, <ore:gemDiamond>], [<ore:ingotGold>, null, <ore:ingotGold>]],
		<forestry:alveary.fan> : [[null, <ore:plateConductiveIron>, null], [<openblocks:fan>, <forestry:alveary.plain>, <openblocks:fan>], [null, <ore:plateConductiveIron>, null]],
		<forestry:alveary.heater> : [[<minecraft:magma>, <ore:ingotBrick>, <minecraft:magma>], [<ore:ingotBrick>, <forestry:alveary.plain>, <ore:ingotBrick>], [<minecraft:magma>, <ore:ingotBrick>, <minecraft:magma>]],
		<forestry:alveary.hygro> : [[<ore:blockGlassColorless> | <ore:blockGlassWhite>, <ore:blockGlassColorless> | <ore:blockGlassWhite>, <ore:blockGlassColorless> | <ore:blockGlassWhite>], [<ore:plateIron>, <forestry:alveary.plain>, <ore:plateIron>], [null, <forestry:raintank>, null]],
		<forestry:alveary.stabiliser> : [[<ore:blockGlassColorless> | <ore:blockGlassWhite>, null, <ore:blockGlassColorless> | <ore:blockGlassWhite>], [<ore:plateQuartz>, <forestry:alveary.plain>, <ore:plateQuartz>], [<ore:blockGlassColorless> | <ore:blockGlassWhite>, null, <ore:blockGlassColorless> | <ore:blockGlassWhite>]],
		<forestry:alveary.sieve> : [[<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>], [<ore:ingotGold>, <forestry:alveary.plain>, <ore:ingotGold>], [<forestry:crafting_material:3>, <forestry:crafting_material:3>, <forestry:crafting_material:3>]],
		<forestry:rainmaker> : [[<ore:gearBronze>, <ore:blockGlassColorless>, <ore:gearBronze>], [<ore:gearBronze>, <forestry:hardened_machine>, <ore:gearBronze>], [<ore:gearBronze>, <ore:blockGlassColorless>, <ore:gearBronze>]],
		<forestry:trade_station> : [[<ore:book>, <ore:book>, <ore:book>], [<ore:book>, <ore:chestWood>, <ore:book>], [<ore:plateLapis>, <ore:plateLapis>, <ore:plateLapis>]],
		<forestry:mailbox> : [[<ore:paper>, <ore:paper>, <ore:paper>], [null, <ore:chestWood>, null], [<ore:plateLapis>, <ore:plateLapis>, <ore:plateLapis>]],
		<forestry:apiary> : [[<ore:plateSealedWood>, <ore:plateSealedWood>, <ore:plateSealedWood>], [<ore:plankWood>, <ore:beeComb> | <futuremc:honeycomb>, <ore:plankWood>], [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in machineRecipes_EXTENDEDCRAFTING {
	recipes.remove(key.withAmount(1));
	mods.extendedcrafting.TableCrafting.addShaped(0, key, value);
}

val machineRecipes_CRAFTINGTABLE = {
		<forestry:bee_house> : [[<ore:plateWood>, <ore:plateWood>, <ore:plateWood>],[<ore:plankWood>, <futuremc:honeycomb>, <ore:plankWood>], [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>]],
		<forestry:worktable> : [[<ore:book>], [<ore:craftingTableWood>]],
		<forestry:raintank> : [[<ore:ingotIron>, <ore:blockGlassColorless> | <ore:blockGlassWhite>, <ore:ingotIron>], [<ore:ingotIron>, null, <ore:ingotIron>], [<ore:ingotIron>, <minecraft:bucket>, <ore:ingotIron>]],
		<forestry:habitat_locator> : [[<ore:dustRedstone>, null, <ore:dustRedstone>], [null, <randomthings:goldencompass>, null], [<ore:dustRedstone>, null, <ore:dustRedstone>]],
		<forestry:smoker> : [[<ore:leather>, <ore:plateSealedWood>, <ore:ingotCrudeSteel>], [<ore:leather>, <ore:ingotCrudeSteel>, <minecraft:flint_and_steel>], [<ore:ingotCrudeSteel>, <ore:ingotCrudeSteel>, <ore:ingotCrudeSteel>]],
		<forestry:adventurer_bag> : [[<ore:wool>, <minecraft:rotten_flesh>, <ore:wool>], [<minecraft:spider_eye>, <ore:chestWood>, <minecraft:string>], [<ore:wool>, <minecraft:bone>, <ore:wool>]],
		<forestry:builder_bag> : [[<ore:wool>, <ore:ingotBrick>, <ore:wool>], [<ore:logWood>, <ore:chestWood>, <ore:blockGlass>], [<ore:wool>, <ore:ingotBrickNether>, <ore:wool>]],
		<forestry:apiarist_bag> : [[<ore:wool>, <ore:beeComb>, <ore:wool>], [<ore:beeComb>, <ore:chestWood>, <ore:beeComb>], [<ore:wool>, <ore:beeComb>, <ore:wool>]],
		<forestry:lepidopterist_bag> : [[<ore:wool>, <forestry:butterfly_ge>, <ore:wool>], [<forestry:butterfly_ge>, <ore:chestWood>, <forestry:butterfly_ge>], [<ore:wool>, <forestry:butterfly_ge>, <ore:wool>]],
		<forestry:miner_bag> : [[<ore:wool>, <ore:plateGold>, <ore:wool>], [<ore:plateCoal>, <ore:chestWood>, <ore:plateCoal>], [<ore:wool>, <ore:plateGold>, <ore:wool>]],
		<forestry:digger_bag> : [[<ore:wool>, <ore:dirt>, <ore:wool>], [<ore:cobblestone>, <ore:chestWood>, <ore:cobblestone>], [<ore:wool>, <ore:dirt>, <ore:wool>]],
		<forestry:forester_bag> : [[<ore:wool>, <ore:treeSapling>, <ore:wool>], [<ore:plateWood>, <ore:chestWood>, <ore:plateWood>], [<ore:wool>, <ore:treeSapling>, <ore:wool>]],
		<forestry:hunter_bag> : [[<ore:wool>, <ore:foodMeat>, <ore:wool>], [<ore:foodMeat>, <ore:chestWood>, <ore:foodMeat>], [<ore:wool>, <ore:foodMeat>, <ore:wool>]],
		<forestry:grafter> : [[null, null, <ore:ingotConductiveIron>], [null, <ore:stickWood>, null], [<ore:stickWood>, null, null]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in machineRecipes_CRAFTINGTABLE {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

//Remove Stamp Recipes
mods.forestry.Carpenter.removeRecipe(<forestry:stamps>);
mods.forestry.Carpenter.removeRecipe(<forestry:stamps:1>);
mods.forestry.Carpenter.removeRecipe(<forestry:stamps:2>);
mods.forestry.Carpenter.removeRecipe(<forestry:stamps:3>);
recipes.remove(<forestry:stamps:*>);

//Smoker Recipe post stage 1
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<forestry:smoker>), scripts.helpers.stages.progression2.stage, <forestry:smoker>, [[<ore:leather>, <ore:plateSealedWood>, <ore:ingotSteel>], [<ore:leather>, <ore:ingotSteel>, <minecraft:flint_and_steel>], [<ore:ingotSteel>, <ore:ingotSteel>, <ore:ingotSteel>]]);

//Fertilizer Recipes
recipes.remove(<forestry:fertilizer_compound>);
recipes.addShaped(scripts.helpers.createRecipeName(<forestry:fertilizer_compound>) ~ scripts.helpers.stages.progression1.stage ~ "_1", <forestry:fertilizer_compound> * 4, [[null, <ore:dustAsh>, null], [<ore:dustAsh>, <minecraft:dye:15>, <ore:dustAsh>], [null, <ore:dustAsh>, null]]);
recipes.addShaped(scripts.helpers.createRecipeName(<forestry:fertilizer_compound>) ~ scripts.helpers.stages.progression1.stage ~ "_2", <forestry:fertilizer_compound> * 2, [[null, <minecraft:wheat>, null], [<minecraft:wheat>, <minecraft:dye:15>, <minecraft:wheat>], [null, <minecraft:wheat>, null]]);
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<forestry:fertilizer_compound>) ~ scripts.helpers.stages.progression2.stage ~ "_1", <forestry:fertilizer_compound> * 4, [[null, <ore:sand>, null], [<ore:sand>, <ore:dustApatite>, <ore:sand>], [null, <ore:sand>, null]]);
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<forestry:fertilizer_compound>) ~ scripts.helpers.stages.progression2.stage ~ "_2", <forestry:fertilizer_compound> * 8, [[null, <ore:dustAsh>, null], [<ore:dustAsh>, <ore:dustApatite>, <ore:dustAsh>], [null, <ore:dustAsh>, null]]);
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<forestry:fertilizer_compound>) ~ scripts.helpers.stages.progression2.stage ~ "_3", <forestry:fertilizer_compound> * 24, [[<ore:dustWood>, <ore:dustSaltpeter>, <ore:dustWood>], [<ore:dustSaltpeter>, <ore:dustApatite>, <ore:dustSaltpeter>], [<ore:dustWood>, <ore:dustSaltpeter>, <ore:dustWood>]]);

//Broken Pickaxes Remove Salvage Recipe
mods.forestry.Carpenter.removeRecipe(<forestry:broken_bronze_shovel>);
mods.forestry.Carpenter.removeRecipe(<forestry:broken_bronze_pickaxe>);

print("### Forestry Init Complete ###");
