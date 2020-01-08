
//Function for adding tooltips to items
function AddTooltip(item as crafttweaker.item.IItemStack, lines as crafttweaker.formatting.IFormattedText[]) {
    item.addTooltip(format.green("|| R.E.E.D. I.T. Advice ||"));
    for line in lines {
        item.addTooltip(format.white(line));
    }
}

static BotaniaT1Runes as crafttweaker.item.IIngredient = <ore:runeWaterB>.firstItem | <ore:runeFireB>.firstItem | <ore:runeEarthB>.firstItem | <ore:runeAirB>.firstItem;

static AstralT1Crystals as crafttweaker.item.IIngredient = <contenttweaker:astral_crystal_air> | <contenttweaker:astral_crystal_fire> | <contenttweaker:astral_crystal_water> | <contenttweaker:astral_crystal_earth>;
