#priority 500
#loader contenttweaker
import mods.contenttweaker.Material;
import mods.contenttweaker.MaterialSystem;
import crafttweaker.oredict.IOreDict;

print("~~~ Begin PartBuilder Init ~~~");

//Create Crude Steel Plates and Gears
var crudeSteelMat = MaterialSystem.getMaterialBuilder().setName("Crude Steel").setColor(mods.contenttweaker.Color.fromHex("c4b79f")).build();
crudeSteelMat.registerParts(["gear", "plate"] as string[]);

//Function to easily register new parts and items to ores/materials
function RegisterMaterials(mat as mods.contenttweaker.Material, needsRegularOre as bool, needsAlternateOres as bool, needsCommonparts as bool, needsIngot as bool)
{
	//Set Mining Level Strings for Ores
	var oreMiningLevel = "4,4,4"; //Base Mining Level is 4 (copper)
	if(mat.getName() == "Cobalt" || mat.getName() == "Ardite")
	{
		oreMiningLevel = "5,5,5";
	}
	else if(mat.getName() == "Platinum")
	{
		oreMiningLevel = "6,6,6";
	}
	else if(mat.getName() == "Uranium")
	{
		oreMiningLevel = "7,7,7";
	}
	else if(mat.getName() == "Iridium" || mat.getName() == "Titanium")
	{
		oreMiningLevel = "8,8,8";
	}
	else if(mat.getName() == "Draconium" || mat.getName() == "Dilithium")
	{
		oreMiningLevel = "9,9,9";
	}
	else if(mat.getName() == "Necrodermis" || mat.getName() == "Vibranium")
	{
		oreMiningLevel = "10,10,10";
	}

	//Generate regular ore block if necessary
	if(needsRegularOre)
	{
		val ore = mat.registerPart("ore").getData();
		ore.addDataValue("variants", "minecraft:stone,minecraft:netherrack,minecraft:end_stone");
		ore.addDataValue("hardness", "3,3,3");
		ore.addDataValue("resistance", "15,15,15");
		ore.addDataValue("harvestLevel", oreMiningLevel);
		ore.addDataValue("harvestTool", "pickaxe,pickaxe,pickax3e");
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
		poorOre.addDataValue("harvestLevel", oreMiningLevel);
		poorOre.addDataValue("harvestTool", "pickaxe,pickaxe,pickaxe");

		//Register this material to the Dense Ore Type
		val denseOre = mat.registerPart("dense_ore").getData();
		denseOre.addDataValue("variants", "minecraft:stone,minecraft:netherrack,minecraft:end_stone");
		denseOre.addDataValue("hardness", "4,4,4");
		denseOre.addDataValue("resistance", "15,15,15");
		denseOre.addDataValue("harvestLevel", oreMiningLevel);
		denseOre.addDataValue("harvestTool", "pickaxe,pickaxe,pickaxe");
	}

	if(needsRegularOre || needsAlternateOres)
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

//Completely new ores that don't exist in the game files at all
//Needs:
//Deep Ore, Ore, Plate, Gear, Ingot, Dust, Poor Ore, Dense Plating, Nugget, Sheet Metal
var new_oreMaterials as crafttweaker.oredict.IOreDictEntry[mods.contenttweaker.Material] = {
	MaterialSystem.getMaterialBuilder().setName("Vibranium").setColor(mods.contenttweaker.Color.fromHex("4f2de3")).build() : <ore:ingotVibranium>,
	MaterialSystem.getMaterialBuilder().setName("Necrodermis").setColor(mods.contenttweaker.Color.fromHex("15bf20")).build() : <ore:ingotNecrodermis>,
	MaterialSystem.getMaterialBuilder().setName("Chrome").setColor(mods.contenttweaker.Color.fromHex("e2e1db")).build() : <ore:ingotChrome>,
	MaterialSystem.getMaterialBuilder().setName("Zinc").setColor(mods.contenttweaker.Color.fromHex("bac4c8")).build() : <ore:ingotZinc>
	//Material : OreDictEntry
};

for material, materialIngot in new_oreMaterials {
	//Remember arguments:
	// material (Material Variable)
	// needsRegularOre
	// needsAlternateOres
	// needsCommonparts
	// needsIngot

	RegisterMaterials(material, true, true, true, true);
}

//Modded ores that already exist
//Needs:
//Poor Ore, Dense Ore, Dense Plating, Sheet Metal
var modded_oreMaterials as crafttweaker.oredict.IOreDictEntry[mods.contenttweaker.Material] = {
	MaterialSystem.getMaterialBuilder().setName("Copper").setColor(mods.contenttweaker.Color.fromHex("d5750a")).build() : <ore:ingotCopper>,
	MaterialSystem.getMaterialBuilder().setName("Tin").setColor(mods.contenttweaker.Color.fromHex("dd3d4d5")).build() : <ore:ingotTin>,
	MaterialSystem.getMaterialBuilder().setName("Silver").setColor(mods.contenttweaker.Color.fromHex("d5d5d7")).build() : <ore:ingotSilver>,
	MaterialSystem.getMaterialBuilder().setName("Lead").setColor(mods.contenttweaker.Color.fromHex("425055")).build() : <ore:ingotLead>,
	MaterialSystem.getMaterialBuilder().setName("Nickel").setColor(mods.contenttweaker.Color.fromHex("f0dea5")).build() : <ore:ingotNickel>,
	MaterialSystem.getMaterialBuilder().setName("Platinum").setColor(mods.contenttweaker.Color.fromHex("66edff")).build() : <ore:ingotPlatinum>,
	MaterialSystem.getMaterialBuilder().setName("Iridium").setColor(mods.contenttweaker.Color.fromHex("c7c6d8")).build() : <ore:ingotIridium>,
	MaterialSystem.getMaterialBuilder().setName("Mithril").setColor(mods.contenttweaker.Color.fromHex("7ffacd")).build() : <ore:ingotMithril>,
	MaterialSystem.getMaterialBuilder().setName("Aluminum").setColor(mods.contenttweaker.Color.fromHex("cacbcc")).build() : <ore:ingotAluminum>,
	MaterialSystem.getMaterialBuilder().setName("Draconium").setColor(mods.contenttweaker.Color.fromHex("8c1fbf")).build() : <ore:ingotDraconium>,
	MaterialSystem.getMaterialBuilder().setName("Titanium").setColor(mods.contenttweaker.Color.fromHex("b2669e")).build() : <ore:ingotTitanium>,
	MaterialSystem.getMaterialBuilder().setName("Thorium").setColor(mods.contenttweaker.Color.fromHex("685f5f")).build() : <ore:ingotThorium>,
	MaterialSystem.getMaterialBuilder().setName("Uranium").setColor(mods.contenttweaker.Color.fromHex("a5a500")).build() : <ore:ingotTitanium>,
	MaterialSystem.getMaterialBuilder().setName("Boron").setColor(mods.contenttweaker.Color.fromHex("797979")).build() : <ore:ingotTitanium>,
	MaterialSystem.getMaterialBuilder().setName("Lithium").setColor(mods.contenttweaker.Color.fromHex("f5edda")).build() : <ore:ingotTitanium>,
	MaterialSystem.getMaterialBuilder().setName("Magnesium").setColor(mods.contenttweaker.Color.fromHex("f5dada")).build() : <ore:ingotTitanium>,
	MaterialSystem.getMaterialBuilder().setName("Dilithium").setColor(mods.contenttweaker.Color.fromHex("ddcecb")).build() : <ore:gemDilithium>,
	//Material : OreDictEntry
};

for material, materialIngot in modded_oreMaterials {
	//Remember arguments:
	// material (Material Variable)
	// needsRegularOre
	// needsAlternateOres
	// needsCommonparts
	// needsIngot

	RegisterMaterials(material, false, true, false, false);
}

//Modded alloys that already exist
//Needs:
//Dense Plating, Sheet Metal, Basic Items (Plate, Gear, etc.)
var modded_alloys as crafttweaker.oredict.IOreDictEntry[mods.contenttweaker.Material] = {
	MaterialSystem.getMaterialBuilder().setName("Electrical Steel").setColor(mods.contenttweaker.Color.fromHex("e0dfd7")).build() : <ore:ingotElectricalSteel>,
	MaterialSystem.getMaterialBuilder().setName("Energetic Alloy").setColor(mods.contenttweaker.Color.fromHex("ff9b4a")).build() : <ore:ingotEnergeticAlloy>,
	MaterialSystem.getMaterialBuilder().setName("Vibrant Alloy").setColor(mods.contenttweaker.Color.fromHex("a3e653")).build() : <ore:ingotVibrantAlloy>,
	MaterialSystem.getMaterialBuilder().setName("Redstone Alloy").setColor(mods.contenttweaker.Color.fromHex("ed4e4e")).build() : <ore:ingotRedstoneAlloy>,
	MaterialSystem.getMaterialBuilder().setName("Conductive Iron").setColor(mods.contenttweaker.Color.fromHex("ff9696")).build() : <ore:ingotConductiveIron>,
	MaterialSystem.getMaterialBuilder().setName("Pulsating Iron").setColor(mods.contenttweaker.Color.fromHex("afff96")).build() : <ore:ingotPulsatingIron>,
	MaterialSystem.getMaterialBuilder().setName("Dark Steel").setColor(mods.contenttweaker.Color.fromHex("4f4c4c")).build() : <ore:ingotDarkSteel>,
	MaterialSystem.getMaterialBuilder().setName("Soularium").setColor(mods.contenttweaker.Color.fromHex("a66e1f")).build() : <ore:ingotSoularium>,
	MaterialSystem.getMaterialBuilder().setName("End Steel").setColor(mods.contenttweaker.Color.fromHex("fff9ba")).build() : <ore:ingotEndSteel>,
	MaterialSystem.getMaterialBuilder().setName("Construction Alloy").setColor(mods.contenttweaker.Color.fromHex("484c54")).build() : <ore:ingotConstructionAlloy>,
	MaterialSystem.getMaterialBuilder().setName("Neutronium").setColor(mods.contenttweaker.Color.fromHex("363038")).build() : <ore:ingotNeutronium>,
	MaterialSystem.getMaterialBuilder().setName("Infinity").setColor(mods.contenttweaker.Color.fromHex("ff52e8")).build() : <ore:ingotInfinity>,
	MaterialSystem.getMaterialBuilder().setName("Electrum").setColor(mods.contenttweaker.Color.fromHex("cfc05c")).build() : <ore:ingotElectrum>,
	MaterialSystem.getMaterialBuilder().setName("Constantan").setColor(mods.contenttweaker.Color.fromHex("cca15f")).build() : <ore:ingotConstantan>,
	MaterialSystem.getMaterialBuilder().setName("Enderium").setColor(mods.contenttweaker.Color.fromHex("297474")).build() : <ore:ingotEnderium>,
	MaterialSystem.getMaterialBuilder().setName("Lumium").setColor(mods.contenttweaker.Color.fromHex("e6e59d")).build() : <ore:ingotLumium>,
	MaterialSystem.getMaterialBuilder().setName("Signalum").setColor(mods.contenttweaker.Color.fromHex("c85620")).build() : <ore:ingotSignalum>,
	MaterialSystem.getMaterialBuilder().setName("Invar").setColor(mods.contenttweaker.Color.fromHex("929b97")).build() : <ore:ingotInvar>,
	MaterialSystem.getMaterialBuilder().setName("Bronze").setColor(mods.contenttweaker.Color.fromHex("cc8c42")).build() : <ore:ingotBronze>,
	MaterialSystem.getMaterialBuilder().setName("Manyullyn").setColor(mods.contenttweaker.Color.fromHex("b928de")).build() : <ore:ingotManyullyn>
	//Material : OreDictEntry
};

for material, materialIngot in modded_alloys {
	//Remember arguments:
	// material (Material Variable)
	// needsRegularOre
	// needsAlternateOres
	// needsCommonparts
	// needsIngot

	RegisterMaterials(material, false, false, true, false);
}

//Vanilla Ores that already exist
//Needs:
//Poor Ore, Deep Ore, Dense Ore, Dense Plating, Sheet Metal
var vanilla_oreMaterials as crafttweaker.oredict.IOreDictEntry[mods.contenttweaker.Material] = {
	MaterialSystem.getMaterialBuilder().setName("Iron").setColor(mods.contenttweaker.Color.fromHex("ddbca7")).build() : <ore:ingotIron>,
	MaterialSystem.getMaterialBuilder().setName("Gold").setColor(mods.contenttweaker.Color.fromHex("f5f231")).build() : <ore:ingotGold>,
	MaterialSystem.getMaterialBuilder().setName("Diamond").setColor(mods.contenttweaker.Color.fromHex("45f3ff")).build() : <ore:gemDiamond>,
	MaterialSystem.getMaterialBuilder().setName("Redstone").setColor(mods.contenttweaker.Color.fromHex("f22816")).build() : <ore:dustRedstone>,
	MaterialSystem.getMaterialBuilder().setName("Lapis Lazuli").setColor(mods.contenttweaker.Color.fromHex("164df2")).build() : <ore:gemLapis>,
	MaterialSystem.getMaterialBuilder().setName("Emerald").setColor(mods.contenttweaker.Color.fromHex("19d150")).build() : <ore:gemEmerald>,
	MaterialSystem.getMaterialBuilder().setName("Coal").setColor(mods.contenttweaker.Color.fromHex("212020")).build() : <ore:coal>,
	MaterialSystem.getMaterialBuilder().setName("Quartz").setColor(mods.contenttweaker.Color.fromHex("ffedeb")).build() : <ore:gemQuartz>,
	MaterialSystem.getMaterialBuilder().setName("Ardite").setColor(mods.contenttweaker.Color.fromHex("c73e0c")).build() : <ore:ingotArdite>,
	MaterialSystem.getMaterialBuilder().setName("Cobalt").setColor(mods.contenttweaker.Color.fromHex("1882de")).build() : <ore:ingotCobalt>
	//Material : OreDictEntry
};

for material, materialIngot in vanilla_oreMaterials {
	//Remember arguments:
	// material (Material Variable)
	// needsRegularOre
	// needsAlternateOres
	// needsCommonparts
	// needsIngot

	RegisterMaterials(material, false, true, false, false);
}

print("### PartBuilder Init Complete ###");
