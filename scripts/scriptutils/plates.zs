import crafttweaker.oredict.IOreDict;
import crafttweaker.liquid.ILiquidStack;

print("~~~ Begin Plate Management Init ~~~");

val ThaumcraftPlates =
[
	<thaumcraft:plate>,
	<thaumcraft:plate:1>,
	<thaumcraft:plate:2>,
	<thaumcraft:plate:3>
] as crafttweaker.item.IItemStack[];

for ThaumcraftPlate in ThaumcraftPlates
{
	recipes.remove(ThaumcraftPlate);
}

//Embers plates
val emberPlates =
[
	<embers:plate_copper>,
	<embers:plate_lead>,
	<contenttweaker:material_part:855>,
	<embers:plate_silver>,
	<embers:plate_dawnstone>,
	<embers:plate_iron>,
	<embers:plate_gold>,
	<embers:plate_aluminum>,
	<embers:plate_electrum>,
	<embers:plate_bronze>,
	<embers:plate_electrum>,
	<embers:plate_nickel>,
	<embers:plate_tin>,
	<contenttweaker:material_part:603>,
	<contenttweaker:material_part:593>,
	<contenttweaker:material_part:574>,
	<contenttweaker:material_part:613>,
	<contenttweaker:material_part:835>,
	<jaopca:item_platetungsten>,
	<contenttweaker:material_part:845>,
	<jaopca:item_plateardite>,
	<jaopca:item_plateastralstarmetal>,
	<jaopca:item_platecobalt>,
	<jaopca:item_platedraconium>,
	<libvulpes:productplate:10>,
	<thermalfoundation:material:328>,
	<jaopca:item_plateosmium>,
	<libvulpes:productplate:7>
] as crafttweaker.item.IItemStack[];

for emberPlate in emberPlates
{
	recipes.remove(emberPlate);
	mods.embers.Stamper.remove(emberPlate);
}

//Magneticraft plates
val magneticraftPlates =
[
	<minecraft:iron_block>,
	<thermalfoundation:storage>,
	<minecraft:gold_block>,
	<magneticraft:storage_blocks:3>,
	<thermalfoundation:storage:3>,
	<magneticraft:ingots:6>,
	<tconstruct:ingots:1>,
	<tconstruct:ingots>,
	<astralsorcery:itemcraftingcomponent:1>,
	<magneticraft:ingots:11>,
	<draconicevolution:draconium_ingot>,
	<magneticraft:ingots:5>
] as crafttweaker.item.IItemStack[];

for magneticraftPlate in magneticraftPlates
{
	mods.magneticraft.CrushingTable.removeRecipe(magneticraftPlate);
}

//Tinkers Construct Plate Casting
val TConplates =
[
	<thermalfoundation:material:356>,
	<thaumcraft:plate:2>,
	<thermalfoundation:material:359>,
	<thermalfoundation:material:326>,
	<thermalfoundation:material:357>,
	<thermalfoundation:material:358>,
	<jaopca:item_plateosmium>,
	<thermalfoundation:material:327>,
	<thermalfoundation:material:354>,
	<thermalfoundation:material:324>,
	<jaopca:item_platecobalt>,
	<jaopca:item_plateardite>,
	<thermalfoundation:material:320>,
	<thermalfoundation:material:355>,
	<thermalfoundation:material:323>,
	<thermalfoundation:material:322>,
	<thermalfoundation:material:353>,
	<thermalfoundation:material:352>,
	<thermalfoundation:material:33>,
	<thermalfoundation:material:321>,
	<thermalfoundation:material:325>,
	<thermalfoundation:material:32>,
	<contenttweaker:material_part:5>,
	<contenttweaker:material_part:55>,
	<contenttweaker:material_part:25>,
	<contenttweaker:material_part:35>,
	<thermalfoundation:material:328>,
	<jaopca:item_platedraconium>,
	<jaopca:item_plateastralstarmetal>,
	<embers:plate_dawnstone>,
	<contenttweaker:material_part:603>,
	<contenttweaker:material_part:593>,
	<contenttweaker:material_part:855>,
	<contenttweaker:material_part:574>,
	<contenttweaker:material_part:613>,
	<contenttweaker:material_part:845>,
	<contenttweaker:material_part:835>,
	<libvulpes:productplate:7>,
	<thaumcraft:plate>,
	<jaopca:item_platetungsten>
] as crafttweaker.item.IItemStack[];

for TConplate in TConplates
{
	mods.tconstruct.Casting.removeTableRecipe(TConplate);
}

