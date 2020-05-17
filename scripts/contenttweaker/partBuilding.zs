#priority 500
#loader contenttweaker
import mods.contenttweaker.Material;
import crafttweaker.oredict.IOreDict;

print("~~~ Begin PartBuilder Init ~~~");

//Create new parts for the PartBuilder
//Dense plates
var DensePlating = mods.contenttweaker.MaterialSystem.getPartBuilder().setName("dense_plating").setPartType(mods.contenttweaker.MaterialSystem.getPartType("item")).setOreDictName("densePlating").build();

var metalPlating = mods.contenttweaker.MaterialSystem.getPartBuilder().setName("sheetmetal_block").setPartType(mods.contenttweaker.MaterialSystem.getPartType("block")).setOreDictName("blockSheetmetal").build();

//Crude Steel Plates and Gears
crudeSteelMat = mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Crude Steel").setColor(mods.contenttweaker.Color.fromHex("aaa4a1")).build()
crudeSteelMat.registerParts(["gear", "plate"] as string[]);

//Function to easily register new parts and items to ores/materials
function RegisterMaterials(mat as mods.contenttweaker.Material, needsRegularOre as bool, needsAlternateOres as bool, needsCommonparts as bool, needsSheetsorDensePlating as bool, needsIngot as bool)
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

	//Generate common items for materials that need them (eg completely new materials)
	if(needsCommonparts)
	{
		if(oreDict.get("gear" ~ mat.getName()).empty)
		{
			mat.registerPart("gear");
		}

		if(oreDict.get("dust" ~ mat.getName()).empty)
		{
			mat.registerPart("dust");
		}

		if(oreDict.get("plate" ~ mat.getName()).empty)
		{
			mat.registerPart("plate");
		}
	}

	//Generate ingots for parts that do not have ingots
	if(needsIngot)
	{
		mat.registerParts(["ingot", "nugget"] as string[]);
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

	if(needsRegularOre | needsAlternateOres)
	{
		if((!oreDict.get("ingot" ~ mat.getName()).empty) | needsIngot)
		{
			if(oreDict.get("crystal" ~ mat.getName()).empty)
			{
				//Get Mekanism Ore Processing Parts
				mat.registerParts(["clump", "crystal", "dirty_dust", "shard"] as string[]);
			}
			else
			{
				print("Mekanism Ore Processing already exists for " ~ mat.getName());
			}
		}
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
	// needsIngot

	RegisterMaterials(material, true, true, true, true, true);
}

//Modded ores that already exist
//Needs:
//Poor Ore, Dense Ore, Dense Plating, Sheet Metal
var modded_oreMaterials as crafttweaker.oredict.IOreDictEntry[mods.contenttweaker.Material] = {
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Copper").setColor(mods.contenttweaker.Color.fromHex("b87333")).build() : <ore:ingotCopper>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Tin").setColor(mods.contenttweaker.Color.fromHex("dd3d4d5")).build() : <ore:ingotTin>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Silver").setColor(mods.contenttweaker.Color.fromHex("d5d5d7")).build() : <ore:ingotSilver>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Lead").setColor(mods.contenttweaker.Color.fromHex("425055")).build() : <ore:ingotLead>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Nickel").setColor(mods.contenttweaker.Color.fromHex("f0dea5")).build() : <ore:ingotNickel>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Platinum").setColor(mods.contenttweaker.Color.fromHex("66edff")).build() : <ore:ingotPlatinum>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Iridium").setColor(mods.contenttweaker.Color.fromHex("c7c6d8")).build() : <ore:ingotIridium>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Mithril").setColor(mods.contenttweaker.Color.fromHex("7ffacd")).build() : <ore:ingotMithril>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Aluminum").setColor(mods.contenttweaker.Color.fromHex("cacbcc")).build() : <ore:ingotAluminum>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Draconium").setColor(mods.contenttweaker.Color.fromHex("8c1fbf")).build() : <ore:ingotDraconium>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Titanium").setColor(mods.contenttweaker.Color.fromHex("b2669e")).build() : <ore:ingotTitanium>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Dilithium").setColor(mods.contenttweaker.Color.fromHex("ddcecb")).build() : <ore:gemDilithium>
	//Material : OreDictEntry
};

for material, materialIngot in modded_oreMaterials {
	//Remember arguments:
	// material (Material Variable)
	// needsRegularOre
	// needsAlternateOres
	// needsCommonparts
	// needsSheetsorDensePlating
	// needsIngot

	RegisterMaterials(material, false, true, false, true, false);
}

