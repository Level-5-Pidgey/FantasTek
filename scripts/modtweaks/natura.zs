
print("~~~ Begin Natura Init ~~~");

//Add Tooltips for various blocks to explain their uses
var quarkTooltips =
{
	<natura:nether_glass> : ["Works the same was as Ineffable glass.", "Mobs cannot walk through it, but players can (with a slowness penalty)"],
} as string[][crafttweaker.item.IItemStack];

for item, textArray in quarkTooltips
{
	scripts.helpers.AddTooltip(item, textArray);
}

//Make new recipe for Soul Glass
recipes.addShaped(scripts.helpers.createRecipeName(<natura:nether_glass>), <natura:nether_glass> * 8, [
	[<ore:blockGlassWhite>, <ore:blockGlassWhite>, <ore:blockGlassWhite>],
	[<ore:blockGlassWhite>, <embers:archaic_brick>, <ore:blockGlassWhite>],
	[<ore:blockGlassWhite>, <ore:blockGlassWhite>, <ore:blockGlassWhite>]
]);

//Remove Sulfur -> Gunpowder
recipes.removeByRecipeName("natura:common/gunpowder");

print("### Natura Init Complete ###");
