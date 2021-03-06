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
    "Topaz" : 0,
    "AncientDebris" : 0,
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
    "AncientDebris" : <liquid:ancient_debris>,
    "Topaz" : <liquid:water>
};

//Gamestages for each Ore Processing Tier
static StageForProcessingTier as Stage[int]=
{
    0 : stages.progression1,
    1 : stages.progression1,
    2 : stages.progression2,
    3 : stages.progression2,
    4 : stages.progression2,
    5 : stages.progression2,
    6 : stages.progression2,
    7 : stages.progression2,
    8 : stages.progression2,
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

static CircuitTiers as crafttweaker.item.IIngredient[int] =
{
    0 : <advancedrocketry:ic>,
};

static FrameTiers as crafttweaker.item.IItemStack[int]=
{
    0 : <enderio:item_material>,
    1 : <minecraft:bedrock>,
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

function addAlloySmeltingRecipeWithSecondary(output as crafttweaker.item.IItemStack, input1 as crafttweaker.item.IItemStack, input2 as crafttweaker.item.IItemStack, energyCost as int, chanceOutput as crafttweaker.item.IItemStack, chanceFloat as float)
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
    var inputArray = [input1, input2] as  crafttweaker.item.IItemStack[];
    mods.enderio.AlloySmelter.addRecipe(output, inputArray, energyCost);
}

function addAlloySmeltingRecipe(output as crafttweaker.item.IItemStack, input1 as crafttweaker.item.IItemStack, input2 as crafttweaker.item.IItemStack, energyCost as int)
{
    addAlloySmeltingRecipeWithSecondary(output, input1, input2, energyCost, <minecraft:bedrock>, 0.0f);
}

function addCrushingRecipeWithSecondary(output as crafttweaker.item.IItemStack, input as crafttweaker.item.IIngredient, energyCost as int, extraOutput as crafttweaker.item.IItemStack, extraOutputChance as float)
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
    }
    else
    {
        //EnderIO SAG Mill
        var outputArray = [output] as crafttweaker.item.IItemStack[];
        var chanceArray = [1.0] as float[];
        mods.enderio.SagMill.addRecipe(outputArray, chanceArray, input, "MULTIPLY_OUTPUT", energyCost);

        //Thermal Expansion Pulverizer
        mods.thermalexpansion.Pulverizer.addRecipe(output, input.items[0], energyCost);
    }

    //Mekanism Crusher
    mods.mekanism.crusher.addRecipe(input, output);
}

function addCrushingRecipe(output as crafttweaker.item.IItemStack, input as crafttweaker.item.IIngredient, energyCost as int)
{
    addCrushingRecipeWithSecondary(output, input, energyCost, <minecraft:bedrock>, 0.0f);
}
