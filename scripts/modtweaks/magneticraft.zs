
print("~~~ Begin Magneticraft Init ~~~");

//Item Variables
var motor as crafttweaker.item.IItemStack = scripts.helpers.MotorTiers[0];
var batteryLow as crafttweaker.item.IItemStack = <magneticraft:battery_item_low>;
var batteryMed as crafttweaker.item.IItemStack = <magneticraft:battery_item_medium>;

//Disable Crushing Table and Hydraulic Press
mods.jei.JEI.hideCategory("magneticraft.hydraulic_press");
mods.jei.JEI.hideCategory("magneticraft.crushing_table");
scripts.helpers.unstageAndHide(<magneticraft:hydraulic_press>);
scripts.helpers.unstageAndHide(<magneticraft:crushing_table>);

//Add Limestone to OreDict and Chisel Groups
<ore:stoneLimestone>.add(<magneticraft:limestone>);
<ore:stoneLimestone>.add(<magneticraft:limestone:1>);
<ore:stoneLimestone>.add(<magneticraft:limestone:2>);
mods.chisel.Carving.addVariation("limestone", <magneticraft:limestone:2>);
mods.chisel.Carving.addVariation("limestone", <magneticraft:limestone>);

//Add the oil stone to an OreDict for the scanner
<ore:oreOil>.add(<magneticraft:oil_source:*>);

//Hide Magneticraft Items
val magneticraftHide =
[
	<magneticraft:light_plates>,
	<magneticraft:heavy_plates:6>,
	<magneticraft:heavy_plates:5>,
	<magneticraft:heavy_plates:3>,
	<magneticraft:heavy_plates:2>,
	<magneticraft:heavy_plates:1>,
	<magneticraft:heavy_plates>,
	<magneticraft:light_plates:3>,
	<magneticraft:light_plates:2>,
	<magneticraft:light_plates:1>,
	<magneticraft:light_plates:6>,
	<magneticraft:light_plates:5>,
	<magneticraft:iron_gear>,
	<magneticraft:broken_gear>,
	<magneticraft:steel_gear>,
	<magneticraft:tungsten_gear>,
	<magneticraft:pneumatic_tube>,
	<magneticraft:pneumatic_restriction_tube>,
	<magneticraft:relay>,
	<magneticraft:filter>,
	<magneticraft:transposer>,
	<magneticraft:stone_hammer>,
	<magneticraft:iron_hammer>,
	<magneticraft:steel_hammer>,
] as crafttweaker.item.IItemStack[];

for magneticraftPlate in magneticraftHide
{
	scripts.helpers.unstageAndHide(magneticraftPlate);
}

//Replace Plates with OreDict
for item in loadedMods["magneticraft"].items {
	recipes.replaceAllOccurences(<magneticraft:light_plates>, <ore:plateIron>, item);
	recipes.replaceAllOccurences(<magneticraft:light_plates:1>, <ore:plateGold>, item);
	recipes.replaceAllOccurences(<magneticraft:light_plates:2>, <ore:plateCopper>, item);
	recipes.replaceAllOccurences(<magneticraft:light_plates:3>, <ore:plateLead>, item);
	recipes.replaceAllOccurences(<magneticraft:light_plates:5>, <ore:plateTungsten>, item);
	recipes.replaceAllOccurences(<magneticraft:light_plates:6>, <ore:plateSteel>, item);
}

//Disable Rocky Chunks being able to be smelted in a furnace
<ore:rockyChunkLead>.add(<magneticraft:rocky_chunks:8>); //Add Galena Chunk to Lead since they're not in the same oreDict

function removeChunkSmelt(material as string)
{
	//Combining string
	val rockyChunk = "rockyChunk" ~ material; //The ore/material used to obtain the ingot from the rocky chunk
	val ingotFromChunk = "ingot" ~ material;

	//If an oreDict for the rocky chunk exists, loop through all forms of the chunk
	if (!oreDict.get(rockyChunk).empty)
	{
		for rock in oreDict.get(rockyChunk).items
		{
			if(!oreDict.get(ingotFromChunk).empty)
			{
				for bar in oreDict.get(ingotFromChunk).items
				{
					//If both a chunk and ingot exist for the material given, remove the smelting recipe accordingly.
					furnace.remove(bar, rock);
				}
			}
		}
	}
}

