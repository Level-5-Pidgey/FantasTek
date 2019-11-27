#priority 100
#loader contenttweaker
import mods.contenttweaker.Material;
import crafttweaker.oredict.IOreDict;

print("~~~ Begin PartBuilder Init ~~~");

//Create new parts for the PartBuilder
//Dense plates
var DensePlating = mods.contenttweaker.MaterialSystem.getPartBuilder().setName("dense_plating").setPartType(mods.contenttweaker.MaterialSystem.getPartType("item")).setOreDictName("densePlating").build();

//Deep ore (new ore variant)
//Commented out as it might not even be required
//var deepOre = mods.contenttweaker.MaterialSystem.getPartBuilder().setName("deep_ore").setPartType(mods.contenttweaker.MaterialSystem.getPartType("ore")).setOreDictName("deepOre").build();

var metalPlating = mods.contenttweaker.MaterialSystem.getPartBuilder().setName("sheetmetal_block").setPartType(mods.contenttweaker.MaterialSystem.getPartType("block")).setOreDictName("blockSheetmetal").build();

//Function to easily register new parts and items to ores/materials
function RegisterMaterials(mat as mods.contenttweaker.Material, needsRegularOre as bool, needsAlternateOres as bool, needsCommonparts as bool, needsSheetsorDensePlating as bool)
{
	//Generate regular ore block if necessary
	if(needsRegularOre)
	{
		val ore = mat.registerPart("ore").getData();
		ore.addDataValue("variants", "minecraft:stone,minecraft:netherrack,minecraft:end_stone");
		ore.addDataValue("hardness", "3,3,3");
		ore.addDataValue("resistance", "15,15,15");
		ore.addDataValue("harvestLevel", "1,1,2");
		ore.addDataValue("harvestTool", "pickaxe,pickaxe,pickaxe");
	}

	//generate alternate ore types (dense, poor) if boolean is true
	if(needsAlternateOres)
	{
		//Register this material to the Poor Ore Type
		val poorOre = mat.registerPart("poor_ore").getData();
		poorOre.addDataValue("variants", "minecraft:stone,minecraft:netherrack,minecraft:end_stone");
		poorOre.addDataValue("hardness", "2,2,2");
		poorOre.addDataValue("resistance", "12,12,12");
		poorOre.addDataValue("harvestLevel", "1,1,2");
		poorOre.addDataValue("harvestTool", "pickaxe,pickaxe,pickaxe");

		//Register this material to the Dense Ore Type
		val denseOre = mat.registerPart("dense_ore").getData();
		denseOre.addDataValue("variants", "minecraft:stone,minecraft:netherrack,minecraft:end_stone");
		denseOre.addDataValue("hardness", "4,4,4");
		denseOre.addDataValue("resistance", "15,15,15");
		denseOre.addDataValue("harvestLevel", "1,1,2");
		denseOre.addDataValue("harvestTool", "pickaxe,pickaxe,pickaxe");
	}

	//Generate common items for materials that need them (eg completely new materials)
	if(needsCommonparts)
	{
		mat.registerParts(["gear", "plate", "nugget", "dust", "ingot"] as string[]);
	}

	//Generate sheetmetal block if needed
	if(needsSheetsorDensePlating)
	{
		val sheetmetalBlock = mat.registerPart("sheetmetal_block").getData();
		sheetmetalBlock.addDataValue("hardness", "5");
		sheetmetalBlock.addDataValue("resistance", "30");
		sheetmetalBlock.addDataValue("harvestLevel", "1");
		sheetmetalBlock.addDataValue("harvestTool", "pickaxe");

		mat.registerPart("dense_plating");
	}
}

//Completely new ores that don't exist in the game files at all
//Needs:
//Deep Ore, Ore, Plate, Gear, Ingot, Dust, Poor Ore, Dense Plating, Nugget, Sheet Metal
var new_oreMaterials as crafttweaker.oredict.IOreDictEntry[mods.contenttweaker.Material] = {
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Vibranium").setColor(mods.contenttweaker.Color.fromHex("4f2de3")).build() : <ore:ingotVibranium>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Yellorium").setColor(mods.contenttweaker.Color.fromHex("cff73e")).build() : <ore:ingotYellorium>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Thorium").setColor(mods.contenttweaker.Color.fromHex("70270c")).build() : <ore:ingotThorium>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Necrodermis").setColor(mods.contenttweaker.Color.fromHex("15bf20")).build() : <ore:ingotNecrodermis>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Chrome").setColor(mods.contenttweaker.Color.fromHex("e2e1db")).build() : <ore:ingotChrome>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Zinc").setColor(mods.contenttweaker.Color.fromHex("bac4c8")).build() : <ore:ingotZinc>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Uranium").setColor(mods.contenttweaker.Color.fromHex("a5a500")).build() : <ore:ingotUranium>
	//Material : OreDictEntry
};

