import crafttweaker.item.IItemStack;

print("~~~ Begin Forestry Init ~~~");

//Forestry Ore Dict Additions
<ore:logPile>.add(<forestry:wood_pile>);
<ore:brickGlowingPeat>.add(<forestry:bituminous_peat>);

scripts.helpers.AddTooltip(<forestry:wood_pile>, ["Usage: Create a rectangular prism (even 1x1x1 works) of Wood Piles.", "Cover the prism on all faces with a compatible block (check JEI for usages).", "Set fire to one wood pile, then fully cover.", "Wait until smoke stops appearing through the blocks."]);

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
mods.forestry.Carpenter.addRecipe(<forestry:hardened_machine>, [[<ore:ingotBrass>, <ore:ingotBrass>, <ore:ingotBrass>], [<ore:ingotBrass>, <forestry:impregnated_casing>, <ore:ingotBrass>], [<ore:ingotBrass>, <ore:ingotBrass>, <ore:ingotBrass>]], 60, <liquid:water> * 5000); //Hardened Machine Casing
mods.forestry.Carpenter.removeRecipe(<forestry:soldering_iron>); //Soldering Iron
mods.forestry.Carpenter.addRecipe(<forestry:soldering_iron>, [[null, <ore:ingotIron>, null],[<ore:ingotIron>, null, <ore:ingotIron>],[null, null, <ore:ingotConductiveIron>]], 40, <liquid:water> * 1000);
mods.forestry.Carpenter.removeRecipe(<forestry:portable_alyzer>); //Portable Analyzer
mods.forestry.Carpenter.addRecipe(<forestry:portable_alyzer>, [[<ore:ingotRedstoneAlloy>, <ore:paneGlass>, <ore:ingotRedstoneAlloy>],[<ore:ingotRedstoneAlloy>, <ore:paneGlass>, <ore:ingotRedstoneAlloy>],[<ore:plateGold>, <ore:gemDiamond>, <ore:plateGold>]], 80, <liquid:water> * 2000);
mods.forestry.Carpenter.removeRecipe(<forestry:chipsets>.withTag({T: 0 as short}));
mods.forestry.Carpenter.removeRecipe(<forestry:chipsets:1>.withTag({T: 1 as short}));
mods.forestry.Carpenter.removeRecipe(<forestry:chipsets:2>.withTag({T: 2 as short}));
mods.forestry.Carpenter.removeRecipe(<forestry:chipsets:3>.withTag({T: 3 as short}));
mods.forestry.Carpenter.addRecipe(<forestry:chipsets>.withTag({T: 0 as short}), [[<ore:blockGlass>, <ore:gemLapis>, <ore:blockGlass>], [null, <advancedrocketry:ic>, null], [<ore:blockGlass>, <ore:gemLapis>, <ore:blockGlass>]], 40, <liquid:water> * 1000);
mods.forestry.Carpenter.addRecipe(<forestry:chipsets:1>.withTag({T: 1 as short}), [[<ore:blockGlass>, <ore:ingotRedstoneAlloy>, <ore:blockGlass>], [null, <advancedrocketry:ic>, null], [<ore:blockGlass>, <ore:ingotRedstoneAlloy>, <ore:blockGlass>]], 80, <liquid:water> * 2000);
mods.forestry.Carpenter.addRecipe(<forestry:chipsets:2>.withTag({T: 2 as short}), [[<ore:blockGlass>, <ore:ingotCrudeSteel>, <ore:blockGlass>], [null, <advancedrocketry:ic>, null], [<ore:blockGlass>, <ore:ingotCrudeSteel>, <ore:blockGlass>]], 120, <liquid:water> * 3000);
mods.forestry.Carpenter.addRecipe(<forestry:chipsets:2>.withTag({T: 2 as short}), [[<ore:blockGlass>, <ore:ingotSteel>, <ore:blockGlass>], [null, <advancedrocketry:ic>, null], [<ore:blockGlass>, <ore:ingotSteel>, <ore:blockGlass>]], 120, <liquid:water> * 3000);
mods.forestry.Carpenter.addRecipe(<forestry:chipsets:3>.withTag({T: 3 as short}), [[<ore:blockGlass>, <ore:plateGold>, <ore:blockGlass>], [null, <advancedrocketry:ic>, null], [<ore:blockGlass>, <ore:plateGold>, <ore:blockGlass>]], 160, <liquid:water> * 4000);
mods.forestry.Carpenter.addRecipe(<forestry:chipsets:3>.withTag({T: 3 as short}), [[<ore:blockGlass>, <ore:ingotElectrum>, <ore:blockGlass>], [null, <advancedrocketry:ic>, null], [<ore:blockGlass>, <ore:ingotElectrum>, <ore:blockGlass>]], 160, <liquid:water> * 4000);

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
		<forestry:carpenter> : [[<ore:ingotIron>, <contenttweaker:sealed_wood_plate>, <ore:ingotIron>], [<ore:ingotIron>, scripts.helpers.FrameTiers[0], <ore:ingotIron>], [<ore:ingotIron>, <thermalfoundation:material:657>, <ore:ingotIron>]],
		<forestry:squeezer> : [[<ore:ingotIron>, <ore:blockGlass>, <ore:ingotIron>], [<ore:ingotIron>, scripts.helpers.FrameTiers[0], <ore:ingotIron>], [<ore:ingotIron>, <minecraft:piston>, <ore:ingotIron>]],
		<forestry:centrifuge> : [[<ore:ingotIron>, <ore:blockGlass>, <ore:ingotIron>], [<ore:ingotIron>, scripts.helpers.FrameTiers[0], <ore:ingotIron>], [<ore:ingotIron>, <magneticraft:crafting:2>, <ore:ingotIron>]],
		<forestry:fabricator> : [[<ore:ingotGold>, <ore:blockGlass>, <ore:ingotGold>], [<ore:blockGlass>, scripts.helpers.FrameTiers[0], <ore:blockGlass>], [<ore:ingotGold>, <ore:chestWood>, <ore:ingotGold>]],
		<forestry:database> : [[<ore:ingotRedstoneAlloy>, <forestry:portable_alyzer>, <ore:ingotRedstoneAlloy>], [<forestry:bee_chest>, <forestry:impregnated_casing>, <forestry:bee_chest>], [<ore:plateWood>, <ore:dropRoyalJelly>, <ore:plateWood>]],
		<forestry:analyzer> : [[<ore:plateIron>, <forestry:portable_alyzer>, <ore:plateIron>], [null, <forestry:impregnated_casing>, null], [<ore:plateIron>, null, <ore:plateIron>]],
		<forestry:alveary.plain> : [[<forestry:crafting_material:6>, <forestry:crafting_material:6>, <forestry:crafting_material:6>], [<forestry:crafting_material:6>, <forestry:impregnated_casing>, <forestry:crafting_material:6>], [<forestry:crafting_material:6>, <forestry:crafting_material:6>, <forestry:crafting_material:6>]],
		<forestry:alveary.swarmer> : [[<ore:ingotGold>, null, <ore:ingotGold>], [<ore:gemDiamond>, <forestry:alveary.plain>, <ore:gemDiamond>], [<ore:ingotGold>, null, <ore:ingotGold>]],
		<forestry:alveary.fan> : [[null, <ore:plateConductiveIron>, null], [<openblocks:fan>, <forestry:alveary.plain>, <openblocks:fan>], [null, <ore:plateConductiveIron>, null]],
		<forestry:alveary.heater> : [[<minecraft:magma>, <ore:ingotBrick>, <minecraft:magma>], [<ore:ingotBrick>, <forestry:alveary.plain>, <ore:ingotBrick>], [<minecraft:magma>, <ore:ingotBrick>, <minecraft:magma>]],
		<forestry:alveary.hygro> : [[<ore:blockGlassColorless> | <ore:blockGlassWhite>, <ore:blockGlassColorless> | <ore:blockGlassWhite>, <ore:blockGlassColorless> | <ore:blockGlassWhite>], [<ore:plateIron>, <forestry:alveary.plain>, <ore:plateIron>], [null, <forestry:raintank>, null]],
		<forestry:alveary.stabiliser> : [[<ore:blockGlassColorless> | <ore:blockGlassWhite>, null, <ore:blockGlassColorless> | <ore:blockGlassWhite>], [<ore:plateQuartz>, <forestry:alveary.plain>, <ore:plateQuartz>], [<ore:blockGlassColorless> | <ore:blockGlassWhite>, null, <ore:blockGlassColorless> | <ore:blockGlassWhite>]],
		<forestry:alveary.sieve> : [[<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>], [<ore:ingotGold>, <forestry:alveary.plain>, <ore:ingotGold>], [<forestry:crafting_material:3>, <forestry:crafting_material:3>, <forestry:crafting_material:3>]],
		<forestry:rainmaker> : [[<ore:gearBronze>, <ore:blockGlassColorless>, <ore:gearBronze>], [<ore:gearBronze>, <forestry:hardened_machine>, <ore:gearBronze>], [<ore:gearBronze>, <ore:blockGlassColorless>, <ore:gearBronze>]],
		<forestry:trade_station> : [[<ore:book>, <ore:book>, <ore:book>], [<ore:book>, <ore:chestWood>, <ore:book>], [null, <ore:plateLapis>, null]],
		<forestry:mailbox> : [[<ore:paper>, <ore:paper>, <ore:paper>], [null, <ore:chestWood>, null], [null, <ore:plateLapis>, null]],
		<forestry:apiary> : [[<ore:plateSealedWood>, <ore:plateSealedWood>, <ore:plateSealedWood>], [<ore:plankWood>, <futuremc:honeycomb>, <ore:plankWood>], [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>]],
		<forestry:apiary> : [[<ore:plateSealedWood>, <ore:plateSealedWood>, <ore:plateSealedWood>], [<ore:plankWood>, <ore:beeComb>, <ore:plankWood>], [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>]],
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
		<forestry:miner_bag> : [[<ore:wool>, <ore:plateGold>, <ore:wool>], [<ore:plateCoal>, <ore:chestWood>, <ore:plateCoal>], [<ore:wool>, <ore:plateGold>, <ore:wool>]],
		<forestry:digger_bag> : [[<ore:wool>, <ore:dirt>, <ore:wool>], [<ore:cobblestone>, <ore:chestWood>, <ore:cobblestone>], [<ore:wool>, <ore:dirt>, <ore:wool>]],
		<forestry:forester_bag> : [[<ore:wool>, <ore:treeSapling>, <ore:wool>], [<ore:plateWood>, <ore:chestWood>, <ore:plateWood>], [<ore:wool>, <ore:treeSapling>, <ore:wool>]],
		<forestry:hunter_bag> : [[<ore:wool>, <ore:foodMeat>, <ore:wool>], [<ore:foodMeat>, <ore:chestWood>, <ore:foodMeat>], [<ore:wool>, <ore:foodMeat>, <ore:wool>]],
		<forestry:naturalist_helmet> : [[null, <ore:ingotGold>, null], [<ore:paneGlassColorless>, null, <ore:paneGlassColorless>]],
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
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<forestry:fertilizer_compound>) ~ scripts.helpers.stages.progression2.stage ~ "_1", scripts.helpers.stages.progression2.stage, <forestry:fertilizer_compound> * 4, [[null, <ore:sand>, null], [<ore:sand>, <ore:dustApatite>, <ore:sand>], [null, <ore:sand>, null]]);
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<forestry:fertilizer_compound>) ~ scripts.helpers.stages.progression2.stage ~ "_2", scripts.helpers.stages.progression2.stage, <forestry:fertilizer_compound> * 8, [[null, <ore:dustAsh>, null], [<ore:dustAsh>, <ore:dustApatite>, <ore:dustAsh>], [null, <ore:dustAsh>, null]]);
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<forestry:fertilizer_compound>) ~ scripts.helpers.stages.progression2.stage ~ "_3", scripts.helpers.stages.progression2.stage, <forestry:fertilizer_compound> * 24, [[<ore:dustWood>, <ore:dustSaltpeter>, <ore:dustWood>], [<ore:dustSaltpeter>, <ore:dustApatite>, <ore:dustSaltpeter>], [<ore:dustWood>, <ore:dustSaltpeter>, <ore:dustWood>]]);

