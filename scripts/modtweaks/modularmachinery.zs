import mods.modularmachinery.RecipeBuilder;
import crafttweaker.item.IItemStack;

print("~~~ Begin Modular Machinery Init ~~~");

//Change Modularium Recipes
recipes.removeByRecipeName("modularmachinery:modularium_ingot");
recipes.addShaped(scripts.helpers.createRecipeName(<modularmachinery:itemmodularium>), <modularmachinery:itemmodularium> * 4, [[<ore:ingotBlackIron>, <ore:ingotBlackIron>, <ore:ingotBlackIron>, <ore:ingotBlackIron>, <ore:ingotGold>, <ore:ingotGold>, <ore:dustRedstone>, <ore:dustGlowstone>]]);

//Add Modularium Alloying/Casting
mods.tconstruct.Alloy.addRecipe(<liquid:modularium> * 288, [<liquid:black_iron> * 288, <liquid:redstone> * 50, <liquid:gold> * 144, <liquid:glowstone> * 125]);
mods.tconstruct.Casting.addTableRecipe(<modularmachinery:itemmodularium>, <tconstruct:cast_custom>, <liquid:modularium>, 144, false);

//Machine Parts
//List of ores to change processing rules for
var MachineParts1 =
{
	1 : <contenttweaker:wood_plate>,
	2 : <extendedcrafting:material>,
	3 : <contenttweaker:material_part:662>, //Steel Plating
	4 : <contenttweaker:material_part:889>,	//Redstone Alloy Plating
	5 : <enderio:block_reinforced_obsidian>,
	6 : <ore:plateDiamond>.firstItem, //PLACEHOLDER
	7 : <ore:plateEmerald>.firstItem, //PLACEHOLDER
	8 : <ore:plateElectrum>.firstItem, //PLACEHOLDER
	9 : <ore:plateElectrumFlux>.firstItem //PLACEHOLDER
} as IItemStack[int];

var MachineParts2 =
{
	1 : <thermalfoundation:material:32>, //Iron Plate
	2 : <thermalfoundation:material:33>, //Gold Plate
	3 : <thermalfoundation:material:26>, //Diamond Gear
	4 : <minecraft:redstone_block>,
	5 : <contenttweaker:material_part:945>, //Dark Steel Plate
	6 : <ore:plateDiamond>.firstItem, //PLACEHOLDER
	7 : <ore:plateEmerald>.firstItem, //PLACEHOLDER
	8 : <ore:plateElectrum>.firstItem, //PLACEHOLDER
	9 : <ore:plateElectrumFlux>.firstItem //PLACEHOLDER
} as IItemStack[int];

//Hatch Crafting Changes
val recipesToRemove =
[
	<modularmachinery:blockcasing>,
	<modularmachinery:blockcasing:1>,
	<modularmachinery:blockcasing:2>,
	<modularmachinery:blockcasing:3>,
	<modularmachinery:blockcasing:4>,
	<modularmachinery:blockcasing:5>,
	<modularmachinery:blockcontroller>,
	<modularmachinery:blockinputbus>,
	<modularmachinery:blockinputbus:1>,
	<modularmachinery:blockoutputbus>,
	<modularmachinery:blockoutputbus:1>,
	<modularmachinery:blockfluidoutputhatch>,
	<modularmachinery:blockfluidoutputhatch:1>,
	<modularmachinery:blockfluidinputhatch>,
	<modularmachinery:blockfluidinputhatch:1>,
	<modularmachinery:blockenergyinputhatch>,
	<modularmachinery:blockenergyinputhatch:1>,
	<modularmachinery:blockenergyoutputhatch>,
	<modularmachinery:blockenergyoutputhatch:1>
] as IItemStack[];

for block in recipesToRemove
{
	recipes.remove(block);
}