//TE Compactor
val CompactorPlates =
[
	<iceandfire:sapphire_gem>,
	<minecraft:diamond>,
	<embers:ingot_bronze>,
	<rftools:dimensional_shard>,
	<biomesoplenty:gem>,
	<minecraft:emerald>,
	<thermalfoundation:material:136>,
	<embers:ingot_dawnstone>,
	<biomesoplenty:gem:2>,
	<tconstruct:ingots>,
	<libvulpes:productingot:9>,
	<draconicevolution:draconium_ingot>,
	<appliedenergistics2:material:1>,
	<thermalfoundation:material:167>,
	<libvulpes:productingot:5>,
	<biomesoplenty:gem:4>,
	<contenttweaker:material_part:577>,
	<thermalfoundation:material:164>,
	<biomesoplenty:gem:5>,
	<thermalfoundation:material:165>,
	<minecraft:iron_ingot>,
	<libvulpes:productingot:10>,
	<biomesoplenty:gem:7>,
	<quark:biotite>,
	<advancedrocketry:productingot:1>,
	<thaumcraft:ingot:1>,
	<thermalfoundation:material:160>,
	<libvulpes:productingot:3>,
	<embers:ingot_electrum>,
	<embers:ingot_silver>,
	<forestry:apatite>,
	<thermalfoundation:material:166>,
	<contenttweaker:material_part:596>,
	<astralsorcery:itemcraftingcomponent>,
	<libvulpes:productgem>,
	<mekanism:ingot:1>,
	<astralsorcery:itemcraftingcomponent:1>,
	<minecraft:dye:4>,
	<biomesoplenty:gem:3>,
	<minecraft:coal>,
	<minecraft:quartz>,
	<appliedenergistics2:material>,
	<thaumcraft:ingot>,
	<tconstruct:ingots:1>,
	<forestry:ingot_copper>,
	<contenttweaker:material_part:858>,
	<embers:ingot_nickel>,
	<thermalfoundation:material:134>,
	<contenttweaker:material_part:616>,
	<redstonearsenal:material:32>,
	<advancedrocketry:productingot>,
	<contenttweaker:material_part:606>,
	<minecraft:gold_ingot>,
	<contenttweaker:material_part:838>,
	<thaumcraft:ingot:2>,
	<biomesoplenty:gem:1>,
	<magneticraft:ingots:5>,
	<thermalfoundation:material:162>,
	<embers:ingot_lead>,
	<libvulpes:productingot:7>,
	<magneticraft:ingots:14>
] as crafttweaker.item.IItemStack[];

for CompactorPlate in CompactorPlates
{
	mods.thermalexpansion.Compactor.removeStorageRecipe(CompactorPlate);
}

//Advanced Rocketry Plates
val RocketryPlates =
[
	<embers:plate_dawnstone>,
	<thaumcraft:plate:2>,
	<thermalfoundation:material:328>,
	<advancedrocketry:productplate>,
	<redstonearsenal:material:128>,
	<embers:plate_aluminum>,
	<thermalfoundation:material:359>,
	<thaumcraft:plate:3>,
	<thermalfoundation:material:357>,
	<thermalfoundation:material:358>,
	<jaopca:item_plateardite>,
	<jaopca:item_platedraconium>,
	<contenttweaker:material_part:25>,
	<contenttweaker:material_part:5>,
	<contenttweaker:material_part:55>,
	<jaopca:item_plateosmium>,
	<contenttweaker:material_part:35>,
	<jaopca:item_plateastralstarmetal>,
	<jaopca:item_platecobalt>,
	<advancedrocketry:productplate:1>,
	<thermalfoundation:material:356>,
	<contenttweaker:material_part:603>,
	<contenttweaker:material_part:593>,
	<contenttweaker:material_part:574>,
	<contenttweaker:material_part:613>,
	<thermalfoundation:material:322>,
	<thermalfoundation:material:355>,
	<thermalfoundation:material:320>,
	<thermalfoundation:material:325>,
	<thermalfoundation:material:321>,
	<contenttweaker:material_part:845>,
	<contenttweaker:material_part:848>,
	<thermalfoundation:material:353>,
	<thermalfoundation:material:352>,
	<thermalfoundation:material:323>,
	<contenttweaker:material_part:855>,
	<contenttweaker:material_part:858>,
	<thermalfoundation:material:327>,
	<thermalfoundation:material:324>
] as crafttweaker.item.IItemStack[];

for RocketryPlate in RocketryPlates
{
	mods.advancedrocketry.RollingMachine.removeRecipe(RocketryPlate);
}

