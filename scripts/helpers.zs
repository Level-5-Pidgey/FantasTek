
//Function for adding tooltips to items
function AddTooltip(item as crafttweaker.item.IItemStack, lines as crafttweaker.formatting.IFormattedText[]) {
    item.addTooltip(format.green("|| R.E.E.D. I.T. Advice ||"));
    for line in lines {
        item.addTooltip(format.white(line));
    }
}

//Function for IIngredient return of all Astral Sorcery T1 Items (for normal crafting bench recipes)
function GetAstralCraftingMaterials(tier as int) as crafttweaker.item.IIngredient
{
	var IngredientToReturn = null;
	if(tier == 1)
	{
		IngredientToReturn = <contenttweaker:astral_crystal_air> | <contenttweaker:astral_crystal_fire> | <contenttweaker:astral_crystal_water> | <contenttweaker:astral_crystal_earth>;
	}

	return IngredientToReturn;
}

//Function for IIngredient return of all Botania T1 Items (for normal crafting bench recipes)
function GetBotaniaCraftingMaterials(tier as int) as crafttweaker.item.IIngredient
{
	var IngredientToReturn = null;
	if(tier == 1)
	{
		IngredientToReturn = <ore:runeWaterB>.firstItem | <ore:runeFireB>.firstItem | <ore:runeEarthB>.firstItem | <ore:runeAirB>.firstItem;
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
<contenttweaker:astral_crystal_earth>
];

//Variable for all T1 Fire Element Items (for extended crafting recipes)
static AllFireT1Items as crafttweaker.item.IItemStack[] =
[
  <contenttweaker:astral_crystal_fire>,
  <ore:runeFireB>.firstItem
];