//Broken Pickaxes Remove Salvage Recipe
mods.forestry.Carpenter.removeRecipe(<forestry:broken_bronze_shovel>);
mods.forestry.Carpenter.removeRecipe(<forestry:broken_bronze_pickaxe>);

//Various recipes for a crop farm
recipes.remove(<forestry:farm_crops>);
recipes.remove(<forestry:farm_ender>);
recipes.remove(<forestry:farm_nether>);
recipes.remove(<forestry:farm_gourd>);
recipes.remove(<forestry:arboretum>);
recipes.remove(<forestry:farm_mushroom>);
recipes.remove(<forestry:peat_bog>);

for earthCraftingItem in scripts.helpers.AllEarthT1Items
{
	//Ender Farm
	mods.extendedcrafting.TableCrafting.addShaped(0, <forestry:farm_ender>, [[null, earthCraftingItem, null], [<ore:blockGlass>, <forestry:impregnated_casing>, <ore:blockGlass>], [<forestry:thermionic_tubes:12>, scripts.helpers.CircuitTiers[0], <forestry:thermionic_tubes:12>]]);

	//Nether Farm
	mods.extendedcrafting.TableCrafting.addShaped(0, <forestry:farm_nether>, [[null, earthCraftingItem, null], [<ore:blockGlass>, <forestry:impregnated_casing>, <ore:blockGlass>], [<forestry:thermionic_tubes:7>, scripts.helpers.CircuitTiers[0], <forestry:thermionic_tubes:7>]]);

	//Gourd Farm
	mods.extendedcrafting.TableCrafting.addShaped(0, <forestry:farm_gourd>, [[null, earthCraftingItem, null], [<ore:blockGlass>, <forestry:impregnated_casing>, <ore:blockGlass>], [<forestry:thermionic_tubes:11>, scripts.helpers.CircuitTiers[0], <forestry:thermionic_tubes:11>]]);

	//Arboretum
	mods.extendedcrafting.TableCrafting.addShaped(0, <forestry:arboretum>, [[null, earthCraftingItem, null], [<ore:blockGlass>, <forestry:impregnated_casing>, <ore:blockGlass>], [<forestry:thermionic_tubes:4>, scripts.helpers.CircuitTiers[0], <forestry:thermionic_tubes:4>]]);

	//Mushroom Farm
	mods.extendedcrafting.TableCrafting.addShaped(0, <forestry:farm_mushroom>, [[null, earthCraftingItem, null], [<ore:blockGlass>, <forestry:impregnated_casing>, <ore:blockGlass>], [<ore:plateLapis>, scripts.helpers.CircuitTiers[0], <ore:plateLapis>]]);

	//Peat Bog
	mods.extendedcrafting.TableCrafting.addShaped(0, <forestry:peat_bog>, [[null, earthCraftingItem, null], [<ore:blockGlass>, <forestry:impregnated_casing>, <ore:blockGlass>], [<forestry:thermionic_tubes:6>, scripts.helpers.CircuitTiers[0], <forestry:thermionic_tubes:6>]]);

	//Crop Farm
	for plate in scripts.helpers.BiomeGemMaterial["plate"].items
	{
		mods.extendedcrafting.TableCrafting.addShaped(0, <forestry:farm_crops>, [[null, earthCraftingItem, null], [<ore:blockGlass>, <forestry:impregnated_casing>, <ore:blockGlass>], [plate, scripts.helpers.CircuitTiers[0], plate]]);
	}
}

