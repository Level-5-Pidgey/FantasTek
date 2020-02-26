#priority 500
import crafttweaker.liquid.ILiquidStack;
import mods.zenstages.Stage;
import scripts.staging.stages;

//Function for adding tooltips to items
function AddTooltip(item as crafttweaker.item.IItemStack, lines as crafttweaker.formatting.IFormattedText[]) {
    item.addTooltip(format.green("|| R.E.E.D. I.T. Advice ||"));
    for line in lines {
        item.addTooltip(format.white(line));
    }
}

//Function for IIngredient return of all Astral Sorcery Elemental Items (for normal crafting bench recipes)
function GetAstralCraftingMaterials(tier as int) as crafttweaker.item.IIngredient
{
	var IngredientToReturn = null;
	if(tier == 1)
	{
		IngredientToReturn = <contenttweaker:astral_crystal_air> | <contenttweaker:astral_crystal_fire> | <contenttweaker:astral_crystal_water> | <contenttweaker:astral_crystal_earth>;
	}

	return IngredientToReturn;
}

//Function for IIngredient return of all Botania Elemental Items (for normal crafting bench recipes)
function GetBotaniaCraftingMaterials(tier as int) as crafttweaker.item.IIngredient
{
	var IngredientToReturn = null;
	if(tier == 1)
	{
		IngredientToReturn = <ore:runeWaterB>.firstItem | <ore:runeFireB>.firstItem | <ore:runeEarthB>.firstItem | <ore:runeAirB>.firstItem;
	}

	return IngredientToReturn;
}

//Function for IIngredient return of all Blood Magic Elemental Items (for normal crafting bench recipes)
function GetBloodMagicCraftingMaterials(tier as int) as crafttweaker.item.IIngredient
{
	var IngredientToReturn = null;
	if(tier == 1)
	{
		IngredientToReturn = <contenttweaker:sanguine_gem_fire> | <contenttweaker:sanguine_gem_water> | <contenttweaker:sanguine_gem_earth> | <contenttweaker:sanguine_gem_air>;
	}

	return IngredientToReturn;
}

//Function for IIngredient return of all Embers Elemental Items (for normal crafting bench recipes)
function GetEmbersCraftingMaterials(tier as int) as crafttweaker.item.IIngredient
{
	var IngredientToReturn = null;
	if(tier == 1)
	{
		IngredientToReturn = <contenttweaker:crystal_ember_fire> | <contenttweaker:crystal_ember_water> | <contenttweaker:crystal_ember_earth> | <contenttweaker:crystal_ember_air>;
	}

	return IngredientToReturn;
}

//Function for IIngredient return of all Thaumcraft Elemental Items (for normal crafting bench recipes)
function GetThaumcraftCraftingMaterials(tier as int) as crafttweaker.item.IIngredient
{
	var IngredientToReturn = null;
	if(tier == 1)
	{
		IngredientToReturn = <contenttweaker:salis_mundus_fire> | <contenttweaker:salis_mundus_water> | <contenttweaker:salis_mundus_earth> | <contenttweaker:salis_mundus_air>;
	}

	return IngredientToReturn;
}


//Variable for all T1 Magic Items (for extended crafting recipes)
static AllT1MagicItems as crafttweaker.item.IItemStack[] =
[
<botania:rune>,
<botania:rune:1>,
<botania:rune:2>,
<botania:rune:3>,
<contenttweaker:astral_crystal_air>,
<contenttweaker:astral_crystal_fire>,
<contenttweaker:astral_crystal_water>,
<contenttweaker:astral_crystal_earth>,
<contenttweaker:sanguine_gem_fire>,
<contenttweaker:sanguine_gem_water>,
<contenttweaker:sanguine_gem_earth>,
<contenttweaker:sanguine_gem_air>,
<contenttweaker:crystal_ember_fire>,
<contenttweaker:crystal_ember_water>,
<contenttweaker:crystal_ember_earth>,
<contenttweaker:crystal_ember_air>,
<contenttweaker:salis_mundus_fire>,
<contenttweaker:salis_mundus_water>,
<contenttweaker:salis_mundus_earth>,
<contenttweaker:salis_mundus_air>
];

//Variable for all T1 Fire Element Items (for extended crafting recipes)
static AllFireT1Items as crafttweaker.item.IItemStack[] =
[
  <contenttweaker:astral_crystal_fire>,
  <ore:runeFireB>.firstItem,
  <contenttweaker:sanguine_gem_fire>,
  <contenttweaker:crystal_ember_fire>,
  <contenttweaker:salis_mundus_fire>
];

//Variable for all T1 Water Element Items (for extended crafting recipes)
static AllWaterT1Items as crafttweaker.item.IItemStack[] =
[
  <contenttweaker:astral_crystal_water>,
  <ore:runeWaterB>.firstItem,
  <contenttweaker:sanguine_gem_water>,
  <contenttweaker:crystal_ember_water>,
  <contenttweaker:salis_mundus_water>
];

//Variable for all T1 Air Element Items (for extended crafting recipes)
static AllAirT1Items as crafttweaker.item.IItemStack[] =
[
  <contenttweaker:astral_crystal_air>,
  <ore:runeAirB>.firstItem,
  <contenttweaker:sanguine_gem_air>,
  <contenttweaker:crystal_ember_air>,
  <contenttweaker:salis_mundus_air>
];

