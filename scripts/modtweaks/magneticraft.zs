
print("~~~ Begin Magneticraft Init ~~~");

//Item Variables
var motor as crafttweaker.item.IItemStack = <magneticraft:crafting:2>;
var batteryLow as crafttweaker.item.IItemStack = <magneticraft:battery_item_low>;
var batteryMed as crafttweaker.item.IItemStack = <magneticraft:battery_item_medium>;

//Disable Crushing Table and Hydraulic Press
mods.jei.JEI.hideCategory("magneticraft.hydraulic_press");
mods.jei.JEI.hideCategory("magneticraft.crushing_table");
scripts.helpers.unstageAndHide(<magneticraft:hydraulic_press>);
scripts.helpers.unstageAndHide(<magneticraft:crushing_table>);

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
	<magneticraft:battery>,
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
	"Uranium",
	"Vibranium",
	"Yellorium",
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
	"Zinc"
] as string[];

for materialString in oreMaterials
{
	removeChunkSmelt(materialString);
}

//<magneticraft:electric_cable>
//<magneticraft:electric_engine>
//<magneticraft:rf_heater>

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
	<magneticraft:iron_pipe> * 16 : [[<ore:ingotIron>, null, <ore:ingotIron>], [<ore:nuggetIron>, null, <ore:nuggetIron>], [<ore:ingotIron>, null, <ore:ingotIron>]],
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
	<magneticraft:steam_engine> : [[null, <ore:plateConductiveIron>, null], [<ore:plateConductiveIron>, <ore:paper>, <ore:plateConductiveIron>], [null, <ore:plateConductiveIron>, null]],
	<magneticraft:container> : [[<chisel:blockgold:1>, null, <chisel:blockgold:1>], [<minecraft:chest>, <ore:paper>, <minecraft:chest>], [<ore:plateCrudeSteel>, null, <ore:plateCrudeSteel>]],
	<magneticraft:combustion_chamber> : [[<ore:ingotBrick>, <ore:plateIron>, <ore:ingotBrick>], [<ore:ingotBrick>, null, <ore:ingotIron>], [<ore:ingotBrick>, <ore:ingotBrick>, <ore:ingotBrick>]],
	<magneticraft:steam_boiler> : [[<ore:ingotIron>, <ore:plateIron>, <ore:ingotIron>], [<ore:ingotIron>, null, <ore:ingotIron>], [<ore:ingotIron>, <ore:plateIron>, <ore:ingotIron>]],
	<magneticraft:electric_drill>.withTag({energy: 0}) : [[<ore:gemDiamond>, <ore:gemDiamond>, <ore:ingotElectrotineAlloy>], [<ore:gemDiamond>, motor, <ore:ingotIron>], [<ore:ingotElectrotineAlloy>, <ore:ingotIron>, batteryLow]],
	<magneticraft:electric_chainsaw>.withTag({energy: 0}) : [[<ore:gemDiamond>, <ore:ingotElectrotineAlloy>, null], [<ore:ingotElectrotineAlloy>, motor, <ore:ingotIron>], [null, <ore:ingotIron>, batteryLow]],
	<magneticraft:electric_piston>.withTag({energy: 0}) : [[<minecraft:piston>, <ore:ingotElectrotineAlloy>, null], [<ore:ingotElectrotineAlloy>, motor, <ore:ingotElectrotineAlloy>], [null, <ore:ingotElectrotineAlloy>, batteryLow]],
	<magneticraft:small_tank> : [[<ore:blockGlassColorless>, <ore:ingotGold>, <ore:blockGlassColorless>], [<ore:ingotCrudeSteel>, null, <ore:ingotCrudeSteel>], [<ore:blockGlassColorless>, <ore:ingotGold>, <ore:blockGlassColorless>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in magneticraftRecipes_EXTENDEDCRAFTING {
	recipes.remove(key.withAmount(1));
	mods.extendedcrafting.TableCrafting.addShaped(0, key, value);
}

//Motor after stage 1
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(motor) ~ scripts.helpers.stages.progression2.stage, motor * 4, [[<ore:ingotIron>, <ore:ingotIron>, null], [<ore:ingotRedstoneAlloy>, <ore:dustRedstone>, <ore:ingotCopper>], [<ore:ingotIron>, <ore:ingotIron>, null]]);

//Steel Grate Crafting after stage 1
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<magneticraft:multiblock_parts:2>) ~ scripts.helpers.stages.progression2.stage, <magneticraft:multiblock_parts:2> * 4, [[null, <ore:ingotSteel>, null], [<ore:ingotSteel>, <ore:stone>, <ore:ingotSteel>], [null, <ore:ingotSteel>, null]]);

//Container crafting after stage 1
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<magneticraft:container>) ~ scripts.helpers.stages.progression2.stage, <magneticraft:container>, [[<chisel:blockgold:1>, null, <chisel:blockgold:1>], [<minecraft:chest>, <ore:paper>, <minecraft:chest>], [<ore:plateSteel>, null, <ore:plateSteel>]]);

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
for circuit in scripts.helpers.CircuitTiers[1].items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <magneticraft:thermopile>, [[<ore:ingotGold>, <ore:plateConductiveIron>, <ore:ingotGold>], [<ore:plateConductiveIron>, scripts.helpers.FrameTiers[0], <ore:plateConductiveIron>], [<ore:ingotGold>, circuit, <ore:ingotGold>]]);
}


print("### Magneticraft Init Complete ###");
