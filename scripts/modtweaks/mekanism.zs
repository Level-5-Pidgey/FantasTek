
print("~~~ Begin Mekanism Init ~~~");

//Disable Chemical Dissolution Chamber
mods.mekanism.chemical.dissolution.removeAllRecipes();
mods.jei.JEI.hideCategory("mekanism.chemicaldissolutionchamber");
scripts.helpers.unstageAndHide(<mekanism:machineblock2:6>);

//Add back some Chemical Injection Chamber Recipes
mods.mekanism.chemical.injection.addRecipe(<minecraft:dirt>, <gas:hydrogenchloride> * 200, <minecraft:clay>);
mods.mekanism.chemical.injection.addRecipe(<minecraft:gunpowder>, <gas:hydrogenchloride> * 200, <magneticraft:crafting>);

//Add back some purification chamber recipes
mods.mekanism.purification.addRecipe(<minecraft:gravel>, <gas:oxygen>, <minecraft:flint>);

//Reduce Paxel Durability
val MekanismPaxels = [
	<mekanismtools:woodpaxel>,
	<mekanismtools:stonepaxel>,
	<mekanismtools:ironpaxel>,
	<mekanismtools:diamondpaxel>,
	<mekanismtools:goldpaxel>,
	<mekanismtools:glowstonepaxel>,
	<mekanismtools:bronzepaxel>,
	<mekanismtools:osmiumpaxel>,
	<mekanismtools:obsidianpaxel>,
	<mekanismtools:lapislazulipaxel>,
	<mekanismtools:steelpaxel>
] as crafttweaker.item.IItemStack[];

for paxel in MekanismPaxels
{
	paxel.maxDamage = paxel.maxDamage * 2 / 3;
	scripts.helpers.AddTooltip(paxel, ["Paxels are usable as a Pickaxe, Shovel", "and Axe at once, but have a 33% durability penalty."]);
}

//Remove souped-up rail recipe.
recipes.removeByRecipeName("mekanism:rail");

//Create Salt from White Sand
mods.inworldcrafting.FluidToItem.transform(<mekanism:saltblock>, <liquid:astralsorcery.liquidstarlight>, [<biomesoplenty:white_sand>], false);
mods.botania.PureDaisy.addRecipe(<biomesoplenty:white_sand>, <mekanism:saltblock>);
mods.bloodmagic.BloodAltar.addRecipe(<biomesoplenty:white_sand>, <mekanism:saltblock>, 0, 50, 25, 25);
scripts.mmhelper.AddEmberAssemblyRecipe(scripts.helpers.createRecipeName(<mekanism:saltblock>), <mekanism:saltblock>, [<biomesoplenty:white_sand>], 10);
mods.thaumcraft.Crucible.registerRecipe(scripts.helpers.createRecipeName(<mekanism:saltblock>), "FIRSTSTEPS", <mekanism:saltblock>, <biomesoplenty:white_sand>, [<aspect:aer>]);

//Grind Salt blocks into salt items
mods.appliedenergistics2.Grinder.addRecipe(<mekanism:salt> * 2, <mekanism:saltblock>, 3);

//Remove Mekanism Paper Recipe
recipes.removeByRecipeName("mekanism:paper");

print("### Mekanism Init Complete ###");
