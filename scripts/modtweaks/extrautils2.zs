
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
recipes.remove(<extrautils2:ineffableglass:2>);
recipes.remove(<extrautils2:ineffableglass>);
recipes.addShaped(scripts.helpers.createRecipeName(<extrautils2:ineffableglass:2>), <extrautils2:ineffableglass:2> * 16, [[<ore:blockGlassColourless>, <ore:blockGlassColourless>, <ore:blockGlassColourless>], [<ore:blockGlassColourless>, <ore:ingotUnstable>, <ore:blockGlassColourless>], [<ore:blockGlassColourless>, <ore:blockGlassColourless>, <ore:blockGlassColourless>]]);
recipes.addShaped(scripts.helpers.createRecipeName(<extrautils2:ineffableglass>), <extrautils2:ineffableglass:2> * 16, [[<ore:blockGlassColourless>, <ore:blockGlassColourless>, <ore:blockGlassColourless>], [<ore:blockGlassColourless>, <ore:ingotUnstable>, <ore:blockGlassColourless>], [<ore:blockGlassColourless>, <ore:blockGlassColourless>, <ore:blockGlassColourless>]]);


print("### Extrautils2 Init Complete ###");
