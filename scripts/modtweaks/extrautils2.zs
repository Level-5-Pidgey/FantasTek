
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
recipes.addShaped(scripts.helpers.createRecipeName(<extrautils2:ineffableglass:2>), <extrautils2:ineffableglass:2> * 8, [[<ore:blockGlassColorless>, <ore:blockGlassColorless>, <ore:blockGlassColorless>], [<ore:blockGlassColorless>, <ore:ingotUnstable>, <ore:blockGlassColorless>], [<ore:blockGlassColorless>, <ore:blockGlassColorless>, <ore:blockGlassColorless>]]);
recipes.addShaped(scripts.helpers.createRecipeName(<extrautils2:ineffableglass>), <extrautils2:ineffableglass:2> * 8, [[<extrautils2:decorativeglass>, <extrautils2:decorativeglass>, <extrautils2:decorativeglass>], [<extrautils2:decorativeglass>, <ore:ingotUnstable>, <extrautils2:decorativeglass>], [<extrautils2:decorativeglass>, <extrautils2:decorativeglass>, <extrautils2:decorativeglass>]]);


print("### Extrautils2 Init Complete ###");