var EnergyInput =
{
	0 : <minecraft:redstone_block>,
	1 : <modularmachinery:blockenergyinputhatch>,
	2 : <modularmachinery:blockenergyinputhatch:1>,
	3 : <modularmachinery:blockenergyinputhatch:2>,
	4 : <modularmachinery:blockenergyinputhatch:3>,
	5 : <modularmachinery:blockenergyinputhatch:4>,
	6 : <modularmachinery:blockenergyinputhatch:5>,
	7 : <modularmachinery:blockenergyinputhatch:6>,
	8 : <modularmachinery:blockenergyinputhatch:7>
} as IItemStack[int];

var EnergyOutput =
{
	0 : <minecraft:redstone>,
	1 : <modularmachinery:blockenergyoutputhatch>,
	2 : <modularmachinery:blockenergyoutputhatch:1>,
	3 : <modularmachinery:blockenergyoutputhatch:2>,
	4 : <modularmachinery:blockenergyoutputhatch:3>,
	5 : <modularmachinery:blockenergyoutputhatch:4>,
	6 : <modularmachinery:blockenergyoutputhatch:5>,
	7 : <modularmachinery:blockenergyoutputhatch:6>,
	8 : <modularmachinery:blockenergyoutputhatch:7>
} as IItemStack[int];

var FluidInput =
{
	0 : <inspirations:pipe>,
	1 : <modularmachinery:blockfluidinputhatch>,
	2 : <modularmachinery:blockfluidinputhatch:1>,
	3 : <modularmachinery:blockfluidinputhatch:2>,
	4 : <modularmachinery:blockfluidinputhatch:3>,
	5 : <modularmachinery:blockfluidinputhatch:4>,
	6 : <modularmachinery:blockfluidinputhatch:5>,
	7 : <modularmachinery:blockfluidinputhatch:6>,
	8 : <modularmachinery:blockfluidinputhatch:7>
} as IItemStack[int];

var FluidOutput =
{
	0 : <minecraft:bucket>,
	1 : <modularmachinery:blockfluidoutputhatch>,
	2 : <modularmachinery:blockfluidoutputhatch:1>,
	3 : <modularmachinery:blockfluidoutputhatch:2>,
	4 : <modularmachinery:blockfluidoutputhatch:3>,
	5 : <modularmachinery:blockfluidoutputhatch:4>,
	6 : <modularmachinery:blockfluidoutputhatch:5>,
	7 : <modularmachinery:blockfluidoutputhatch:6>,
	8 : <modularmachinery:blockfluidoutputhatch:7>
} as IItemStack[int];

var ItemInput =
{
	0 : <contenttweaker:wood_plate>,
	1 : <modularmachinery:blockinputbus>,
	2 : <modularmachinery:blockinputbus:1>,
	3 : <modularmachinery:blockinputbus:2>,
	4 : <modularmachinery:blockinputbus:3>,
	5 : <modularmachinery:blockinputbus:4>,
	6 : <modularmachinery:blockinputbus:5>,
	7 : <modularmachinery:blockinputbus:6>
} as IItemStack[int];

var ItemOutput =
{
	0 : <minecraft:chest>,
	1 : <modularmachinery:blockoutputbus>,
	2 : <modularmachinery:blockoutputbus:1>,
	3 : <modularmachinery:blockoutputbus:2>,
	4 : <modularmachinery:blockoutputbus:3>,
	5 : <modularmachinery:blockoutputbus:4>,
	6 : <modularmachinery:blockoutputbus:5>,
	7 : <modularmachinery:blockoutputbus:6>
} as IItemStack[int];

var EmberInput =
{
	0 : <embers:plate_caminite>,
	1 : <modulardiversity:blockemberoutputhatch>,
	2 : <modulardiversity:blockemberoutputhatch:1>,
	3 : <modulardiversity:blockemberoutputhatch:2>,
	4 : <modulardiversity:blockemberoutputhatch:3>,
	5 : <modulardiversity:blockemberoutputhatch:4>,
	6 : <modulardiversity:blockemberoutputhatch:5>,
	7 : <modulardiversity:blockemberoutputhatch:6>,
	8 : <modulardiversity:blockemberoutputhatch:7>
} as IItemStack[int];

