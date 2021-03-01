
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
for circuit in scripts.helpers.CircuitTiers[0].items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <mekanism:energycube>.withTag({tier: 0}), [[<ore:plateCrudeSteel>, <magneticraft:battery_item_medium>, <ore:plateCrudeSteel>], [<ore:ingotRedstoneAlloy>, circuit, <ore:ingotRedstoneAlloy>], [<ore:plateCrudeSteel>, <magneticraft:battery_item_medium>, <ore:plateCrudeSteel>]]);
	mods.extendedcrafting.TableCrafting.addShaped(0, <mekanism:energycube>.withTag({tier: 0}), [[<ore:plateSteel>, <magneticraft:battery_item_medium>, <ore:plateSteel>], [<ore:ingotRedstoneAlloy>, circuit, <ore:ingotRedstoneAlloy>], [<ore:plateSteel>, <magneticraft:battery_item_medium>, <ore:plateSteel>]]);
}

//Remove Crafting Recipes from Mekanism Storage Blocks
val MekanismUtilityBlocks = [
	<mekanism:machineblock2:11>.withTag({tier: 0}),
	<mekanism:machineblock2:11>.withTag({tier: 1}),
	<mekanism:machineblock2:11>.withTag({tier: 2}),
	<mekanism:machineblock2:11>.withTag({tier: 3}),
	<mekanism:machineblock2:11>.withTag({tier: 4}),
	<mekanism:energycube>.withTag({tier: 1}),
	<mekanism:energycube>.withTag({tier: 2}),
	<mekanism:energycube>.withTag({tier: 3}),
	<mekanism:energycube>.withTag({tier: 4}),
	<mekanism:basicblock:6>.withTag({tier: 0}),
	<mekanism:basicblock:6>.withTag({tier: 1}),
	<mekanism:basicblock:6>.withTag({tier: 2}),
	<mekanism:basicblock:6>.withTag({tier: 3}),
	<mekanism:basicblock:6>.withTag({tier: 4}),
	<mekanism:machineblock:13>,
] as crafttweaker.item.IItemStack[];

for block in MekanismUtilityBlocks
{
	recipes.remove(block);
	scripts.helpers.AddTooltip(block, ["Uncraftable.", "Try using alternatives in other mods!"]);
}

//Tier 1 Circuit Crafting
mods.mekanism.infuser.removeRecipe(scripts.helpers.CircuitTiers[1]);
mods.extendedcrafting.CombinationCrafting.addRecipe(scripts.helpers.CircuitTiers[1], 250000, 12500, <projectred-core:resource_item:301>, [<ore:ingotElectrum>, <ore:dustRedstone>, <ore:ingotElectrum>, <ore:dustRedstone>]);
mods.extendedcrafting.CombinationCrafting.addRecipe(scripts.helpers.CircuitTiers[1] * 9, 250000, 8000, <libvulpes:productboule:3>, [<ore:blockElectrum>, <ore:blockRedstone>, <ore:blockElectrum>, <ore:blockRedstone>]);
mods.extendedcrafting.CombinationCrafting.addRecipe(scripts.helpers.CircuitTiers[1], 100000, 12500, <ore:ingotElectrum>.firstItem, [<advancedrocketry:ic>, <advancedrocketry:ic>]);

//Metal Casing Crafting
recipes.remove(<mekanism:basicblock:8>);
mods.extendedcrafting.EnderCrafting.addShaped(<mekanism:basicblock:8>, [[<ore:plateSteel>, <ore:ingotBrass>, <ore:plateSteel>], [<ore:ingotBrass>, null, <ore:ingotBrass>], [<ore:plateSteel>, <ore:ingotBrass>, <ore:plateSteel>]], 60);

print("### Mekanism Init Complete ###");
