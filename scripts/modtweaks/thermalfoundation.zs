
print("~~~ Begin Thermal Foundation Init ~~~");

//Remove Manual Crafting of Blends
val alloyBlends = [
	<thermalfoundation:material:97>,
	<thermalfoundation:material:98>,
	<thermalfoundation:material:99>,
	<thermalfoundation:material:100>,
	<thermalfoundation:material:101>,
	<thermalfoundation:material:102>,
	<thermalfoundation:material:103>,
] as crafttweaker.item.IItemStack[];

for blend in alloyBlends
{
	recipes.remove(blend);
}

//Simple Recipe Changes for crafting bench
val thermalRecipes_CRAFTINGTABLE = {
	<thermalfoundation:material:657> : [[<ore:ingotIron>, <ore:ingotIron>, null], [<ore:ingotIron>, <ore:gearCrudeSteel>, <ore:ingotIron>], [null, <ore:ingotIron>, <ore:ingotIron>]],
	<thermaldynamics:duct_0> * 16 : [[<ore:dustRedstone>, <ore:paneGlassColorless> | <ore:blockGlass>, <ore:dustRedstone>], [<ore:dustElectrotine>, <ore:dustElectrotine>, <ore:dustElectrotine>], [<ore:dustRedstone>, <ore:paneGlassColorless> | <ore:blockGlass>, <ore:dustRedstone>]],
	<thermalfoundation:material:656> : [[null, <ore:ingotIron>, null], [<ore:ingotIron>, <ore:gearCrudeSteel>, <ore:ingotIron>], [<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>]],
	<thermalfoundation:wrench> : [[<ore:ingotIron>, null, <ore:ingotIron>], [null, <ore:ingotElectrotineAlloy>, null], [null, <ore:ingotIron>, null]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in thermalRecipes_CRAFTINGTABLE {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

//Item Tooltips
scripts.helpers.AddTooltip(<thermalexpansion:capacitor:*>, ["It contains 1.21 gigawatts!", "You can take this thing all sorts of places..."]);
scripts.helpers.AddTooltip(<thermalfoundation:wrench>, ["Not sure why this isn't called a wrench.", "This tooltip is purely so you can search \"wrench\" in JEI in peace.", "Thank me later."]);

//Post Stage 1 Saw Blade
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<thermalfoundation:material:657>), scripts.helpers.stages.progression2.stage, <thermalfoundation:material:657>, [[<ore:ingotIron>, <ore:ingotIron>, null], [<ore:ingotIron>, <ore:gearSteel>, <ore:ingotIron>], [null, <ore:ingotIron>, <ore:ingotIron>]]);
mods.recipestages.Recipes.addShaped(scripts.helpers.createRecipeName(<thermalfoundation:material:656>), scripts.helpers.stages.progression2.stage, <thermalfoundation:material:656>, [[null, <ore:ingotIron>, null], [<ore:ingotIron>, <ore:gearSteel>, <ore:ingotIron>], [<ore:ingotIron>, <ore:ingotIron>, <ore:ingotIron>]]);

//Aqueous Accumulator
recipes.remove(<thermalexpansion:device>);
for rune in scripts.helpers.AllWaterT1Items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <thermalexpansion:device>, [[<ore:plateIron>, rune, <ore:plateIron>], [<ore:ingotIron>, scripts.helpers.FrameTiers[0], <ore:ingotIron>], [<ore:plateIron>, <ore:ingotGold>, <ore:plateIron>]]);
}

//Factorizer
recipes.remove(<thermalexpansion:device:10>);
mods.extendedcrafting.TableCrafting.addShaped(0, <thermalexpansion:device:10>, [[null, <ore:workbench>, null], [<ore:ingotIron>, scripts.helpers.FrameTiers[0], <ore:ingotIron>], [<ore:gearGold>, <ore:dustRedstone>, <ore:gearGold>]]);

//Grind up Coal Coke into Dust
scripts.helpers.addCrushingRecipe(<contenttweaker:coke_dust>, <ore:fuelCoke>, 5000, true);

//Alloy Smelting Lumium
for tinIngot in <ore:ingotTin>.items
{
	for silverIngot in <ore:ingotSilver>.items
	{
		mods.advancedrocketry.ArcFurnace.addRecipe(<ore:ingotLumium>.firstItem * 4, 600, 2, tinIngot * 3, silverIngot, <ore:dustGlowstone>.firstItem * 4, <ore:sand>.firstItem);
	}
}

//Alloy Smelting Signalum
for copperIngot in <ore:ingotCopper>.items
{
	for silverIngot in <ore:ingotSilver>.items
	{
		mods.advancedrocketry.ArcFurnace.addRecipe(<ore:ingotSignalum>.firstItem * 4, 600, 2, copperIngot * 3, silverIngot, <ore:dustRedstone>.firstItem * 10, <ore:sand>.firstItem);
	}
}

print("### Thermal Foundation Init Complete ###");