val oreMaterials =
[
	"Ardite",
	"AstralStarmetal",
	"Chromium",
	"Draconium",
	"Iridium",
	"Necrodermis",
	"Platinum",
	"Thorium",
	"Titanium",
	"Vibranium",
	"Iron",
	"Gold",
	"Copper",
	"Lead",
	"Cobalt",
	"Tungsten",
	"Aluminium",
	"Mithril",
	"Nickel",
	"Osmium",
	"Silver",
	"Tin",
	"Zinc",
	"Magnesium",
	"Boron",
	"Lithium"
] as string[];

for materialString in oreMaterials
{
	removeChunkSmelt(materialString);
}

val magneticraftRecipes_CRAFTINGTABLE = {
	motor as crafttweaker.item.IItemStack * 4 : [[<ore:ingotIron>, <ore:ingotIron>, null], [<ore:ingotRedstoneAlloy>, <ore:dustRedstone>, <ore:ingotCrudeSteel>], [<ore:ingotIron>, <ore:ingotIron>, null]],
	<magneticraft:conveyor_belt> * 16 : [[null, null, null], [<ore:ingotIron>, motor, <ore:ingotIron>], [<ore:ingotIron>, null, <ore:ingotIron>]],
	<magneticraft:inserter> * 4 : [[<ore:ingotRedstoneAlloy>, <ore:nuggetIron>, null], [<ore:nuggetIron>, <ore:ingotRedstoneAlloy>, <ore:nuggetIron>], [<ore:ingotIron>, motor, <ore:ingotIron>]],
	batteryMed as crafttweaker.item.IItemStack : [[null, <ore:ingotElectrotineAlloy>, null], [<ore:ingotConductiveIron>, batteryLow, <ore:ingotConductiveIron>], [<ore:ingotConductiveIron>, batteryLow, <ore:ingotConductiveIron>]],
	batteryLow as crafttweaker.item.IItemStack * 2 : [[null, <ore:dustElectrotine>, null], [<ore:ingotIron>, <ore:dustSulfur>, <ore:ingotIron>], [<ore:ingotIron>, <ore:dustSulfur>, <ore:ingotIron>]],
	<magneticraft:multiblock_parts:2> * 4 : [[null, <ore:ingotCrudeSteel>, null], [<ore:ingotCrudeSteel>, <ore:stone>, <ore:ingotCrudeSteel>], [null, <ore:ingotCrudeSteel>, null]],
	<magneticraft:multiblock_parts:4> : [[<ore:ingotIron>, <ore:ingotElectrotineAlloy>, <ore:ingotIron>], [<ore:plateIron>, <ore:ingotElectrotineAlloy>, <ore:plateIron>], [<ore:ingotIron>, <ore:ingotElectrotineAlloy>, <ore:ingotIron>]],
	<magneticraft:multiblock_column> * 4 : [[<ore:ingotIron>, <ore:stone>, <ore:ingotIron>], [<ore:plateIron>, null, <ore:plateIron>], [<ore:ingotIron>, <ore:stone>, <ore:ingotIron>]],
	<magneticraft:multiblock_parts:5> * 8 : [[<ore:plateIron>, <ore:nuggetIron>, <ore:plateIron>], [<ore:ingotIron>, null, <ore:ingotIron>], [<ore:plateIron>, <ore:nuggetIron>, <ore:plateIron>]],
	<magneticraft:multiblock_parts:1> * 8 : [[<ore:plateLapis>, <ore:blockQuartz>, <ore:plateLapis>], [<ore:blockQuartz>, <advancedrocketry:ic>, <ore:blockQuartz>], [<ore:plateLapis>, <ore:blockQuartz>, <ore:plateLapis>]],
	<magneticraft:multiblock_parts> * 4 : [[<ore:ingotIron>, <ore:plateIron>, <ore:ingotIron>], [<ore:ingotIron>, motor, <ore:ingotIron>], [<ore:ingotConductiveIron>, <ore:plateConductiveIron>, <ore:ingotConductiveIron>]],
	<magneticraft:iron_pipe> * 16 : [[<ore:ingotBronze>, null, <ore:ingotBronze>], [<ore:nuggetBronze>, <ore:blockGlassColorless>, <ore:nuggetBronze>], [<ore:ingotBronze>, null, <ore:ingotBronze>]],
	<magneticraft:heat_pipe> * 5 : [[null, <ore:ingotIron>, null], [<ore:ingotIron>, <ore:plateConductiveIron>, <ore:ingotIron>], [null, <ore:ingotIron>, null]],
	<magneticraft:insulated_heat_pipe> * 5 : [[<ore:ingotBrick>, <ore:ingotIron>, <ore:ingotBrick>], [<ore:ingotIron>, <ore:plateConductiveIron>, <ore:ingotIron>], [<ore:ingotBrick>, <ore:ingotIron>, <ore:ingotBrick>]],
	<magneticraft:feeding_trough> : [[<ore:stickWood>, null, <ore:stickWood>], [<ore:plateWood>, null, <ore:plateWood>], [<ore:plankWood>, <ore:plankWood>, <ore:plankWood>]],
	<magneticraft:brick_furnace> : [[<ore:ingotBrick>, <ore:ingotBrick>, <ore:ingotBrick>], [<ore:ingotBrick>, null, <ore:ingotBrick>], [<ore:ingotBrick>, <ore:plateConductiveIron>, <ore:ingotBrick>]],
	<magneticraft:thermometer> : [[<ore:ingotConductiveIron>, <ore:paper>, <ore:ingotConductiveIron>], [<ore:ingotConductiveIron>, <ore:dustRedstone>, <ore:ingotConductiveIron>], [<ore:ingotConductiveIron>, <ore:blockGlassColorless>, <ore:ingotConductiveIron>]],
	<magneticraft:voltmeter> : [[<ore:ingotGold>, <ore:paper>, <ore:ingotGold>], [<ore:ingotGold>, <ore:dustRedstone>, <ore:ingotGold>], [<ore:ingotGold>, <ore:blockGlassColorless>, <ore:ingotGold>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in magneticraftRecipes_CRAFTINGTABLE {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

val magneticraftRecipes_EXTENDEDCRAFTING = {
	<magneticraft:solar_panel> : [[<ore:itemPlatePhotovoltaic>, null, <ore:itemPlatePhotovoltaic>], [<ore:gemQuartz>, <ore:paper>, <ore:gemQuartz>], [<ore:itemPlatePhotovoltaic>, null, <ore:itemPlatePhotovoltaic>]],
	<magneticraft:shelving_unit> : [[<ore:barsIron>, null, <ore:barsIron>], [null, <ore:paper>, null], [<ore:barsIron>, null, <ore:barsIron>]],
	<magneticraft:container> : [[<chisel:blockgold:1>, null, <chisel:blockgold:1>], [<minecraft:chest>, <ore:paper>, <minecraft:chest>], [<ore:plateCrudeSteel>, null, <ore:plateCrudeSteel>]],
	<magneticraft:combustion_chamber> : [[<ore:ingotBrick>, <ore:plateIron>, <ore:ingotBrick>], [<ore:ingotBrick>, null, <ore:ingotIron>], [<ore:ingotBrick>, <ore:ingotBrick>, <ore:ingotBrick>]],
	<magneticraft:steam_boiler> : [[<ore:ingotIron>, <ore:plateIron>, <ore:ingotIron>], [<ore:ingotIron>, null, <ore:ingotIron>], [<ore:ingotIron>, <ore:plateIron>, <ore:ingotIron>]],
	<magneticraft:electric_drill> : [[<ore:gemDiamond>, <ore:gemDiamond>, <ore:ingotElectrotineAlloy>], [<ore:gemDiamond>, motor, <ore:ingotIron>], [<ore:ingotElectrotineAlloy>, <ore:ingotIron>, batteryLow]],
	<magneticraft:electric_chainsaw> : [[<ore:gemDiamond>, <ore:ingotElectrotineAlloy>, null], [<ore:ingotElectrotineAlloy>, motor, <ore:ingotIron>], [null, <ore:ingotIron>, batteryLow]],
	<magneticraft:electric_piston> : [[<minecraft:piston>, <ore:ingotElectrotineAlloy>, null], [<ore:ingotElectrotineAlloy>, motor, <ore:ingotElectrotineAlloy>], [null, <ore:ingotElectrotineAlloy>, batteryLow]],
	<magneticraft:small_tank> : [[<ore:blockGlassColorless>, <ore:ingotGold>, <ore:blockGlassColorless>], [<ore:ingotCrudeSteel>, null, <ore:ingotCrudeSteel>], [<ore:blockGlassColorless>, <ore:ingotGold>, <ore:blockGlassColorless>]],
	<magneticraft:rf_heater> : [[<ore:ingotIron>, <ore:ingotRedstoneAlloy>, <ore:ingotIron>], [<ore:ingotIron>, <magneticraft:multiblock_parts:2>, <ore:ingotIron>], [<ore:dustRedstone>, <ore:ingotGold>, <ore:dustRedstone>]],
	<magneticraft:electric_engine> : [[<ore:plateIron>, <ore:plateIron>, <ore:plateIron>], [null, <ore:blockGlassColorless>, null], [motor, <minecraft:piston>, motor]],
	<magneticraft:electric_furnace> : [[<ore:ingotIron>, <minecraft:furnace>, <ore:ingotIron>], [<ore:ingotBrick>, scripts.helpers.FrameTiers[0], <ore:ingotBrick>], [<ore:ingotBrick>, scripts.helpers.MotorTiers[0], <ore:ingotBrick>]],
	<magneticraft:sluice_box> : [[<ore:plateSealedWood>, <ore:stickWood>, null], [<magneticraft:crafting:5>, <ore:plateSealedWood>, <ore:stickWood>], [<ore:slabStone>, <ore:slabStone>, <ore:slabStone>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in magneticraftRecipes_EXTENDEDCRAFTING {
	recipes.remove(key.withAmount(1));
	mods.extendedcrafting.TableCrafting.addShaped(0, key, value);
}

//Extended Crafting Recipes (T2 Table)
val magneticraft_EXTENDEDCRAFTING_T2 = {
	 <magneticraft:grinder>	:		[[null, <ore:itemFlint>, null],
									[motor, scripts.helpers.FrameTiers[1], motor],
									[null, <thermalfoundation:material:656>, null],
									[<ore:paper>, <ore:ingotSteel>, <ore:gearDiamond>]],
	 <magneticraft:sieve>	:		[[null, <ore:itemFlint>, null],
									[<ore:ingotSteel>, scripts.helpers.FrameTiers[1], <ore:ingotSteel>],
									[null, <ore:gearSteel>, null],
									[<ore:paper>, <magneticraft:crafting:5>, <ore:gearDiamond>]],
<magneticraft:big_electric_furnace>:[[<advancedrocketry:blastbrick>, <ore:gearCopper>, <advancedrocketry:blastbrick>],
									[<advancedrocketry:blastbrick>, scripts.helpers.FrameTiers[1], <advancedrocketry:blastbrick>],
									[<advancedrocketry:blastbrick>, <ore:coilGold>, <advancedrocketry:blastbrick>],
									[<ore:paper>, <advancedrocketry:blastbrick>, <ore:plateElectrum>]],
<magneticraft:big_steam_boiler>	:	[[<ore:ingotIron>, <ore:plateIron>, <ore:ingotIron>],
									[<ore:ingotIron>, scripts.helpers.FrameTiers[1], <ore:ingotIron>],
									[<ore:ingotIron>, <ore:plateIron>, <ore:ingotIron>],
									[<ore:paper>, <ore:ingotSteel>, <ore:gearRedstoneAlloy>]],
<magneticraft:steam_turbine>	:	[[<ore:ingotSteel>, <ore:plateBronze>, <ore:ingotSteel>],
									[null, scripts.helpers.FrameTiers[1], null],
									[<ore:ingotSteel>, <ore:plateBronze>, <ore:ingotSteel>],
									[<ore:paper>, <ore:ingotSteel>, <ore:plateBronze>]],
	 <magneticraft:solar_tower>	:	[[<enderio:item_material:3>, <enderio:item_material:3>, <enderio:item_material:3>],
									[<ore:ingotSteel>, scripts.helpers.FrameTiers[1], <ore:ingotSteel>],
									[<ore:ingotSteel>, <magneticraft:insulated_heat_pipe>, <ore:ingotSteel>],
									[<ore:paper>, <ore:coilCopper>, <ore:plateLumium>]],
 <magneticraft:solar_mirror>	:	[[<ore:blockGlassColorless>, <ore:blockGlassColorless>, <ore:blockGlassColorless>],
									[<ore:ingotSteel>, scripts.helpers.FrameTiers[1], <ore:ingotSteel>],
									[<ore:ingotSteel>, <ore:coilGold>, <ore:ingotSteel>],
									[<ore:paper>, null, <ore:plateLumium>]],
<magneticraft:big_combustion_chamber>	:	[[<advancedrocketry:blastbrick>, <advancedrocketry:blastbrick>, <advancedrocketry:blastbrick>],
									[<advancedrocketry:blastbrick>, scripts.helpers.FrameTiers[1], <advancedrocketry:blastbrick>],
									[<advancedrocketry:blastbrick>, <advancedrocketry:blastbrick>, <advancedrocketry:blastbrick>],
									[<ore:paper>, <ore:coilCopper>, <ore:ingotBronze>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in magneticraft_EXTENDEDCRAFTING_T2 {
	recipes.remove(key.withAmount(1));
	scripts.helpers.createAdvancedCraftingRecipe(key, value, value[3][0], value[3][1], value[3][2], "", true);
}

//Post Stage 1 Recipes
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(motor) ~ scripts.helpers.stages.progression3.stage, scripts.helpers.stages.progression3.stage, motor * 4, [[<ore:ingotIron>, <ore:ingotIron>, null], [<ore:ingotRedstoneAlloy>, <ore:dustRedstone>, <ore:ingotCopper>], [<ore:ingotIron>, <ore:ingotIron>, null]]); //Motor
mods.forestry.Carpenter.addRecipe(motor * 4, [[<ore:ingotIron>, <ore:ingotIron>, null], [<ore:ingotRedstoneAlloy>, <ore:dustRedstone>, <ore:ingotCopper>], [<ore:ingotIron>, <ore:ingotIron>, null]], 40, <liquid:water> * 1000); //Motor
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<magneticraft:multiblock_parts:2>) ~ scripts.helpers.stages.progression2.stage, scripts.helpers.stages.progression2.stage, <magneticraft:multiblock_parts:2> * 4, [[null, <ore:ingotSteel>, null], [<ore:ingotSteel>, <ore:stone>, <ore:ingotSteel>], [null, <ore:ingotSteel>, null]]); //Steel Grate
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<magneticraft:container>) ~ scripts.helpers.stages.progression2.stage, scripts.helpers.stages.progression2.stage, <magneticraft:container>, [[<chisel:blockgold:1>, null, <chisel:blockgold:1>], [<minecraft:chest>, <ore:paper>, <minecraft:chest>], [<ore:plateSteel>, null, <ore:plateSteel>]]);

//Guide Book Crafting
recipes.remove(<magneticraft:guide_book>);
recipes.addShapeless(scripts.helpers.createRecipeName(<magneticraft:guide_book>), <magneticraft:guide_book>, [<ore:book>, <ore:ingotRedstoneAlloy>]);

//Alternative Insulated Brick Pipe
recipes.addShaped(scripts.helpers.createRecipeName(<magneticraft:insulated_heat_pipe>) ~ "_1", <magneticraft:insulated_heat_pipe> * 5, [[<ore:ingotBrick>, <magneticraft:heat_pipe>, <ore:ingotBrick>], [<magneticraft:heat_pipe>, <magneticraft:heat_pipe>, <magneticraft:heat_pipe>], [<ore:ingotBrick>, <magneticraft:heat_pipe>, <ore:ingotBrick>]]);

//Tooltips
scripts.helpers.AddTooltip(<magneticraft:container>, ["Stores 15000 of one block or item within it.", "If broken, only up to 8192 will be dropped to stop frame killing!"]);
scripts.helpers.AddTooltip(<magneticraft:small_tank>, ["Stores 32,000mb of liquid.", "Does not keep its contents if broken!"]);
scripts.helpers.AddTooltip(<magneticraft:brick_furnace>, ["Operates like a standard vanilla furnace.", "Uses heat from nearby generators rather than fuel!"]);

//Alternative Small Tank recipe after stage 1
mods.extendedcrafting.TableCrafting.addShaped(0, <magneticraft:small_tank>, [[<ore:blockGlassColorless>, <ore:ingotGold>, <ore:blockGlassColorless>], [<ore:ingotSteel>, null, <ore:ingotSteel>], [<ore:blockGlassColorless>, <ore:ingotGold>, <ore:blockGlassColorless>]]);

//Water Generator
recipes.remove(<magneticraft:water_generator>);
for rune in scripts.helpers.AllWaterT1Items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <magneticraft:water_generator>, [[<ore:gemDiamond>, rune, <ore:gemDiamond>], [<ore:ingotPulsatingIron>, <thermalexpansion:device>, <ore:ingotPulsatingIron>], [<ore:gemDiamond>, <ore:ingotPulsatingIron>, <ore:gemDiamond>]]);
}

//Thermopile
recipes.remove(<magneticraft:thermopile>);
for circuit in scripts.helpers.CircuitTiers[0].items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <magneticraft:thermopile>, [[<ore:ingotGold>, <ore:plateConductiveIron>, <ore:ingotGold>], [<ore:plateConductiveIron>, scripts.helpers.FrameTiers[0], <ore:plateConductiveIron>], [<ore:ingotGold>, circuit, <ore:ingotGold>]]);
}

//Electric Cables
recipes.remove(<magneticraft:electric_cable>);
recipes.addShaped(scripts.helpers.createRecipeName(<magneticraft:electric_cable>) ~ "_1", <magneticraft:electric_cable> * 3, [[null, <ore:blockWool>, null], [<ore:blockWool>, <ore:ingotElectrotineAlloy>, <ore:blockWool>], [null, <ore:blockWool>, null]]);
recipes.addShaped(scripts.helpers.createRecipeName(<magneticraft:electric_cable>) ~ "_2", <magneticraft:electric_cable> * 5, [[null, <minecraft:leather>, null], [<minecraft:leather>, <ore:ingotElectrotineAlloy>, <minecraft:leather>], [null, <minecraft:leather>, null]]);
recipes.addShaped(scripts.helpers.createRecipeName(<magneticraft:electric_cable>) ~ "_3", <magneticraft:electric_cable> * 8, [[<ore:blockGlassColorless>, <ore:dustRedstone>, <ore:blockGlassColorless>], [<ore:dustRedstone>, <ore:ingotElectrotineAlloy>, <ore:dustRedstone>], [<ore:blockGlassColorless>, <ore:dustRedstone>, <ore:blockGlassColorless>]]);

//Steam Engine Recipe
recipes.remove(<magneticraft:steam_engine>);
mods.extendedcrafting.TableCrafting.addShaped(0, <magneticraft:steam_engine>, [[null, <ore:plateConductiveIron>, null], [<contenttweaker:astral_crystal_water>, <ore:paper>, <contenttweaker:astral_crystal_fire>], [null, <ore:plateConductiveIron>, null]]);
mods.extendedcrafting.TableCrafting.addShaped(0, <magneticraft:steam_engine>, [[null, <ore:plateConductiveIron>, null], [<ore:runeWaterB>.firstItem, <ore:paper>, <ore:runeFireB>.firstItem], [null, <ore:plateConductiveIron>, null]]);
mods.extendedcrafting.TableCrafting.addShaped(0, <magneticraft:steam_engine>, [[null, <ore:plateConductiveIron>, null], [<contenttweaker:sanguine_gem_water>, <ore:paper>, <contenttweaker:sanguine_gem_fire>], [null, <ore:plateConductiveIron>, null]]);
mods.extendedcrafting.TableCrafting.addShaped(0, <magneticraft:steam_engine>, [[null, <ore:plateConductiveIron>, null], [<contenttweaker:crystal_ember_water>, <ore:paper>, <contenttweaker:crystal_ember_fire>], [null, <ore:plateConductiveIron>, null]]);
mods.extendedcrafting.TableCrafting.addShaped(0, <magneticraft:steam_engine>, [[null, <ore:plateConductiveIron>, null], [<contenttweaker:salis_mundus_water>, <ore:paper>, <contenttweaker:salis_mundus_fire>], [null, <ore:plateConductiveIron>, null]]);
mods.extendedcrafting.TableCrafting.addShaped(0, <magneticraft:steam_engine>, [[null, <ore:plateConductiveIron>, null], [<contenttweaker:elemental_mote_water>, <ore:paper>, <contenttweaker:elemental_mote_fire>], [null, <ore:plateConductiveIron>, null]]);

//Battey Box
recipes.remove(<magneticraft:battery>);
for circuit in scripts.helpers.CircuitTiers[0].items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <magneticraft:battery>, [[<ore:plateCrudeSteel>, <ore:ingotRedstoneAlloy>, <ore:plateCrudeSteel>], [<magneticraft:battery_item_medium>, circuit, <magneticraft:battery_item_medium>], [<ore:plateCrudeSteel>, <ore:ingotRedstoneAlloy>, <ore:plateCrudeSteel>]]);
	mods.extendedcrafting.TableCrafting.addShaped(0, <magneticraft:battery>, [[<ore:plateSteel>, <ore:ingotRedstoneAlloy>, <ore:plateSteel>], [<magneticraft:battery_item_medium>, circuit, <magneticraft:battery_item_medium>], [<ore:plateSteel>, <ore:ingotRedstoneAlloy>, <ore:plateSteel>]]);
}

