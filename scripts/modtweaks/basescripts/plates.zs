import crafttweaker.oredict.IOreDict;
import crafttweaker.liquid.ILiquidStack;

print("~~~ Begin Plate Management Init ~~~");

//Add wooden plate to oreDict
<ore:plateWood>.add(<contenttweaker:wood_plate>);
<ore:plateSealedWood>.add(<contenttweaker:sealed_wood_plate>);
<ore:plankSealedWood>.add(<embers:sealed_planks>);

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
	<libvulpes:productplate:7>,
	<thermalfoundation:material:326>,
	<jaopca:item_platelithium>,
	<jaopca:item_plateboron>,
	<jaopca:item_plateuranium>,
	<jaopca:item_platethorium>,
	<jaopca:item_platemagnesium>,
] as crafttweaker.item.IItemStack[];

for emberPlate in emberPlates
{
	recipes.remove(emberPlate);
	mods.embers.Stamper.remove(emberPlate);
}

//Embers plate melting
val emberMelterPlates =
{
	<thermalfoundation:material:32> : <liquid:iron>,
	<thermalfoundation:material:33> : <liquid:gold>,
	<thermalfoundation:material:322> : <liquid:silver>,
	<thermalfoundation:material:320> : <liquid:copper>,
	<thermalfoundation:material:323> : <liquid:lead>,
	<thermalfoundation:material:324> : <liquid:aluminum>,
	<thermalfoundation:material:325> : <liquid:nickel>,
	<thermalfoundation:material:321> : <liquid:tin>,
	<embers:plate_dawnstone> : <liquid:dawnstone>,
	<thermalfoundation:material:355> : <liquid:bronze>,
	<thermalfoundation:material:353> : <liquid:electrum>
} as ILiquidStack[crafttweaker.item.IItemStack];

for plate, liquid in emberMelterPlates
{
	mods.embers.Melter.remove(plate); //Remove existing plate recipe
	mods.embers.Melter.add(liquid * 144, plate); //Re-add plates but only give 1 ingot's worth each time
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
	<contenttweaker:material_part:915>,
	<libvulpes:productplate:7>,
	<thaumcraft:plate>,
	<jaopca:item_platetungsten>,
	<jaopca:item_plateancientdebris>,
	<contenttweaker:material_part:920>,
	<contenttweaker:material_part:930>,
	<contenttweaker:material_part:935>,
	<contenttweaker:material_part:970>,
	<contenttweaker:material_part:965>,
	<contenttweaker:material_part:960>,
	<contenttweaker:material_part:955>,
	<contenttweaker:material_part:945>,
	<contenttweaker:material_part:940>,
	<contenttweaker:material_part:1298>,
	<contenttweaker:material_part:1073>,
	<jaopca:item_platelithium>,
	<jaopca:item_plateboron>,
	<jaopca:item_plateuranium>,
	<jaopca:item_platethorium>,
	<jaopca:item_platemagnesium>,
] as crafttweaker.item.IItemStack[];

for TConplate in TConplates
{
	mods.tconstruct.Casting.removeTableRecipe(TConplate);
}