//Advanced Rocketry Simple Plate Press
val SimpleRocketryPlates =
[
	<advancedrocketry:productplate:1>,
	<advancedrocketry:productplate>,
	<libvulpes:productplate:10>,
	<libvulpes:productplate:9>,
	<libvulpes:productplate:7>,
	<libvulpes:productplate:6>,
	<libvulpes:productplate:5>,
	<libvulpes:productplate:4>,
	<libvulpes:productplate:1>,
	<libvulpes:productplate:2>,
	<jaopca:item_plateosmium>,
	<jaopca:item_platedraconium>,
	<jaopca:item_platecobalt>,
	<jaopca:item_plateastralstarmetal>,
	<jaopca:item_plateardite>,
	<jaopca:item_platetungsten>,
	<contenttweaker:material_part:593>
] as crafttweaker.item.IItemStack[];

for SimpleRocketryPlate in SimpleRocketryPlates
{
	mods.advancedrocketry.PlatePresser.removeRecipe(SimpleRocketryPlate);
}

//Plate addition function
function AddPlateCrafting(materialOreDict as string, materialPrefix as string, molten as ILiquidStack)
{
	//Combining string
	val craftingMaterial = materialPrefix ~ materialOreDict; //The material (ingot, dust, etc) used to craft
	val craftingPlate = "plate" ~ materialOreDict;

	//5 Cost -- Manual
	//Check if an OreDict version exists
	if (!oreDict.get(craftingMaterial).empty)
	{
		recipes.addShapeless("plateCrafting" ~ materialOreDict, oreDict.get(craftingPlate).firstItem, [<embers:tinker_hammer>, oreDict.get(craftingMaterial), oreDict.get(craftingMaterial), oreDict.get(craftingMaterial), oreDict.get(craftingMaterial), oreDict.get(craftingMaterial)]);
	}

	//4.5 Cost - Plate Presser
	for plateMaterial in oreDict.get(craftingMaterial).items
	{
		val blockMat = "block" ~ materialOreDict;
		print(blockMat);
    	mods.advancedrocketry.PlatePresser.addRecipe(oreDict.get(craftingPlate).firstItem * 2, oreDict.get(blockMat).firstItem);
	}

	//4 Cost -- Tinker's Casting
	if (molten.name != "water")
	{
		if (materialPrefix == "ingot" | materialPrefix == "dust")
		{
			if (materialPrefix == "Silicon" | materialPrefix == "Carbon" ) //Silicon and Carbon are made in 1000mb Increments
			{
				mods.tconstruct.Casting.addTableRecipe(oreDict.get(craftingPlate).firstItem, <tconstruct:cast_custom:3>, molten, 4000, false, 80);
			}
			else if (materialPrefix == "Coal") //1 Coal = 100mb of Liquifacted Coal
			{
				mods.tconstruct.Casting.addTableRecipe(oreDict.get(craftingPlate).firstItem, <tconstruct:cast_custom:3>, molten, 400, false, 80);
			}
			else
			{
				mods.tconstruct.Casting.addTableRecipe(oreDict.get(craftingPlate).firstItem, <tconstruct:cast_custom:3>, molten, 576, false, 80);
			}
		}
		else
		{
			mods.tconstruct.Casting.addTableRecipe(oreDict.get(craftingPlate).firstItem, <tconstruct:cast_custom:3>, molten, 400, false, 80);
		}
	}

	//3 Cost -- Embers Plate Press, Compactor
	if (molten.name != "water")
	{
		if (materialPrefix == "ingot" | materialPrefix == "dust")
		{
			if (materialPrefix == "Silicon" | materialPrefix == "Carbon" )
			{
				mods.embers.Stamper.add(oreDict.get(craftingPlate).firstItem, molten * 3000, <embers:stamp_plate>, null);
			}
			else if (materialPrefix == "Coal")
			{
				mods.embers.Stamper.add(oreDict.get(craftingPlate).firstItem, molten * 300, <embers:stamp_plate>, null);
			}
			else
			{
				mods.embers.Stamper.add(oreDict.get(craftingPlate).firstItem, molten * 432, <embers:stamp_plate>, null);
			}
		}
		else
		{
			mods.embers.Stamper.add(oreDict.get(craftingPlate).firstItem, molten * 300, <embers:stamp_plate>, null);
		}
	}

	if (craftingMaterial != "ingotCoal") //For some reason ingotCoal gets passed into this function even though it doesn't exist
	{
		mods.thermalexpansion.Compactor.addStorageRecipe(oreDict.get(craftingPlate).firstItem, oreDict.get(craftingMaterial).firstItem * 3, 10000);
	}

	//2 Cost
	for ingot in oreDict.get(craftingMaterial).items
	{
    	//Implement 2-cost smashing
	}

	//1 Cost
	for ingot1 in oreDict.get(craftingMaterial).items
	{
    	mods.advancedrocketry.RollingMachine.addRecipe(oreDict.get(craftingPlate).firstItem, 60, 5000, 100, ingot1);
	}
}

