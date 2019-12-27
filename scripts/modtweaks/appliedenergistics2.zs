print("~~~ Begin AE2 Init ~~~");

//Make Silicon smelt into an ingot
furnace.addRecipe(<libvulpes:productingot:3>, <ore:itemSilicon>, 0.0);

//Quartz Grindstone Recipes
val grindstoneOres =
[
  <thermalfoundation:ore>,
  <embers:ore_copper>,
  <embers:ore_lead>,
  <thermalfoundation:ore:2>,
  <embers:ore_nickel>,
  <iceandfire:silver_ore>,
  <embers:ore_aluminum>,
  <libvulpes:ore0:9>,
  <embers:ore_silver>,
  <magneticraft:ores>,
  <thermalfoundation:ore:1>,
  <minecraft:iron_ore>,
  <thermalfoundation:ore:4>,
  <magneticraft:ores:1>,
  <tconstruct:ore:1>,
  <forestry:resources:2>,
  <thermalfoundation:ore:3>,
  <minecraft:gold_ore>,
  <embers:ore_tin>,
  <contenttweaker:sub_block_holder_12:6>,
  <mekanism:oreblock:2>,
  <forestry:resources:1>,
  <minecraft:coal_ore>,
  <libvulpes:ore0:5>,
  <mekanism:oreblock:1>,
  <appliedenergistics2:charged_quartz_ore>,
  <thermalfoundation:ore:6>,
  <thermalfoundation:ore:5>,
  <contenttweaker:sub_block_holder_10:10>,
  <libvulpes:ore0:4>,
  <mekanism:oreblock>,
  <appliedenergistics2:quartz_ore>,
  <contenttweaker:sub_block_holder_11:6>,
  <minecraft:quartz_ore>
] as crafttweaker.item.IItemStack[];

for ore in grindstoneOres
{
	mods.appliedenergistics2.Grinder.removeRecipe(ore);
}

//Coal Coke Dust Crafting
//Coal Coke Item
for coalCoke in <ore:fuelCoke>.items
{
  mods.appliedenergistics2.Grinder.addRecipe(<contenttweaker:coke_dust>, coalCoke, 2);
}
//Coal Coke Block
for cokeBlock in <ore:blockFuelCoke>.items
{
  mods.appliedenergistics2.Grinder.addRecipe(<contenttweaker:coke_dust> * 9, cokeBlock, 18);
}

//Quartz Grinstone Block
recipes.remove(<appliedenergistics2:grindstone>);
recipes.addShaped("grindstone", <appliedenergistics2:grindstone>, [[<ore:cobblestone>, <ore:stickWood>, <ore:cobblestone>], [<ore:cobblestone>, <ore:plateQuartz>, <ore:cobblestone>], [<ore:cobblestone>, <ore:densePlatingIron>, <ore:cobblestone>]]);

//Grindstone Crankshaft
recipes.remove(<appliedenergistics2:crank>);
recipes.addShaped("crank", <appliedenergistics2:crank>, [[<ore:stickWood>, <ore:stickWood>, <ore:stickWood>], [<ore:stickWood>, null, null], [<ore:stickWood>, null, null]]);
recipes.addShaped("crank_alternate", <appliedenergistics2:crank>, [[<ore:stickWood>, <ore:stickWood>, <ore:stickWood>], [null, null, <ore:stickWood>], [null, null, <ore:stickWood>]]);

//Grind Obsidian for Obsidian Dust
for obsidianBlock in <ore:obsidian>.items
{
  mods.appliedenergistics2.Grinder.addRecipe(<ore:dustObsidian>.firstItem, obsidianBlock, 6);
}
print("### AE2 Init Complete ###");