//Nuclearcraft Pressurizer Plates
val ncPlates =
[
	<jaopca:item_platetopaz>,
	<jaopca:item_platetanzanite>,
	<jaopca:item_platesapphire>,
	<jaopca:item_plateruby>,
	<jaopca:item_platequartz>,
	<jaopca:item_plateperidot>,
	<jaopca:item_platemalachite>,
	<jaopca:item_platelapis>,
	<jaopca:item_plateenderbiotite>,
	<jaopca:item_plateemerald>,
	<jaopca:item_platedimensionalshard>,
	<jaopca:item_platedilithium>,
	<jaopca:item_platediamond>,
	<jaopca:item_platecoal>,
	<jaopca:item_platechargedcertusquartz>,
	<jaopca:item_platecertusquartz>,
	<jaopca:item_plateaquamarine>,
	<jaopca:item_plateapatite>,
	<jaopca:item_plateamethyst>,
	<jaopca:item_plateamber>,
	<jaopca:item_plateuranium>,
	<jaopca:item_platetungsten>,
	<jaopca:item_platethorium>,
	<jaopca:item_plateosmium>,
	<jaopca:item_platemagnesium>,
	<jaopca:item_platelithium>,
	<jaopca:item_platedraconium>,
	<jaopca:item_platecobalt>,
	<jaopca:item_plateboron>,
	<jaopca:item_plateastralstarmetal>,
	<jaopca:item_plateardite>,
	<jaopca:item_plateancientdebris>,
	<embers:plate_dawnstone>,
	<contenttweaker:material_part:920>,
	<contenttweaker:material_part:915>,
	<contenttweaker:material_part:935>,
	<contenttweaker:material_part:945>,
	<contenttweaker:material_part:1298>,
	<contenttweaker:material_part:930>,
	<contenttweaker:material_part:955>,
	<contenttweaker:material_part:940>,
	<contenttweaker:material_part:965>,
	<contenttweaker:material_part:970>,
	<thaumcraft:plate:3>,
	<thaumcraft:plate:2>,
	<thaumcraft:plate>,
	<advancedrocketry:productplate:1>,
	<advancedrocketry:productplate>,
	<libvulpes:productplate:7>,
	<libvulpes:productplate:3>,
	<redstonearsenal:material:128>,
	<contenttweaker:material_part:950>,
	<contenttweaker:material_part:1073>,
	<contenttweaker:material_part:960>,
	<contenttweaker:material_part:845>,
	<contenttweaker:material_part:593>,
	<contenttweaker:material_part:613>,
	<contenttweaker:material_part:835>,
	<thermalfoundation:material:359>,
	<thermalfoundation:material:358>,
	<thermalfoundation:material:357>,
	<thermalfoundation:material:356>,
	<thermalfoundation:material:355>,
	<thermalfoundation:material:354>,
	<thermalfoundation:material:353>,
	<thermalfoundation:material:352>,
	<thermalfoundation:material:328>,
	<thermalfoundation:material:327>,
	<thermalfoundation:material:326>,
	<thermalfoundation:material:325>,
	<thermalfoundation:material:324>,
	<thermalfoundation:material:323>,
	<thermalfoundation:material:322>,
	<thermalfoundation:material:321>,
	<thermalfoundation:material:320>,
	<thermalfoundation:material:33>,
	<thermalfoundation:material:32>,
] as crafttweaker.item.IItemStack[];