//Change Engine Recipes
recipes.remove(<forestry:engine_clockwork>);
mods.forestry.Carpenter.addRecipe(<forestry:engine_clockwork> * 2, [[<ore:plankWood>, <ore:plankWood>, <ore:plankWood>], [null, <ore:blockGlass>, null], [<ore:gearRedstoneAlloy>, <minecraft:piston>, <minecraft:clock>]], 240, <liquid:water> * 1000); //Clockwork Engine
recipes.remove(<forestry:engine_peat>);
mods.forestry.Carpenter.addRecipe(<forestry:engine_peat> * 2, [[<ore:ingotBlackIron>, <ore:ingotBlackIron>, <ore:ingotBlackIron>], [null, <ore:blockGlass>, null], [<magneticraft:crafting:2>, <minecraft:piston>, <ore:gearGold>]], 240, <liquid:water> * 1000); //Peat-Fired Engine
recipes.remove(<forestry:engine_biogas>);
mods.forestry.Carpenter.addRecipe(<forestry:engine_biogas> * 2, [[<ore:ingotGold>, <ore:ingotGold>, <ore:ingotGold>], [null, <ore:blockGlass>, null], [<ore:gearConductiveIron>, <minecraft:piston>, <magneticraft:crafting:2>]], 240, <liquid:water> * 1000); //Peat-Fired Engine

//Remove Bronze Ingot Creation
recipes.removeByRecipeName("forestry:bronze_ingot");

print("### Forestry Init Complete ###");