for material, materialIngot in new_oreMaterials {
	//Remember arguments:
	// material (Material Variable)
	// needsRegularOre
	// needsAlternateOres
	// needsCommonparts
	// needsSheetsorDensePlating

	RegisterMaterials(material, true, true, true, true);
}

//Modded ores that already exist
//Needs:
//Poor Ore, Dense Ore, Dense Plating, Sheet Metal
var modded_oreMaterials as crafttweaker.oredict.IOreDictEntry[mods.contenttweaker.Material] = {
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Copper").setColor(mods.contenttweaker.Color.fromHex("b87333")).build() : <ore:ingotCopper>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Tin").setColor(mods.contenttweaker.Color.fromHex("dd3d4d5")).build() : <ore:ingotTin>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Silver").setColor(mods.contenttweaker.Color.fromHex("d5d5d7")).build() : <ore:ingotSilver>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Lead").setColor(mods.contenttweaker.Color.fromHex("425055")).build() : <ore:ingotLead>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Aluminum").setColor(mods.contenttweaker.Color.fromHex("f09089")).build() : <ore:ingotAluminum>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Nickel").setColor(mods.contenttweaker.Color.fromHex("f0dea5")).build() : <ore:ingotNickel>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Platinum").setColor(mods.contenttweaker.Color.fromHex("66edff")).build() : <ore:ingotPlatinum>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Iridium").setColor(mods.contenttweaker.Color.fromHex("393339")).build() : <ore:ingotIridium>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Mithril").setColor(mods.contenttweaker.Color.fromHex("7ffacd")).build() : <ore:ingotMithril>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Aluminium").setColor(mods.contenttweaker.Color.fromHex("848789")).build() : <ore:ingotAluminum>
	//Material : OreDictEntry
};

for material, materialIngot in modded_oreMaterials {
	//Remember arguments:
	// material (Material Variable)
	// needsRegularOre
	// needsAlternateOres
	// needsCommonparts
	// needsSheetsorDensePlating

	RegisterMaterials(material, false, true, false, true);
}

//Modded materials/alloys that already exist
//Needs:
//Dense Plating, Sheet Metal
var modded_Materials as crafttweaker.oredict.IOreDictEntry[mods.contenttweaker.Material] = {
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Steel").setColor(mods.contenttweaker.Color.fromHex("757575")).build() : <ore:ingotSteel>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Neutronium").setColor(mods.contenttweaker.Color.fromHex("363038")).build() : <ore:ingotNeutronium>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Infinity").setColor(mods.contenttweaker.Color.fromHex("ff52e8")).build() : <ore:ingotInfinity>
	//Material : OreDictEntry
};

for material, materialIngot in modded_Materials {
	//Remember arguments:
	// material (Material Variable)
	// needsRegularOre
	// needsAlternateOres
	// needsCommonparts
	// needsSheetsorDensePlating

	RegisterMaterials(material, false, false, false, true);
}

//Vanilla Ores that already exist
//Needs:
//Poor Ore, Deep Ore, Dense Ore, Dense Plating, Sheet Metal
var vanilla_oreMaterials as crafttweaker.oredict.IOreDictEntry[mods.contenttweaker.Material] = {
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Iron").setColor(mods.contenttweaker.Color.fromHex("ddbca7")).build() : <ore:ingotIron>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Gold").setColor(mods.contenttweaker.Color.fromHex("f5f231")).build() : <ore:ingotGold>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Diamond").setColor(mods.contenttweaker.Color.fromHex("45f3ff")).build() : <ore:gemDiamond>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Redstone").setColor(mods.contenttweaker.Color.fromHex("f22816")).build() : <ore:dustRedstone>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Lapis Lazuli").setColor(mods.contenttweaker.Color.fromHex("164df2")).build() : <ore:gemLapis>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Emerald").setColor(mods.contenttweaker.Color.fromHex("19d150")).build() : <ore:gemEmerald>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Coal").setColor(mods.contenttweaker.Color.fromHex("060607")).build() : <ore:coal>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Quartz").setColor(mods.contenttweaker.Color.fromHex("ffedeb")).build() : <ore:gemQuartz>
	//Material : OreDictEntry
};

for material, materialIngot in vanilla_oreMaterials {
	//Remember arguments:
	// material (Material Variable)
	// needsRegularOre
	// needsAlternateOres
	// needsCommonparts
	// needsSheetsorDensePlating

	RegisterMaterials(material, false, true, false, true);
}

print("### PartBuilder Init Complete ###");