for ncPlate in ncPlates
{
	mods.nuclearcraft.pressurizer.removeRecipeWithOutput(ncPlate);
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
	<embers:ingot_nickel>,
	<thermalfoundation:material:134>,
	<contenttweaker:material_part:616>,
	<redstonearsenal:material:32>,
	<advancedrocketry:productingot>,
	<minecraft:gold_ingot>,
	<contenttweaker:material_part:838>,
	<thaumcraft:ingot:2>,
	<biomesoplenty:gem:1>,
	<magneticraft:ingots:5>,
	<thermalfoundation:material:162>,
	<embers:ingot_lead>,
	<libvulpes:productingot:7>,
	<magneticraft:ingots:14>,
	<enderio:item_alloy_ingot>,
	<enderio:item_alloy_ingot:1>,
	<enderio:item_alloy_ingot:2>,
	<enderio:item_alloy_ingot:3>,
	<enderio:item_alloy_ingot:4>,
	<enderio:item_alloy_ingot:5>,
	<enderio:item_alloy_ingot:6>,
	<enderio:item_alloy_ingot:7>,
	<enderio:item_alloy_ingot:8>,
	<enderio:item_alloy_ingot:9>,
	<avaritia:resource:6>,
	<enderio:item_alloy_endergy_ingot>,
	<avaritia:resource:4>,
	<futuremc:netherite_scrap>,
	<nuclearcraft:ingot:7>,
	<nuclearcraft:ingot:3>,
	<nuclearcraft:ingot:4>,
	<nuclearcraft:ingot:5>,
	<nuclearcraft:ingot:6>,
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
	<jaopca:item_plateancientdebris>,
	<advancedrocketry:productplate:1>,
	<thermalfoundation:material:356>,
	<contenttweaker:material_part:603>,
	<contenttweaker:material_part:835>,
	<contenttweaker:material_part:593>,
	<contenttweaker:material_part:574>,
	<contenttweaker:material_part:613>,
	<thermalfoundation:material:322>,
	<thermalfoundation:material:355>,
	<thermalfoundation:material:320>,
	<thermalfoundation:material:325>,
	<contenttweaker:material_part:915>,
	<thermalfoundation:material:321>,
	<contenttweaker:material_part:845>,
	<contenttweaker:material_part:848>,
	<thermalfoundation:material:353>,
	<thermalfoundation:material:352>,
	<thermalfoundation:material:323>,
	<contenttweaker:material_part:855>,
	<thermalfoundation:material:327>,
	<thermalfoundation:material:324>,
	<contenttweaker:material_part:920>,
	<contenttweaker:material_part:925>,
	<contenttweaker:material_part:930>,
	<contenttweaker:material_part:935>,
	<contenttweaker:material_part:970>,
	<contenttweaker:material_part:965>,
	<contenttweaker:material_part:960>,
	<contenttweaker:material_part:955>,
	<contenttweaker:material_part:950>,
	<contenttweaker:material_part:945>,
	<contenttweaker:material_part:1298>,
	<contenttweaker:material_part:940>,
	<jaopca:item_platelithium>,
	<jaopca:item_plateboron>,
	<jaopca:item_plateuranium>,
	<jaopca:item_platethorium>,
	<jaopca:item_platemagnesium>,
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
	<contenttweaker:material_part:593>,
	<jaopca:item_plateancientdebris>,
	<jaopca:item_platelithium>,
	<jaopca:item_plateboron>,
	<jaopca:item_plateuranium>,
	<jaopca:item_platethorium>,
	<jaopca:item_platemagnesium>,
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

	if(!oreDict.get(craftingPlate).empty)
	{
		//2.5 Cost -- Manual
		//Check if an OreDict version exists
		if (!oreDict.get(craftingMaterial).empty)
		{
			recipes.addShapeless("plateCrafting_" ~ materialOreDict, oreDict.get(craftingPlate).firstItem * 2, [<embers:tinker_hammer>, oreDict.get(craftingMaterial), oreDict.get(craftingMaterial), oreDict.get(craftingMaterial), oreDict.get(craftingMaterial), oreDict.get(craftingMaterial)]);
		}

		//2.25 Cost - Plate Presser
		for plateMaterial in oreDict.get(craftingMaterial).items
		{
			val blockMat = "block" ~ materialOreDict;
			if(!oreDict.get(blockMat).empty)
			{
				for block in oreDict.get(blockMat).items
				{
					mods.advancedrocketry.PlatePresser.addRecipe(oreDict.get(craftingPlate).firstItem * 4, block);
				}
			}
		}

		//2 Cost -- Tinker's Casting
		if (molten.name != "water")
		{
			if (materialPrefix == "ingot" | materialPrefix == "dust")
			{
				if (materialPrefix == "Silicon" | materialPrefix == "Carbon" ) //Silicon and Carbon are made in 1000mb Increments
				{
					mods.tconstruct.Casting.addTableRecipe(oreDict.get(craftingPlate).firstItem, <tconstruct:cast_custom:3>, molten, 2000, false, 80);
				}
				else
				{
					mods.tconstruct.Casting.addTableRecipe(oreDict.get(craftingPlate).firstItem, <tconstruct:cast_custom:3>, molten, 288, false, 80);
				}
			}
			else
			{
				mods.tconstruct.Casting.addTableRecipe(oreDict.get(craftingPlate).firstItem, <tconstruct:cast_custom:3>, molten, 200, false, 80);
			}
		}

		//1.5 Cost -- Embers Plate Press, Compactor
		if (molten.name != "water")
		{
			if (materialPrefix == "ingot" | materialPrefix == "dust")
			{
				if (materialPrefix == "Silicon" | materialPrefix == "Carbon" )
				{
					mods.embers.Stamper.add(oreDict.get(craftingPlate).firstItem, molten * 1500, <embers:stamp_plate>, null);
				}
				else
				{
					mods.embers.Stamper.add(oreDict.get(craftingPlate).firstItem, molten * 216, <embers:stamp_plate>, null);
				}
			}
			else
			{
				mods.embers.Stamper.add(oreDict.get(craftingPlate).firstItem, molten * 150, <embers:stamp_plate>, null);
			}
		}


		if (craftingMaterial != "ingotCoal") //For some reason ingotCoal gets passed into this function even though it doesn't exist
		{
			mods.thermalexpansion.Compactor.addStorageRecipe(oreDict.get(craftingPlate).firstItem * 2, oreDict.get(craftingMaterial).firstItem * 3, 10000);
		}

		//1 Cost
		for ingot in oreDict.get(craftingMaterial).items
		{
			mods.advancedrocketry.RollingMachine.addRecipe(oreDict.get(craftingPlate).firstItem, 60, 5000 / 60, 100, [ingot]);
		}

		//0.5 Cost
		for ingot1 in oreDict.get(craftingMaterial).items
		{
	    	//Implement 1-cost smashing
		}
	}
	else
	{
		print("Could not find a plate for the material" ~ materialOreDict);
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
	"Chrome" : <liquid:chromium>,
	"Obsidian" : <liquid:obsidian>,
	"Silicon" : <liquid:water>,
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
	"Zinc" : <liquid:zinc>,
	"Mithril" : <liquid:mithril>,
	"Constantan" : <liquid:constantan>,
	"Signalum" : <liquid:signalum>,
	"Lumium" : <liquid:lumium>,
	"Enderium" : <liquid:enderium>,
	"ElectrumFlux" : <liquid:water>,
	"Thaumium" : <liquid:thaumium>,
	"Void" : <liquid:voidmetal>,
	"Vibranium" : <liquid:vibranium>,
	"Necrodermis" : <liquid:necrodermis>,
	"Thorium" : <liquid:thorium>,
	"Dawnstone" : <liquid:dawnstone>,
	"Chromium" : <liquid:chromium>,
	"Ardite" : <liquid:ardite>,
	"Manyullyn" : <liquid:manyullyn>,
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
	"Topaz" : <liquid:water>,
	"ElectricalSteel" : <liquid:electrical_steel>,
	"AncientDebris" : <liquid:ancient_debris>,
	"EndSteel" : <liquid:end_steel>,
	"Neutronium" : <liquid:water>,
	"EnergeticAlloy" : <liquid:energetic_alloy>,
	"RedstoneAlloy" : <liquid:redstone_alloy>,
	"ConstructionAlloy" : <liquid:construction_alloy>,
	"VibrantAlloy" : <liquid:vibrant_alloy>,
	"Soularium" : <liquid:soularium>,
	"PulsatingIron" : <liquid:pulsating_iron>,
	"Infinity" : <liquid:water>,
	"DarkSteel" : <liquid:dark_steel>,
	"ConductiveIron" : <liquid:conductive_iron>,
	"Neutronium" : <liquid:water>,
	"DraconiumAwakened" : <liquid:awakened_draconium>,
	"Thorium" : <liquid:thorium>,
	"Uranium" : <liquid:uranium>,
	"Boron" : <liquid:boron>,
	"Lithium" : <liquid:lithium>,
	"Magnesium" : <liquid:magnesium>,
	"SealedWood" : <liquid:water>,
	"MelodicAlloy" : <liquid:melodic_alloy>,
	"CrystallineAlloy" : <liquid:crystalline_alloy>,
	"CrystallinePinkSlime" : <liquid:crystalline_pink_slime>,
	"StellarAlloy" : <liquid:stellar_alloy>,
	"EnergeticSilver" : <liquid:energetic_silver>,
} as ILiquidStack[string];

for materialString, molten in PlateMaterials
{
	val plateDict = "plate" ~ materialString;
	if (oreDict has plateDict)
	{
		if(!oreDict.get("ingot" ~ materialString).empty)
		{
			AddPlateCrafting(materialString, "ingot", molten);
		}
		else if (!oreDict.get("gem" ~ materialString).empty)
		{
			AddPlateCrafting(materialString, "gem", molten);
		}
		else if (!oreDict.get("plank" ~ materialString).empty)
		{
			AddPlateCrafting(materialString, "plank", molten);
		}
		else if (!oreDict.get("dust" ~ materialString).empty)
		{
			AddPlateCrafting(materialString, "dust", molten);
		}
		else
		{
			print("Could not find a matching material for " ~ materialString);
		}
	}
	else
	{
		print("No oredict exists for " ~ plateDict);
	}
}

print("### Plate Management Init Complete ###");
