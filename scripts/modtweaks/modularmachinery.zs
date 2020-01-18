import mods.modularmachinery.RecipeBuilder;
import crafttweaker.item.IItemStack;

print("~~~ Begin Modular Machinery Init ~~~");

//Change Modularium Recipes
recipes.removeByRecipeName("modularmachinery:modularium_ingot");
mods.extendedcrafting.TableCrafting.addShapeless(0, <modularmachinery:itemmodularium> * 4, [<ore:ingotBlackIron>, <ore:ingotBlackIron>, <ore:ingotBlackIron>, <ore:ingotBlackIron>, <ore:ingotGold>, <ore:ingotGold>, <ore:dustRedstone>, <ore:dustGlowstone>]);

//Add Modularium Alloying/Casting
mods.tconstruct.Alloy.addRecipe(<liquid:molten_modularium> * 288, [<liquid:molten_black_iron> * 288, <liquid:redstone> * 50, <liquid:gold> * 144, <liquid:glowstone> * 125]);
mods.tconstruct.Casting.addTableRecipe(<modularmachinery:itemmodularium>, <tconstruct:cast_custom>, <liquid:molten_modularium>, 144, false);

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

for i in 1 .. 9
{
	var j = i - 1;

	//Energy Input Crafting
	recipes.addShaped(EnergyInput[i].name, EnergyInput[i], [
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>],
	[MachineParts2[i],
	EnergyInput[j],
	MachineParts2[i]],
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>]]);

	//Energy Output Crafting
	recipes.addShaped(EnergyOutput[i].name, EnergyOutput[i], [
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>],
	[MachineParts2[i], EnergyOutput[j], MachineParts2[i]],
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>]]);

	//Fluid Input Crafting
	recipes.addShaped(FluidInput[i].name, FluidInput[i], [
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>],
	[MachineParts2[i], FluidInput[j], MachineParts2[i]],
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>]]);

	//Fluid Output Crafting
	recipes.addShaped(FluidOutput[i].name, FluidOutput[i], [
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>],
	[MachineParts2[i], FluidOutput[j], MachineParts2[i]],
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>]]);
}

for i in 1 .. 8
{
	var j = i - 1;
	//Item Input Crafting
	recipes.addShaped(ItemInput[i].name, ItemInput[i], [
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>],
	[MachineParts2[i], ItemInput[j], MachineParts2[i]],
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>]]);

	//Item Output Crafting
	recipes.addShaped(ItemOutput[i].name, ItemOutput[i], [
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>],
	[MachineParts2[i], ItemOutput[j], MachineParts2[i]],
	[<modularmachinery:itemmodularium>, MachineParts1[i], <modularmachinery:itemmodularium>]]);
}

//Add Crafting Recipes for Machine Casings
//Machine Controller
val controllerBlockOptions =
[
<botania:rune>,
<botania:rune:1>,
<botania:rune:2>,
<botania:rune:3>,
<contenttweaker:astral_crystal_air>,
<contenttweaker:astral_crystal_fire>,
<contenttweaker:astral_crystal_water>,
<contenttweaker:astral_crystal_earth>
] as crafttweaker.item.IItemStack[];

for item in controllerBlockOptions
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockcontroller>, [
		[<modularmachinery:blockcasing>, <extendedcrafting:material:7>, <modularmachinery:blockcasing>],
		[<ore:blockGlassColorless>, item, <ore:blockGlassColorless>],
		[<modularmachinery:blockcasing>, <extendedcrafting:material:7>, <modularmachinery:blockcasing>]
	]);
}

//Machine Casings
mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockcasing> * 4, [
	[null, <modularmachinery:itemmodularium>, null],
	[<modularmachinery:itemmodularium>, <ore:dustRedstone>, <modularmachinery:itemmodularium>],
	[null, <modularmachinery:itemmodularium>, null]
]); //Basic
mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockcasing:1> * 4, [
	[<modularmachinery:blockcasing>, null, <modularmachinery:blockcasing>],
	[null, <magneticraft:crafting:6>, null],
	[<modularmachinery:blockcasing>, null, <modularmachinery:blockcasing>]
]); //Machine Vent
mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockcasing:2> * 4, [
	[<modularmachinery:blockcasing>, null, <modularmachinery:blockcasing>],
	[null, <natura:nether_glass:1>, null],
	[<modularmachinery:blockcasing>, null, <modularmachinery:blockcasing>]
]); //Firebox Casing
mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockcasing:3> * 4, [
	[<modularmachinery:blockcasing>, <ore:gearIron>, <modularmachinery:blockcasing>],
	[<ore:gearEmerald>, null, <ore:gearGold>],
	[<modularmachinery:blockcasing>, <ore:gearDiamond>, <modularmachinery:blockcasing>]
]); //Gearbox
mods.extendedcrafting.TableCrafting.addShaped(0, <modularmachinery:blockcasing:4> * 4, [
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

print("### Modular Machinery Init Complete ###");
