
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
scripts.mmhelper.AddEmberAssemblyRecipe(scripts.helpers.createRecipeName(<mekanism:saltblock>), <mekanism:saltblock>, [<biomesoplenty:white_sand>], 200);
mods.thaumcraft.Crucible.registerRecipe(scripts.helpers.createRecipeName(<mekanism:saltblock>), "FIRSTSTEPS", <mekanism:saltblock>, <biomesoplenty:white_sand>, [<aspect:aer>]);

//Grind Salt blocks into salt items
mods.appliedenergistics2.Grinder.addRecipe(<mekanism:salt> * 2, <mekanism:saltblock>, 3);

//Remove Mekanism Paper Recipe
recipes.removeByRecipeName("mekanism:paper");

//Basic Energy Cube
recipes.remove(<mekanism:energycube>.withTag({tier: 0}));
for circuit in scripts.helpers.CircuitTiers[1].items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <mekanism:energycube>.withTag({tier: 0}), [[<ore:plateCrudeSteel>, <magneticraft:battery_item_medium>, <ore:plateCrudeSteel>], [<ore:ingotRedstoneAlloy>, circuit, <ore:ingotRedstoneAlloy>], [<ore:plateCrudeSteel>, <magneticraft:battery_item_medium>, <ore:plateCrudeSteel>]]);
	mods.extendedcrafting.TableCrafting.addShaped(0, <mekanism:energycube>.withTag({tier: 0}), [[<ore:plateSteel>, <magneticraft:battery_item_medium>, <ore:plateSteel>], [<ore:ingotRedstoneAlloy>, circuit, <ore:ingotRedstoneAlloy>], [<ore:plateSteel>, <magneticraft:battery_item_medium>, <ore:plateSteel>]]);
}

//Create Basic Bins
recipes.remove(<mekanism:basicblock:6>.withTag({tier: 0}));
scripts.helpers.AddTooltip(<mekanism:basicblock:6>.withTag({tier: 0}), ["Stores 3456 of one item within", "Can hold a double chest's worth of blocks in one space, basically!"]);
mods.extendedcrafting.TableCrafting.addShaped(0, <mekanism:basicblock:6>.withTag({tier: 0}), [[<ore:stone>, <advancedrocketry:ic>, <ore:stone>], [<ore:gearRedstoneAlloy>, <ore:shulkerShell>, <ore:gearRedstoneAlloy>], [<ore:stone>, <ore:stone>, <ore:stone>]]);

//Create Basic Fluid Tanks
recipes.remove(<mekanism:machineblock2:11>.withTag({tier: 0}));
mods.extendedcrafting.TableCrafting.addShaped(0, <mekanism:machineblock2:11>.withTag({tier: 0}), [[<ore:blockGlassColorless>, <ore:ingotGold>, <ore:blockGlassColorless>], [<ore:plateCrudeSteel>, null, <ore:plateCrudeSteel>], [<ore:blockGlassColorless>, <ore:ingotGold>, <ore:blockGlassColorless>]]);
mods.extendedcrafting.TableCrafting.addShaped(0, <mekanism:machineblock2:11>.withTag({tier: 0}), [[<ore:blockGlassColorless>, <ore:ingotGold>, <ore:blockGlassColorless>], [<ore:plateSteel>, null, <ore:plateSteel>], [<ore:blockGlassColorless>, <ore:ingotGold>, <ore:blockGlassColorless>]]);

print("### Mekanism Init Complete ###");