//Ore Processing Tier Tooltips
<magneticraft:sluice_box>.addTooltip(scripts.helpers.createTierTooltip("Processes up to Tier ", 1, false, " Ores, with a 2.5x output rate."));
<magneticraft:sieve>.addTooltip(scripts.helpers.createTierTooltip("Processes up to Tier ", 2, false, " Ores, with a 2.75x output rate."));
<magneticraft:grinder>.addTooltip(scripts.helpers.createTierTooltip("Processes up to Tier ", 2, false, " Ores, with a 2.0x output rate."));
<magneticraft:grinder>.addTooltip(scripts.helpers.createTierTooltip("Crusher Tier ", 2, false, "."));

//Stage 2 Conveyors
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<magneticraft:conveyor_belt>) ~ scripts.helpers.stages.progression2.stage, scripts.helpers.stages.progression2.stage, <magneticraft:conveyor_belt> * 32, [[null, null, null], [<ore:ingotSteel>, motor, <ore:ingotSteel>], [<ore:ingotSteel>, null, <ore:ingotSteel>]]);

//New Creation w/ Rubber or Oil + Coal Dust
scripts.helpers.addFluidInfusionRecipe(<liquid:plastic> * 1000, <industrialforegoing:dryrubber> * 4, <liquid:ethene> * 1000, 15000, 3);
scripts.helpers.addFluidInfusionRecipe(<liquid:plastic> * 1000, <thermalfoundation:material:768> * 2, <liquid:lpg> * 1000, 25000, 3);

