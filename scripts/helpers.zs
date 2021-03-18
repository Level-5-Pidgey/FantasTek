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
    <contenttweaker:salis_mundus_air>,
    <contenttweaker:elemental_mote_fire>,
    <contenttweaker:elemental_mote_water>,
    <contenttweaker:elemental_mote_air>,
    <contenttweaker:elemental_mote_earth>
];

//Variable for all T1 Fire Element Items (for extended crafting recipes)
static AllFireT1Items as crafttweaker.item.IItemStack[] =
[
    <contenttweaker:astral_crystal_fire>,
    <ore:runeFireB>.firstItem,
    <contenttweaker:sanguine_gem_fire>,
    <contenttweaker:crystal_ember_fire>,
    <contenttweaker:salis_mundus_fire>,
    <contenttweaker:elemental_mote_fire>
];

//Variable for all T1 Water Element Items (for extended crafting recipes)
static AllWaterT1Items as crafttweaker.item.IItemStack[] =
[
    <contenttweaker:astral_crystal_water>,
    <ore:runeWaterB>.firstItem,
    <contenttweaker:sanguine_gem_water>,
    <contenttweaker:crystal_ember_water>,
    <contenttweaker:salis_mundus_water>,
    <contenttweaker:elemental_mote_water>
];

//Variable for all T1 Air Element Items (for extended crafting recipes)
static AllAirT1Items as crafttweaker.item.IItemStack[] =
[
    <contenttweaker:astral_crystal_air>,
    <ore:runeAirB>.firstItem,
    <contenttweaker:sanguine_gem_air>,
    <contenttweaker:crystal_ember_air>,
    <contenttweaker:salis_mundus_air>,
    <contenttweaker:elemental_mote_air>
];

//Variable for all T1 Earth Element Items (for extended crafting recipes)
static AllEarthT1Items as crafttweaker.item.IItemStack[] =
[
    <contenttweaker:astral_crystal_earth>,
    <ore:runeEarthB>.firstItem,
    <contenttweaker:sanguine_gem_earth>,
    <contenttweaker:crystal_ember_earth>,
    <contenttweaker:salis_mundus_earth>,
    <contenttweaker:elemental_mote_earth>
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
    "Zinc" : 3,
    "Mithril" : 3,
    "Thorium" : 4,
    "Uranium": 4,
    "Boron" : 2,
    "Magnesium" : 3,
    "Lithium" : 2,
    "Vibranium" : 8,
    "Necrodermis" : 8,
    "Chromium" : 5,
    "Ardite" : 2,
    "AstralStarmetal" : 0,
    "Cobalt" : 2,
    "Draconium" : 7,
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
    "Topaz" : 0,
    "AncientDebris" : 0,
};

//Ore Types with Liquids Attached
static OresWithMolten as ILiquidStack[string]=
{
    "Iron" : <liquid:iron>,
    "Gold" : <liquid:gold>,
    "Redstone" : <liquid:redstone>,
    "Diamond" : <liquid:diamond>,
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
    "Vibranium" : <liquid:vibranium>,
    "Necrodermis" : <liquid:necrodermis>,
    "Chromium" : <liquid:chromium>,
    "Ardite" : <liquid:ardite>,
    "AstralStarmetal" : <liquid:astral_starmetal>,
    "Cobalt" : <liquid:cobalt>,
    "Draconium" : <liquid:draconium>,
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
    "Lapis" : <liquid:lapis>,
    "Malachite" : <liquid:water>,
    "Quartz" : <liquid:quartz>,
    "Tanzanite" : <liquid:water>,
    "AncientDebris" : <liquid:ancient_debris>,
    "Topaz" : <liquid:water>,
    "Thorium" : <liquid:thorium>,
    "Uranium": <liquid:uranium>,
    "Boron" : <liquid:boron>,
    "Magnesium" : <liquid:magnesium>,
    "Lithium" : <liquid:lithium>,
};