//Add Plate Crafting
val PlateMaterials =
{
	"Iron" : <liquid:iron>,
	"Gold" : <liquid:gold>,
	"Wood" : <liquid:water>,
	"Redstone" : <liquid:redstone>,
	"Diamond" : <liquid:water>,
	"Emerald" : <liquid:emerald>,
	"Coal" : <liquid:coal>,
	"Obsidian" : <liquid:obsidian>,
	"Lazurite" : <liquid:water>,
	"Silicon" : <liquid:fluidsilicon>,
	"Ruby" : <liquid:water>,
	"Sapphire" : <liquid:water>,
	"Peridot" : <liquid:water>,
	"Aluminum" : <liquid:aluminum>,
	"Brass" : <liquid:brass>,
	"Bronze" : <liquid:bronze>,
	"Copper" : <liquid:copper>,
	"Electrum" : <liquid:electrum>,
	"Invar" : <liquid:invar>,
	"Iridium" : <liquid:iridium>,
	"Lead" : <liquid:lead>,
	"Nickel" : <liquid:nickel>,
	"Platinum" : <liquid:platinum>,
	"Silver" : <liquid:silver>,
	"Steel" : <liquid:steel>,
	"Tin" : <liquid:tin>,
	"Titanium" : <liquid:titanium>,
	"Tungsten" : <liquid:tungsten>,
	"Tungstensteel" : <liquid:water>,
	"Zinc" : <liquid:zinc>,
	"Mithril" : <liquid:mithril>,
	"Constantan" : <liquid:constantan>,
	"Signalum" : <liquid:signalum>,
	"Lumium" : <liquid:lumium>,
	"Enderium" : <liquid:enderium>,
	"ElectrumFlux" : <liquid:water>,
	"Thaumium" : <liquid:thaumium>,
	"Void" : <liquid:voidmetal>,
	"Yellorium" : <liquid:yellorium>,
	"Vibranium" : <liquid:vibranium>,
	"Necrodermis" : <liquid:necrodermis>,
	"Thorium" : <liquid:thorium>,
	"Dawnstone" : <liquid:dawnstone>,
	"Chromium" : <liquid:chromium>,
	"Ardite" : <liquid:ardite>,
	"AstralStarmetal" : <liquid:astral_starmetal>,
	"Cobalt" : <liquid:cobalt>,
	"Draconium" : <liquid:draconium>,
	"Uranium" : <liquid:uranium>,
	"Osmium" : <liquid:osmium>,
	"Amber" : <liquid:water>,
	"Amethyst" : <liquid:water>,
	"Apatite" : <liquid:water>,
	"Aquamarine" : <liquid:water>,
	"CertusQuartz" : <liquid:water>,
	"ChargedCertusQuartz" : <liquid:water>,
	"Dilithium" : <liquid:water>,
	"DimensionalShard" : <liquid:water>,
	"EnderBiotite" : <liquid:water>,
	"Lapis" : <liquid:water>,
	"Malachite" : <liquid:water>,
	"Quartz" : <liquid:water>,
	"Tanzanite" : <liquid:water>,
	"Topaz" : <liquid:water>
} as ILiquidStack[string];

for materialString, molten in PlateMaterials
{
	val plateDict = "plate" ~ materialString;
	if (oreDict has plateDict)
	{
		val IngotDict = "ingot" ~ materialString;
		if(oreDict has IngotDict)
		{
			AddPlateCrafting(materialString, "ingot", molten);
		}
		else if (oreDict has "gem" ~ materialString)
		{
			AddPlateCrafting(materialString, "gem", molten);
		}
		else if (oreDict has "plank" ~ materialString)
		{
			AddPlateCrafting(materialString, "plank", molten);
		}
		else if (oreDict has "dust" ~ materialString)
		{
			AddPlateCrafting(materialString, "dust", molten);
		}
		else
		{
			print("Could not find a matching material for " ~ IngotDict);
		}
	}
	else
	{
		print("No oredict exists for " ~ plateDict);
	}
}

print("### Plate Management Init Complete ###");