var EmberOutput =
{
	0 : <embers:shard_ember>,
	1 : <modulardiversity:blockemberinputhatch>,
	2 : <modulardiversity:blockemberinputhatch:1>,
	3 : <modulardiversity:blockemberinputhatch:2>,
	4 : <modulardiversity:blockemberinputhatch:3>,
	5 : <modulardiversity:blockemberinputhatch:4>,
	6 : <modulardiversity:blockemberinputhatch:5>,
	7 : <modulardiversity:blockemberinputhatch:6>,
	8 : <modulardiversity:blockemberinputhatch:7>
} as IItemStack[int];

for i in 1 .. 9
{
	var j = i - 1;

	//Energy Input Crafting
	recipes.addShaped(scripts.helpers.createRecipeName(EnergyInput[i]), EnergyInput[i], [
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>],
	[MachineParts2[i],
	EnergyInput[j],
	MachineParts2[i]],
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>]]);

	//Energy Output Crafting
	recipes.addShaped(scripts.helpers.createRecipeName(EnergyOutput[i]), EnergyOutput[i], [
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>],
	[MachineParts2[i], EnergyOutput[j], MachineParts2[i]],
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>]]);

	//Fluid Input Crafting
	recipes.addShaped(scripts.helpers.createRecipeName(FluidInput[i]), FluidInput[i], [
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>],
	[MachineParts2[i], FluidInput[j], MachineParts2[i]],
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>]]);

	//Fluid Output Crafting
	recipes.addShaped(scripts.helpers.createRecipeName(FluidOutput[i]), FluidOutput[i], [
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>],
	[MachineParts2[i], FluidOutput[j], MachineParts2[i]],
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>]]);
}

for i in 1 .. 8
{
	var j = i - 1;
	//Item Input Crafting
	recipes.addShaped(scripts.helpers.createRecipeName(ItemInput[i]), ItemInput[i], [
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>],
	[MachineParts2[i], ItemInput[j], MachineParts2[i]],
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>]]);

	//Item Output Crafting
	recipes.addShaped(scripts.helpers.createRecipeName(ItemOutput[i]), ItemOutput[i], [
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>],
	[MachineParts2[i], ItemOutput[j], MachineParts2[i]],
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>]]);

	//Ember Input Crafting
	recipes.addShaped(scripts.helpers.createRecipeName(EmberInput[i]), EmberInput[i], [
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>],
	[MachineParts2[i], EmberInput[j], MachineParts2[i]],
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>]]);

	//Ember Output Crafting
	recipes.addShaped(scripts.helpers.createRecipeName(EmberOutput[i]), EmberOutput[i], [
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>],
	[MachineParts2[i], EmberOutput[j], MachineParts2[i]],
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>]]);
}

//Mana Input and Output
recipes.addShaped(scripts.helpers.createRecipeName(<modulardiversity:blockmanainputhatch>), <modulardiversity:blockmanainputhatch>, [
	[null, <modularmachinery:itemmodularium>, null],
	[<modularmachinery:itemmodularium>, <ore:livingrock>, <modularmachinery:itemmodularium>],
	[null, <modularmachinery:itemmodularium>, null]
]);
recipes.addShaped(scripts.helpers.createRecipeName(<modulardiversity:blockmanaoutputhatch>), <modulardiversity:blockmanaoutputhatch>, [
	[null, <modularmachinery:itemmodularium>, null],
	[<modularmachinery:itemmodularium>, <ore:blockManasteel>, <modularmachinery:itemmodularium>],
	[null, <modularmachinery:itemmodularium>, null]
]);