//Gamestages for each Ore Processing Tier
static StageForProcessingTier as Stage[int]=
{
    0 : stages.progression1,
    1 : stages.progression1,
    2 : stages.progression2,
    3 : stages.progression3,
    4 : stages.progression3,
    5 : stages.progression3,
    6 : stages.progression3,
    7 : stages.progression3,
    8 : stages.progression3,
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

function createRecipeName(outputItem as crafttweaker.item.IItemStack) as string
{
    return outputItem.displayName ~ "-" ~ outputItem.metadata;
}

static AnyPetalOrShroom as crafttweaker.item.IIngredient = <botania:petal:*> | <botania:mushroom:*>;

function setItemAndRecipesStage(itemToStage as crafttweaker.item.IItemStack, stageToSetTo as string)
{
    //Remove any current stages applied to the item
    mods.ItemStages.removeItemStage(itemToStage);

    //Add item to stage
    mods.ItemStages.addItemStage(stageToSetTo, itemToStage);

    //If there are crafting recipes for that item, set it to the stage the item is limited to
    if (recipes.getRecipesFor(itemToStage).length != 0)
    {
        mods.recipestages.Recipes.setRecipeStage(stageToSetTo, itemToStage);
    }
}

function createTierTooltip(prefixString as string, tier as int, plus1 as bool, suffixString as string) as crafttweaker.formatting.IFormattedText
{
    var tierNumberAsColouredText as crafttweaker.formatting.IFormattedText = "";
    var modifiedTier as int = tier;

    //If we want to "plus one" the numerical value, do so here
    if(plus1)
    {
        modifiedTier += 1;
    }

    if(modifiedTier == 0)
    {
        tierNumberAsColouredText = format.bold(format.darkGray("0"));
    }
    else if(modifiedTier == 1)
    {
        tierNumberAsColouredText = format.bold(format.gray("1"));
    }
    else if(modifiedTier == 2)
    {
        tierNumberAsColouredText =  format.bold(format.yellow("2"));
    }
    else if(modifiedTier == 3)
    {
        tierNumberAsColouredText = format.bold(format.gold("3"));
    }
    else if(modifiedTier == 4)
    {
        tierNumberAsColouredText = format.bold(format.red("4"));
    }
    else if(modifiedTier == 5)
    {
        tierNumberAsColouredText = format.bold(format.darkRed("5"));
    }
    if(modifiedTier == 6)
    {
        tierNumberAsColouredText = format.bold(format.aqua("6"));
    }
    if(modifiedTier == 7)
    {
        tierNumberAsColouredText = format.bold(format.darkGreen("7"));
    }
    if(modifiedTier == 8)
    {
        tierNumberAsColouredText = format.bold(format.green("8"));
    }

    //Now we have the tier text, add the tooltip!
    var finalText as crafttweaker.formatting.IFormattedText = format.italic(format.white(prefixString)) ~ tierNumberAsColouredText ~ format.italic(format.white(suffixString));
    return finalText;
}

static CircuitTiers as crafttweaker.item.IItemStack[int] =
{
    0 : <advancedrocketry:ic>,
    1 : <mekanism:controlcircuit>,
    2 : <mekanism:controlcircuit>.withTag(scripts.mmhelper.mechImbuementData),
};

static FrameTiers as crafttweaker.item.IItemStack[int]=
{
    0 : <enderio:item_material>,
    1 : <mekanism:basicblock:8>,
    2 : <mekanism:basicblock:8>.withTag(scripts.mmhelper.mechImbuementData),
};

static ElectronicTiers as crafttweaker.item.IIngredient[int]=
{
    0 : <enderio:item_basic_capacitor>,
    1 : <minecraft:bedrock>,
};

static MotorTiers as crafttweaker.item.IItemStack[int]=
{
    0 : <magneticraft:crafting:2>,
    1 : <nuclearcraft:part:8>,
};

static BatteryTiers as crafttweaker.item.IItemStack[int]=
{
    0 : <magneticraft:battery_item_low>,
    1 : <magneticraft:battery_item_medium>,
    2 : <nuclearcraft:lithium_ion_cell>,
    3 : <contenttweaker:energy_crystal>
};

static BiomeGemMaterial as crafttweaker.item.IIngredient[string] =
{
    "ore" : <ore:oreRuby>.firstItem | <ore:orePeridot>.firstItem |
    <ore:oreTopaz>.firstItem | <ore:oreTanzanite>.firstItem |
    <ore:oreMalachite>.firstItem | <ore:oreSapphire>.firstItem |
    <ore:oreAmber>.firstItem | <ore:oreEmerald>.firstItem,
    "gem" : <ore:gemRuby>.firstItem | <ore:gemPeridot>.firstItem |	<ore:gemTopaz>.firstItem | <ore:gemTanzanite>.firstItem |	<ore:gemMalachite>.firstItem | <ore:gemSapphire>.firstItem |	<ore:gemAmber>.firstItem | <ore:gemEmerald>.firstItem,
    "block" : <ore:blockRuby>.firstItem | <ore:blockPeridot>.firstItem | <ore:blockTopaz>.firstItem | <ore:blockTanzanite>.firstItem | <ore:blockMalachite>.firstItem | <ore:blockSapphire>.firstItem | <ore:blockAmber>.firstItem | <ore:blockEmerald>.firstItem,
    "plate" : <ore:plateRuby>.firstItem | <ore:platePeridot>.firstItem | <ore:plateTopaz>.firstItem | <ore:plateTanzanite>.firstItem | <ore:plateMalachite>.firstItem | <ore:plateSapphire>.firstItem | <ore:plateAmber>.firstItem | <ore:plateEmerald>.firstItem,
    "gear" : <ore:gearRuby>.firstItem | <ore:gearPeridot>.firstItem | <ore:gearTopaz>.firstItem | <ore:gearTanzanite>.firstItem | <ore:gearMalachite>.firstItem | <ore:gearSapphire>.firstItem | <ore:gearAmber>.firstItem | <ore:gearEmerald>.firstItem,
};

function mathMax(n1 as int, n2 as int) as int
{
    if(n1 > n2)
    {
        return n1;
    }

    if(n2 > n1)
    {
        return n2;
    }

    return n1;
}

function mathMin(n1 as int, n2 as int) as int
{
    if(n1 < n2)
    {
        return n1;
    }

    if(n2 < n1)
    {
        return n2;
    }

    return n1;
}

function addAlloySmeltingRecipeWithSecondary(output as crafttweaker.item.IItemStack, input1 as crafttweaker.item.IItemStack, input2 as crafttweaker.item.IItemStack, energyCost as int, chanceOutput as crafttweaker.item.IItemStack, chanceFloat as float, allowBasicAlloy as bool)
{
    //Thermal Expansion Induction Smelter
    if(chanceOutput.matches(<minecraft:bedrock>))
    {
        mods.thermalexpansion.InductionSmelter.addRecipe(output, input1, input2, energyCost);
    }
    else
    {
        mods.thermalexpansion.InductionSmelter.addRecipe(output, input1, input2, energyCost, chanceOutput, chanceFloat);
    }

    //EnderIO Alloy Smelter
    var inputArray = [input1, input2] as crafttweaker.item.IItemStack[];
    mods.enderio.AlloySmelter.addRecipe(output, inputArray, energyCost);

    //Advanced Rocketry Arc Furnace
    if(allowBasicAlloy)
    {
        mods.advancedrocketry.ArcFurnace.addRecipe(output, 1200, energyCost / 1200, input1, input2, <minecraft:sand>);
    }
}

function addAlloySmeltingRecipe(output as crafttweaker.item.IItemStack, input1 as crafttweaker.item.IItemStack, input2 as crafttweaker.item.IItemStack, energyCost as int, allowBasicAlloy as bool)
{
    addAlloySmeltingRecipeWithSecondary(output, input1, input2, energyCost, <minecraft:bedrock>, 0.0f, allowBasicAlloy);
}

function addCrushingRecipeWithSecondary(output as crafttweaker.item.IItemStack, input as crafttweaker.item.IIngredient, energyCost as int, extraOutput as crafttweaker.item.IItemStack, extraOutputChance as float, allowBasicGrinder as bool)
{
    if(!extraOutput.matches(<minecraft:bedrock>))
    {
        //EnderIO SAG Mill
        var outputArray = [output] as crafttweaker.item.IItemStack[];
        outputArray += extraOutput;
        var chanceArray = [1.0] as float[];
        chanceArray += (extraOutputChance / 100) as float;
        mods.enderio.SagMill.addRecipe(outputArray, chanceArray, input, "MULTIPLY_OUTPUT", energyCost);

        //Thermal Expansion Pulverizer
        mods.thermalexpansion.Pulverizer.addRecipe(output, input.items[0], energyCost, extraOutput, extraOutputChance);

        if(allowBasicGrinder)
        {
            //Magneticraft Grinder
            mods.magneticraft.Grinder.addRecipe(input.items[0], output, extraOutput, chanceArray[1], energyCost / 45, true);

            mods.appliedenergistics2.Grinder.addRecipe(output, input.items[0], 5, extraOutput, extraOutputChance);
        }
    }
    else
    {
        //EnderIO SAG Mill
        var outputArray = [output] as crafttweaker.item.IItemStack[];
        var chanceArray = [1.0] as float[];
        mods.enderio.SagMill.addRecipe(outputArray, chanceArray, input, "MULTIPLY_OUTPUT", energyCost);

        //Thermal Expansion Pulverizer
        mods.thermalexpansion.Pulverizer.addRecipe(output, input.items[0], energyCost);

        if(allowBasicGrinder)
        {
            //Magneticraft Grinder
            mods.magneticraft.Grinder.addRecipe(input.items[0], output, <minecraft:gravel>, 0.0, energyCost / 45, true);

            mods.appliedenergistics2.Grinder.addRecipe(output, input.items[0], 5, extraOutput, extraOutputChance);
        }
    }

    //Mekanism Crusher
    mods.mekanism.crusher.addRecipe(input, output);
}

function addCrushingRecipe(output as crafttweaker.item.IItemStack, input as crafttweaker.item.IIngredient, energyCost as int, allowBasicGrinder as bool)
{
    addCrushingRecipeWithSecondary(output, input, energyCost, <minecraft:bedrock>, 0.0f, allowBasicGrinder);
}

function addMeltingRecipe(output as ILiquidStack, input as crafttweaker.item.IIngredient, energyCost as int, allowBasicMelter as bool)
{
    var inputAsStack as crafttweaker.item.IItemStack = input.items[0];
    //Nuclearcraft Melter
    mods.nuclearcraft.melter.addRecipe(input, output);

    //Tcon Smeltery
    if (allowBasicMelter)
    {
        mods.tconstruct.Melting.addRecipe(output, input);
    }

    //Industrial Mixer (basic melting)
    scripts.mmhelper.IndustrialMixerFactoryRecipe(createRecipeName(inputAsStack) ~ output.name, energyCost, energyCost / 200, output, null, null, null, null, null, inputAsStack, null, null);

    //Magma Crucible
    mods.thermalexpansion.Crucible.addRecipe(output, inputAsStack, energyCost);
}

function addInjectionRecipe(output as crafttweaker.item.IItemStack, inputItem as crafttweaker.item.IIngredient, inputFluid as ILiquidStack, energyCost as int, allowBasicInjection as bool)
{
    var inputAsStack as crafttweaker.item.IItemStack = inputItem.items[0];

    //Nuclearcraft Fluid Injector
    mods.nuclearcraft.infuser.addRecipe(inputItem, inputFluid, output);

    //Fluid Transposer
    mods.thermalexpansion.Transposer.addFillRecipe(output, inputAsStack, inputFluid, energyCost);

    //Tinkers Construct Casting
    if(allowBasicInjection)
    {
        mods.tconstruct.Casting.addBasinRecipe(output, inputItem, inputFluid * 1, inputFluid.amount, true, energyCost / 100);
    }

    //Throwing item in Fluid
    if (inputFluid.amount <= 1000)
    {
        mods.inworldcrafting.FluidToItem.transform(output, inputFluid * 1, [inputItem], true);
    }

    //Industrial Mixer Factory
    scripts.mmhelper.IndustrialMixerFactoryRecipe(createRecipeName(output) ~ inputFluid.name, energyCost, energyCost / 200, null, null, inputFluid, null, null, null, inputAsStack, null, output);
}

function createAdvancedCraftingRecipe(
    output as crafttweaker.item.IItemStack,
    mainItems as crafttweaker.item.IIngredient[][],
    extraItemCommon as crafttweaker.item.IIngredient,
    extraItemUncommon as crafttweaker.item.IIngredient,
    extraItemRare as crafttweaker.item.IIngredient,
    recipeStringExtras as string,
    allowAlternateCrafting as bool
    )
{
    //Main ExtendedCrafting Recipe
    mods.extendedcrafting.TableCrafting.addShaped(0, output, [
    	[extraItemRare, extraItemUncommon, extraItemCommon, extraItemUncommon, extraItemRare],
    	[extraItemCommon, mainItems[0][0], mainItems[0][1], mainItems[0][2], extraItemCommon],
    	[extraItemUncommon, mainItems[1][0], mainItems[1][1], mainItems[1][2], extraItemUncommon],
    	[extraItemCommon, mainItems[2][0], mainItems[2][1], mainItems[2][2], extraItemCommon],
    	[extraItemRare, extraItemUncommon, extraItemCommon, extraItemUncommon, extraItemRare]
    ]);

    //If Alternate Recipes are allowed, create them as well
    if(allowAlternateCrafting)
    {
        //Next Stage Crafting Recipe
        mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(output) ~ recipeStringExtras, scripts.helpers.stages.progression3.stage, output, [[mainItems[0][0], mainItems[0][1], mainItems[0][2]], [mainItems[1][0], mainItems[1][1], mainItems[1][2]], [mainItems[2][0], mainItems[2][1], mainItems[2][2]]]);

        //Astral Sorcery Cheaper Crafting
        mods.astralsorcery.Altar.addAttunementAltarRecipe("fantastek:shaped/internal/altar/" ~ scripts.helpers.createRecipeName(output) ~ recipeStringExtras, output, 500, 160, [
		mainItems[0][0], mainItems[0][1], mainItems[0][2],
		mainItems[1][0], mainItems[1][1], mainItems[1][2],
		mainItems[2][0], mainItems[2][1], mainItems[2][2],
		extraItemRare, extraItemRare, extraItemRare, extraItemRare]);
    }
}

