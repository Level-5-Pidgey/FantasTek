import mods.modularmachinery.RecipeBuilder;

print("~~~ Begin Modular Machinery Init ~~~");

//Add Coke Oven Recipes
static CokeOven as int[crafttweaker.oredict.IOreDictEntry] =
{
	<ore:gemCoal> : 1,
	<ore:blockCoal> : 9,
	<ore:logPile> : 5
};

for OreEntry, outputMulti in CokeOven
{
	if(!OreEntry.empty)
	{
		var CokeOven = RecipeBuilder.newBuilder("cokeoven_" ~ OreEntry.name, "coke_oven", 4800 * outputMulti);
		CokeOven.addItemInput(OreEntry);
		CokeOven.addFluidOutput(<liquid:creosote> * (125 * outputMulti));
		CokeOven.addItemOutput(<thermalfoundation:material:802> * outputMulti);
		CokeOven.build();
	}
}

print("### Modular Machinery Init Complete ###");
