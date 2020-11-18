
print("~~~ Begin Extrautils2 Init ~~~");

//Make these Specified Items Shop-Only
val shopItems =
[
  <extrautils2:soundmuffler>
] as crafttweaker.item.IItemStack[];

for item in shopItems
{
	recipes.remove(item);
	scripts.helpers.AddTooltip(item, ["Cannot be crafted.", "Purchasable from various villagers."]);
}

//Make Ineffable Glass/Ethereal Glass require unstable ingots
recipes.remove(<extrautils2:ineffableglass:*>);
recipes.addShaped(scripts.helpers.createRecipeName(<extrautils2:ineffableglass>), <extrautils2:ineffableglass> * 8, [[<extrautils2:decorativeglass>, <extrautils2:decorativeglass>, <extrautils2:decorativeglass>], [<extrautils2:decorativeglass>, <ore:ingotUnstable>, <extrautils2:decorativeglass>], [<extrautils2:decorativeglass>, <extrautils2:decorativeglass>, <extrautils2:decorativeglass>]]); //Base Ineffable Glass
recipes.addShapeless(scripts.helpers.createRecipeName(<extrautils2:ineffableglass:1>), <extrautils2:ineffableglass:1>, [<extrautils2:ineffableglass>, <minecraft:redstone_torch>]); //Inverted Ineffable Glass
recipes.addShaped(scripts.helpers.createRecipeName(<extrautils2:ineffableglass:2>), <extrautils2:ineffableglass:2> * 8, [[<extrautils2:ineffableglass>, <extrautils2:ineffableglass>, <extrautils2:ineffableglass>], [<extrautils2:ineffableglass>, <ore:ingotUnstable>, <extrautils2:ineffableglass>], [<extrautils2:ineffableglass>, <extrautils2:ineffableglass>, <extrautils2:ineffableglass>]]); //Clear Ineffable Glass
recipes.addShaped(scripts.helpers.createRecipeName(<extrautils2:ineffableglass:3>), <extrautils2:ineffableglass:3> * 8, [[<extrautils2:ineffableglass:2>, <extrautils2:ineffableglass:2>, <extrautils2:ineffableglass:2>], [<extrautils2:ineffableglass:2>, <ore:gemMoon>, <extrautils2:ineffableglass:2>], [<extrautils2:ineffableglass:2>, <extrautils2:ineffableglass:2>, <extrautils2:ineffableglass:2>]]); //Clear Dark Ineffable Glass



//Remove the Glass Cutter and Ender Shard
scripts.helpers.unstageAndHide(<extrautils2:glasscutter>);
scripts.helpers.unstageAndHide(<extrautils2:endershard>);
recipes.remove(<extrautils2:ingredients>);

print("### Extrautils2 Init Complete ###");