//Environmental Detectors
recipes.addShaped(scripts.helpers.createRecipeName(<modulardiversity:blockbiomedetector>), <modulardiversity:blockbiomedetector>, [
	[null, <modularmachinery:itemmodularium>, null],
	[<modularmachinery:itemmodularium>, scripts.helpers.BiomeGemMaterial["plate"], <modularmachinery:itemmodularium>],
	[null, <modularmachinery:itemmodularium>, null]
]);
recipes.addShaped(scripts.helpers.createRecipeName(<modulardiversity:blockdaylightdetector>), <modulardiversity:blockdaylightdetector>, [
	[null, <modularmachinery:itemmodularium>, null],
	[<modularmachinery:itemmodularium>, <minecraft:daylight_detector>, <modularmachinery:itemmodularium>],
	[null, <modularmachinery:itemmodularium>, null]
]);
recipes.addShaped(scripts.helpers.createRecipeName(<modulardiversity:blockweatherdetector>), <modulardiversity:blockweatherdetector>, [
	[null, <modularmachinery:itemmodularium>, null],
	[<modularmachinery:itemmodularium>, <quark:rain_detector>, <modularmachinery:itemmodularium>],
	[null, <modularmachinery:itemmodularium>, null]
]);




//Add Crafting Recipes for Machine Casings
//Machine Controller
for item in scripts.helpers.AllT1MagicItems
{
	recipes.addShaped(scripts.helpers.createRecipeName(<modularmachinery:blockcontroller>) ~ item.displayName, <modularmachinery:blockcontroller>, [
		[<modularmachinery:blockcasing>, <extendedcrafting:material:7>, <modularmachinery:blockcasing>],
		[<ore:blockGlassColorless>.firstItem, item, <ore:blockGlassColorless>.firstItem],
		[<modularmachinery:blockcasing>, <extendedcrafting:material:7>, <modularmachinery:blockcasing>]
	]);
}
//Machine Casings
recipes.addShaped(scripts.helpers.createRecipeName(<modularmachinery:blockcasing>), <modularmachinery:blockcasing> * 4, [
	[null, <modularmachinery:itemmodularium>, null],
	[<modularmachinery:itemmodularium>, <ore:dustRedstone>.firstItem, <modularmachinery:itemmodularium>],
	[null, <modularmachinery:itemmodularium>, null]
]); //Basic
recipes.addShaped(scripts.helpers.createRecipeName(<modularmachinery:blockcasing:1>), <modularmachinery:blockcasing:1> * 4, [
	[<modularmachinery:blockcasing>, null, <modularmachinery:blockcasing>],
	[null, <magneticraft:crafting:6>, null],
	[<modularmachinery:blockcasing>, null, <modularmachinery:blockcasing>]
]); //Machine Vent
recipes.addShaped(scripts.helpers.createRecipeName(<modularmachinery:blockcasing:2>), <modularmachinery:blockcasing:2> * 4, [
	[<modularmachinery:blockcasing>, null, <modularmachinery:blockcasing>],
	[null, <natura:nether_glass:1>, null],
	[<modularmachinery:blockcasing>, null, <modularmachinery:blockcasing>]
]); //Firebox Casing
recipes.addShaped(scripts.helpers.createRecipeName(<modularmachinery:blockcasing:3>), <modularmachinery:blockcasing:3> * 4, [
	[<modularmachinery:blockcasing>, <ore:gearIron>.firstItem, <modularmachinery:blockcasing>],
	[<ore:gearEmerald>.firstItem, null, <ore:gearGold>.firstItem],
	[<modularmachinery:blockcasing>, <ore:gearDiamond>.firstItem, <modularmachinery:blockcasing>]
]); //Gearbox
recipes.addShaped(scripts.helpers.createRecipeName(<modularmachinery:blockcasing:4>), <modularmachinery:blockcasing:4> * 4, [
	[<modularmachinery:blockcasing>, <extendedcrafting:material:2>, <modularmachinery:blockcasing>],
	[<extendedcrafting:material:2>, null, <extendedcrafting:material:2>],
	[<modularmachinery:blockcasing>, <extendedcrafting:material:2>, <modularmachinery:blockcasing>]
]); //Reinforced

//Add Coke Oven Recipes
var CokeOven as int[crafttweaker.oredict.IOreDictEntry] =
{
	<ore:gemCoal> : 1,
	<ore:blockCoal> : 9,
	<ore:logPile> : 3
};