function combineRecipeItems(inputItems as crafttweaker.item.IIngredient[]) as crafttweaker.item.IIngredient[]
{
    var returnItems as crafttweaker.item.IIngredient[] = [];

    //Add the first non-null item to the returnItems list.
    var firstItemIndex as int = 0;
    var foundNull as bool = false;
    for i, inputItem in inputItems
    {
        if (!isNull(inputItem) && !isNull(inputItem.items) && !foundNull)
        {
            firstItemIndex = i;
            foundNull = true;
        }
    }
    returnItems += inputItems[firstItemIndex].items[0].withAmount(1);

	for inputItem in inputItems
	{
        if(!isNull(inputItem))
        {
    		//Update mode : 0  = no change, 1 = new item, 2 = update item
    		var updateFinal as int = 0;
    		var changeItem as crafttweaker.item.IIngredient = null;
    		var changeIndex as int = 0;

    		for i, finalItem in returnItems
    		{
    			if(!isNull(inputItem.items) && inputItem.items.length > 0)
    			{
    				var singleFinalItem = finalItem.items[0].withAmount(1);
    				var singleinputItem = inputItem.items[0].withAmount(1);

    				if(singleFinalItem.matches(singleinputItem))
    				{
    					//The item is already in the array of recipe requirements
    					//Increase the amount necessary instead
    					changeItem = finalItem.amount(finalItem.amount + inputItem.items[0].amount);
    					changeIndex = i;
    					updateFinal = 2;

    					break;
    				}
    				else
    				{
    					changeItem = inputItem;
    					updateFinal = 1;
    				}
    			}
    		}

    		if(updateFinal == 2)
    		{
    			returnItems[changeIndex] = changeItem;
    		}
    		else if (updateFinal == 1)
    		{
    			returnItems += changeItem;
    		}
        }
	}

    if (returnItems.length > 0)
    {
        returnItems[0] = returnItems[0].amount(returnItems[0].items[0].amount - 1);
    }

    return returnItems;
}

function CreateAssemblyRecipe(
    output as crafttweaker.item.IItemStack,
    inputItems as crafttweaker.item.IIngredient[],
    craftingTime as int,
    energyCost as int
)
{
    //Forestry Carpenter
    if(inputItems.length == 9)
    {
        mods.forestry.Carpenter.addRecipe(output, [[inputItems[0], inputItems[1], inputItems[2]], [inputItems[3], inputItems[4], inputItems[5]], [inputItems[6], inputItems[7], inputItems[8]]], craftingTime * 1.5f, <liquid:lubricant> * 200);
    }

    //Combine the recipe slots for the next 2 processing methods
    var combinedItems = combineRecipeItems(inputItems);

    //Modular Machinery Assembly Line
    scripts.mmhelper.AssemblyLineRecipe(createRecipeName(output), energyCost, craftingTime, output, combinedItems);
}
