
print("~~~ Begin Biomes O Plenty Init ~~~");

//Remove kinda-op Ash Recipes.
recipes.removeByRecipeName("biomesoplenty:gray_dye_from_ash");
recipes.removeByRecipeName("biomesoplenty:coal_from_ash");

//Add Ash to oredict.
<ore:dustAsh>.add(<biomesoplenty:ash>);
print("### Biomes O Plenty Init Complete ###");