//Modded alloys that already exist
//Needs:
//Dense Plating, Sheet Metal, Basic Items (Plate, Gear, etc.)
var modded_alloys as crafttweaker.oredict.IOreDictEntry[mods.contenttweaker.Material] = {
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Electrical Steel").setColor(mods.contenttweaker.Color.fromHex("e0dfd7")).build() : <ore:ingotElectricalSteel>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Energetic Alloy").setColor(mods.contenttweaker.Color.fromHex("ff9b4a")).build() : <ore:ingotEnergeticAlloy>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Vibrant Alloy").setColor(mods.contenttweaker.Color.fromHex("a3e653")).build() : <ore:ingotVibrantAlloy>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Redstone Alloy").setColor(mods.contenttweaker.Color.fromHex("ed4e4e")).build() : <ore:ingotRedstoneAlloy>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Conductive Iron").setColor(mods.contenttweaker.Color.fromHex("ff9696")).build() : <ore:ingotConductiveIron>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Pulsating Iron").setColor(mods.contenttweaker.Color.fromHex("afff96")).build() : <ore:ingotPulsatingIron>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Dark Steel").setColor(mods.contenttweaker.Color.fromHex("4f4c4c")).build() : <ore:ingotDarkSteel>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Soularium").setColor(mods.contenttweaker.Color.fromHex("a66e1f")).build() : <ore:ingotSoularium>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("End Steel").setColor(mods.contenttweaker.Color.fromHex("fff9ba")).build() : <ore:ingotEndSteel>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Construction Alloy").setColor(mods.contenttweaker.Color.fromHex("484c54")).build() : <ore:ingotConstructionAlloy>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Neutronium").setColor(mods.contenttweaker.Color.fromHex("363038")).build() : <ore:ingotNeutronium>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Infinity").setColor(mods.contenttweaker.Color.fromHex("ff52e8")).build() : <ore:ingotInfinity>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Electrum").setColor(mods.contenttweaker.Color.fromHex("cfc05c")).build() : <ore:ingotElectrum>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Constantan").setColor(mods.contenttweaker.Color.fromHex("cca15f")).build() : <ore:ingotConstantan>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Enderium").setColor(mods.contenttweaker.Color.fromHex("297474")).build() : <ore:ingotEnderium>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Lumium").setColor(mods.contenttweaker.Color.fromHex("e6e59d")).build() : <ore:ingotLumium>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Signalum").setColor(mods.contenttweaker.Color.fromHex("c85620")).build() : <ore:ingotSignalum>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Invar").setColor(mods.contenttweaker.Color.fromHex("929b97")).build() : <ore:ingotInvar>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Bronze").setColor(mods.contenttweaker.Color.fromHex("cc8c42")).build() : <ore:ingotBronze>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Manyullyn").setColor(mods.contenttweaker.Color.fromHex("b928de")).build() : <ore:ingotManyullyn>
	//Material : OreDictEntry
};

for material, materialIngot in modded_alloys {
	//Remember arguments:
	// material (Material Variable)
	// needsRegularOre
	// needsAlternateOres
	// needsCommonparts
	// needsSheetsorDensePlating
	// needsIngot

	RegisterMaterials(material, false, false, true, true, false);
}

//Modded materials that already exist
//Needs:
//Dense Plating, Sheet Metal
var modded_Materials as crafttweaker.oredict.IOreDictEntry[mods.contenttweaker.Material] = {
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Steel").setColor(mods.contenttweaker.Color.fromHex("757575")).build() : <ore:ingotSteel>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Awakened Draconium").setColor(mods.contenttweaker.Color.fromHex("ff4917")).build() : <ore:ingotDraconiumAwakened>
	//Material : OreDictEntry
};

for material, materialIngot in modded_Materials {
	//Remember arguments:
	// material (Material Variable)
	// needsRegularOre
	// needsAlternateOres
	// needsCommonparts
	// needsSheetsorDensePlating
	// needsIngot

	RegisterMaterials(material, false, false, false, true, false);
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
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Coal").setColor(mods.contenttweaker.Color.fromHex("212020")).build() : <ore:coal>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Quartz").setColor(mods.contenttweaker.Color.fromHex("ffedeb")).build() : <ore:gemQuartz>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Ardite").setColor(mods.contenttweaker.Color.fromHex("c73e0c")).build() : <ore:ingotArdite>,
	mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Cobalt").setColor(mods.contenttweaker.Color.fromHex("1882de")).build() : <ore:ingotCobalt>
	//Material : OreDictEntry
};

for material, materialIngot in vanilla_oreMaterials {
	//Remember arguments:
	// material (Material Variable)
	// needsRegularOre
	// needsAlternateOres
	// needsCommonparts
	// needsSheetsorDensePlating
	// needsIngot

	RegisterMaterials(material, false, true, false, true, false);
}

print("### PartBuilder Init Complete ###");