//Variable for all T1 Earth Element Items (for extended crafting recipes)
static AllEarthT1Items as crafttweaker.item.IItemStack[] =
[
  <contenttweaker:astral_crystal_earth>,
  <ore:runeEarthB>.firstItem,
  <contenttweaker:sanguine_gem_earth>,
  <contenttweaker:crystal_ember_earth>,
  <contenttweaker:salis_mundus_earth>
];

static OresWithProcessingTier as int[string] =
{
	"Iron" : 0,
	"Gold" : 0,
	"Redstone" : 0,
	"Diamond" : 0,
	"Emerald" : 0,
	"Coal" : 0,
	"Chrome" : 5,
	"Ruby" : 0,
	"Sapphire" : 0,
	"Peridot" : 0,
	"Aluminum" : 1,
	"Copper" : 1,
	"Iridium" : 5,
	"Lead" : 1,
	"Nickel" : 1,
	"Platinum" : 3,
	"Silver" : 1,
	"Tin" : 1,
	"Titanium" : 6,
	"Tungsten" : 5,
	"Zinc" : 1,
	"Mithril" : 3,
	"Yellorium" : 4,
	"Vibranium" : 8,
	"Necrodermis" : 8,
	"Thorium" : 5,
	"Chromium" : 5,
	"Ardite" : 2,
	"AstralStarmetal" : 0,
	"Cobalt" : 2,
	"Draconium" : 7,
	"Uranium" : 4,
	"Osmium" : 4,
	"Amber" : 0,
	"Amethyst" : 0,
	"Apatite" : 1,
	"Aquamarine" : 0,
	"CertusQuartz" : 2,
	"ChargedCertusQuartz" : 2,
	"Dilithium" : 7,
	"DimensionalShard" : 6,
	"EnderBiotite" : 3,
	"Lapis" : 0,
	"Malachite" : 0,
	"Quartz" : 0,
	"Tanzanite" : 0,
	"Topaz" : 0
};

//Ore Types with Liquids Attached
static OresWithMolten as ILiquidStack[string]=
{
	"Iron" : <liquid:iron>,
	"Gold" : <liquid:gold>,
	"Redstone" : <liquid:redstone>,
	"Diamond" : <liquid:water>,
	"Emerald" : <liquid:emerald>,
	"Coal" : <liquid:coal>,
	"Chrome" :<liquid:chromium>,
	"Ruby" : <liquid:water>,
	"Sapphire" : <liquid:water>,
	"Peridot" : <liquid:water>,
	"Aluminum" : <liquid:aluminum>,
	"Copper" : <liquid:copper>,
	"Iridium" : <liquid:iridium>,
	"Lead" : <liquid:lead>,
	"Nickel" : <liquid:nickel>,
	"Platinum" : <liquid:platinum>,
	"Silver" : <liquid:silver>,
	"Tin" : <liquid:tin>,
	"Titanium" : <liquid:titanium>,
	"Tungsten" : <liquid:tungsten>,
	"Zinc" : <liquid:zinc>,
	"Mithril" : <liquid:mithril>,
	"Yellorium" : <liquid:yellorium>,
	"Vibranium" : <liquid:vibranium>,
	"Necrodermis" : <liquid:necrodermis>,
	"Thorium" : <liquid:thorium>,
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
};

//Gamestages for each Ore Processing Tier
static StageForProcessingTier as Stage[int]=
{
	0 : stages.progression1,
	1 : stages.progression1,
	2 : stages.Locked,
	3 : stages.Locked,
	4 : stages.Locked,
	5 : stages.Locked,
	6 : stages.Locked,
	7 : stages.Locked,
	8 : stages.Locked,
};

function getLiquidStringFromObject(liquid as ILiquidStack) as string
{
	return liquid.name;
}

//Gets a Bucket Item from a Liquid String
function formatBucket(liquidName as string) as crafttweaker.item.IItemStack {
	//Unique Buckets
	if (liquidName == "lava")
	{
		return <minecraft:lava_bucket>;
	}
	else if (liquidName == "water")
	{
		return <minecraft:water_bucket>;
	}
	else if (liquidName == "milk")
	{
		return <minecraft:milk_bucket>;
	}

	var liquidData as crafttweaker.data.IData = {
		FluidName: liquidName,
		Amount: 1000
	};

	return <forge:bucketfilled>.withTag(liquidData);
}

function unstageAndHide(item as crafttweaker.item.IItemStack)
{
	mods.ItemStages.removeItemStage(item);
	mods.jei.JEI.removeAndHide(item);
}

static T1MagicWaterIngredients as crafttweaker.oredict.IOreDictEntry[] =
[
	<ore:nuggetPrismarine>, <ore:sugarcane>, <ore:gemLapis>, <ore:dyeLightBlue>
];

static T1MagicFireIngredients as crafttweaker.oredict.IOreDictEntry[] =
[
	<ore:cropNetherWart>, <ore:ingotBrickNether>, <ore:gunpowder>, <ore:dyeOrange>
];

static T1MagicAirIngredients as crafttweaker.oredict.IOreDictEntry[] =
[
	<ore:feather>, <ore:string>, <ore:blockGlassColorless>, <ore:dyeGray>
];

static T1MagicEarthIngredients as crafttweaker.oredict.IOreDictEntry[] =
[
	<ore:obsidian>, <ore:cropWheat>, <ore:treeLeaves>, <ore:dyeLime>
];