for OreEntry, outputMulti in CokeOven
{
	if(!OreEntry.empty)
	{
		var CokeOven = RecipeBuilder.newBuilder("cokeoven_" ~ OreEntry.name, "coke_oven", 4800 * outputMulti);
		CokeOven.addItemInput(OreEntry);
		CokeOven.addFluidOutput(<liquid:creosote> * (125 * outputMulti));
		CokeOven.addItemOutput(<thermalfoundation:material:802> * outputMulti);
		CokeOven.build();
	}
}

//Add Ember Power Production Recipes
var EmberPlant as int[IItemStack] =
{
	<embers:crystal_ember> : 10000,
	<embers:shard_ember> : 1666,
	<embers:ancient_motive_core> : 45000,
	<contenttweaker:crystal_ember_fire> : 125000,
	<contenttweaker:crystal_ember_water> : 125000,
	<contenttweaker:crystal_ember_earth> : 125000,
	<contenttweaker:crystal_ember_air> : 125000
};

for burnItem, powerOutput in EmberPlant
{
	var EmberPowerProduction = RecipeBuilder.newBuilder("embers_converter_" ~ burnItem.displayName, "embers_converter", 200);
	EmberPowerProduction.addItemInput(burnItem);
	EmberPowerProduction.addEnergyPerTickOutput(powerOutput / 200);
	EmberPowerProduction.build();
}

//Add Thaumcraft Power Production Recipes
var ThaumcraftCrystalGen as int[IItemStack] =
{
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aer"}]}) : 7500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "terra"}]}) : 7500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ignis"}]}) : 7500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aqua"}]}) : 7500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "ordo"}]}) : 7500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "perditio"}]}) : 7500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "permutatio"}]}) : 12500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "potentia"}]}) : 12500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "mortuus"}]}) : 12500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "victus"}]}) : 12500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "metallum"}]}) : 12500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitreus"}]}) : 12500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "gelum"}]}) : 12500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "motus"}]}) : 12500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "lux"}]}) : 12500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vacuos"}]}) : 12500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "auram"}]}) : 27500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "alkimia"}]}) : 27500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vitium"}]}) : 27500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "alienis"}]}) : 27500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "volatus"}]}) : 27500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "herba"}]}) : 27500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "instrumentum"}]}) : 27500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "vinculum"}]}) : 27500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "cognitio"}]}) : 27500,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "fabrico"}]}) : 50000,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "tenebrae"}]}) : 50000,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "machina"}]}) : 50000,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "spiritus"}]}) : 50000,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "desiderium"}]}) : 50000,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "exanimis"}]}) : 50000,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "bestia"}]}) : 50000,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "humanus"}]}) : 50000,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "mythus"}]}) : 50000,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "draco"}]}) : 50000,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "sensus"}]}) : 50000,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "aversio"}]}) : 50000,
	<thaumcraft:crystal_essence>.withTag({Aspects: [{amount: 1, key: "praemunio"}]}) : 50000
};

for burnItem, powerOutput in ThaumcraftCrystalGen
{
	var ThaumicPowerProduction = RecipeBuilder.newBuilder("thaumic_energy_" ~ burnItem.displayName, "thaumic_energy_converter", 160);
	ThaumicPowerProduction.addItemInput(burnItem);
	ThaumicPowerProduction.addEnergyPerTickOutput(powerOutput / 160);

	//Add some output items for more valuable crystals
	if(powerOutput >= 12500)
	{
		ThaumicPowerProduction.addItemOutput(<thaumcraft:nugget:5>);
		ThaumicPowerProduction.setChance(0.1);
	}
	if(powerOutput >= 27500)
	{

		ThaumicPowerProduction.addItemOutput(<thermalfoundation:material:16>);
		ThaumicPowerProduction.setChance(0.04);
		ThaumicPowerProduction.addItemOutput(<extendedcrafting:material:129>);
		ThaumicPowerProduction.setChance(0.04);
	}
	if(powerOutput >= 50000)
	{
		ThaumicPowerProduction.addItemOutput(<thaumcraft:nugget:10>);
		ThaumicPowerProduction.setChance(0.02);
	}
	ThaumicPowerProduction.build();
}

print("### Modular Machinery Init Complete ###");