//Change refinery output for Petroleum Gas
mods.magneticraft.Refinery.removeRecipe(<liquid:lpg>);
mods.magneticraft.Refinery.addRecipe(<liquid:lpg> * 10, <liquid:refined_oil> * 6, <liquid:natural_gas> * 4, null, 1);

//Form Liquid Plastic into HDPE Pellets
mods.nuclearcraft.ingot_former.addRecipe(<liquid:plastic> * 250, <mekanism:polyethene>);

//Create Tier 0 Circuits with Tier 1 Circuits
mods.recipestages.Recipes.addShapeless(scripts.helpers.createRecipeName(scripts.helpers.CircuitTiers[0]) ~ "_uncrafting", scripts.helpers.stages.progression2.stage, scripts.helpers.CircuitTiers[0] * 2, [scripts.helpers.CircuitTiers[1]]);

//Change Pyrite Processing
mods.thermalexpansion.Pulverizer.removeRecipe(<magneticraft:ores:4>);
mods.enderio.SagMill.removeRecipe(<magneticraft:ores:4>);
mods.magneticraft.Grinder.removeRecipe(<magneticraft:ores:4>);
scripts.helpers.addCrushingRecipeWithSecondary(<ore:dustSulfur>.firstItem * 4, <magneticraft:ores:4>, 4000, <ore:dustSmallIron>.firstItem * 2, 25, 1);

print("### Magneticraft Init Complete ###");
