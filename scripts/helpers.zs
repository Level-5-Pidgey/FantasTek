
//Function for adding tooltips to items
function AddTooltip(item as crafttweaker.item.IItemStack, lines as crafttweaker.formatting.IFormattedText[]) {
    item.addTooltip(format.green("|| R.E.E.D. I.T. Advice ||"));
    for line in lines {
        item.addTooltip(format.white(line));
    }
}

function GetAstralCraftingMaterials(tier as int) as crafttweaker.item.IIngredient
{
	var IngredientToReturn = null;
	if(tier == 1)
	{
		IngredientToReturn = <contenttweaker:astral_crystal_air> | <contenttweaker:astral_crystal_fire> | <contenttweaker:astral_crystal_water> | <contenttweaker:astral_crystal_earth>;
	}

	return IngredientToReturn;
}

function GetBotaniaCraftingMaterials(tier as int) as crafttweaker.item.IIngredient
{
	var IngredientToReturn = null;
	if(tier == 1)
	{
		IngredientToReturn = <ore:runeWaterB>.firstItem | <ore:runeFireB>.firstItem | <ore:runeEarthB>.firstItem | <ore:runeAirB>.firstItem;
	}

	return IngredientToReturn;
}
