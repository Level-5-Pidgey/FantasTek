
print("~~~ Begin Industrial Foregoing Init ~~~");

//Remove Ore Washing Factory
mods.jei.JEI.hideCategory("ORE_WASHER");
scripts.helpers.unstageAndHide(<industrialforegoing:ore_washer>);

//Extended Crafting Recipes (T2 Table)
val industrialforegoing_EXTENDEDCRAFTING_T2 = {
	 //<advancedrocketry:arcfurnace>	:	[[<ore:ingotBrickNether>, <tconstruct:materials:2>, <ore:ingotBrickNether>],
	 //									[<tconstruct:materials:2>, scripts.helpers.CircuitTiers[0], <tconstruct:materials:2>],
	 //									[<ore:ingotBrickNether>, <ore:plateCopper>, <ore:ingotBrickNether>],
	 //									[null, <tconstruct:materials:2>, <ore:ingotBrickNether>]],
	 <industrialforegoing:water_resources_collector>
	 								:	[[null, <minecraft:fishing_rod>, null],
										[<ore:barsIron>, scripts.helpers.FrameTiers[0], <ore:barsIron>],
										[<ore:gearIron>, <ore:dustRedstone>, <ore:gearIron>],
	 									[<thermalfoundation:bait:1>, <ore:plateSilver>, <thermalfoundation:bait:1>]],
	 <industrialforegoing:tree_fluid_extractor>
	 								:	[[<ore:stone>, scripts.helpers.MotorTiers[0], <ore:stone>],
										[<ore:stone>, scripts.helpers.FrameTiers[1], <ore:stone>],
										[<ore:stone>, <ore:gearSteel>, <ore:stone>],
	 									[null, null, <ore:ingotSteel>]],
	 <industrialforegoing:latex_processing_unit>
	 								:	[[<ore:ingotIron>, scripts.helpers.MotorTiers[0], <ore:ingotIron>],
										[null, scripts.helpers.FrameTiers[1], null],
										[<ore:ingotIron>, <ore:gearRedstoneAlloy>, <ore:ingotIron>],
	 									[null, <ore:ingotNickel>, <ore:plateNickel>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in industrialforegoing_EXTENDEDCRAFTING_T2 {
	recipes.remove(key.withAmount(1));
	scripts.helpers.createAdvancedCraftingRecipe(key, value, value[3][0], value[3][1], value[3][2], "", true);
}

//Upgrade Aquatic Entangler to Resources Fisher
mods.extendedcrafting.TableCrafting.addShaped(0, <industrialforegoing:water_resources_collector>, [[<ore:plateSilver>, <thermalfoundation:bait:1>, <ore:plateSilver>], [<thermalfoundation:bait:1>, <thermalexpansion:device:4>, <thermalfoundation:bait:1>], [<ore:plateSilver>, <thermalfoundation:bait:1>, <ore:plateSilver>]]);

print("### Industrial Foregoing Init Complete ###");
