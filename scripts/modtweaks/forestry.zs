print("~~~ Begin Forestry Init ~~~");

//Add Log Pile to an OreDict for the Coke Oven
<ore:logPile>.add(<forestry:wood_pile>);

//Remove Existing Compartment Recipes
val ForestryCompartments = [
  <binniecore:storage>,
  <binniecore:storage:1>,
  <binniecore:storage:2>,
  <binniecore:storage:3>,
  <binniecore:storage:4>,
  <binniecore:storage:5>
] as crafttweaker.item.IItemStack[];

for compartment in ForestryCompartments
{
  recipes.remove(compartment);
}

//Add New Compartment Recipes back in
//Wooden
recipes.addShaped("compartment_wood", <binniecore:storage>, [[<ore:plateIron>, <ore:chest>, <ore:plateIron>], [<ore:chest>, <ore:gearStone>, <ore:chest>], [<ore:plateIron>, <ore:chest>, <ore:plateIron>]]);
//Iron
recipes.addShaped("compartment_iron", <binniecore:storage:3>, [[<ore:ingotGold>, <ore:plateIron>, <ore:ingotGold>], [<ore:plateIron>, <binniecore:storage>, <ore:plateIron>], [<ore:ingotGold>, <ore:plateIron>, <ore:ingotGold>]]);
//Gold
recipes.addShaped("compartment_gold", <binniecore:storage:4>, [[<ore:gearIron>, <ore:plateGold>, <ore:gearIron>], [<ore:plateGold>, <binniecore:storage:3>, <ore:plateGold>], [<ore:gearIron>, <ore:plateGold>, <ore:gearIron>]]);
//Diamond
recipes.addShaped("compartment_diamond", <binniecore:storage:5>, [[<ore:gearEmerald>, <ore:plateDiamond>, <ore:gearEmerald>], [<ore:plateDiamond>, <binniecore:storage:4>, <ore:plateDiamond>], [<ore:gearEmerald>, <ore:plateDiamond>, <ore:gearEmerald>]]);
//Copper
recipes.addShaped("compartment_copper", <binniecore:storage:1>, [[<ore:dustRedstone>, <ore:gearCopper>, <ore:dustRedstone>], [<ore:gearCopper>, <binniecore:storage>, <ore:gearCopper>], [<ore:dustRedstone>, <ore:gearCopper>, <ore:dustRedstone>]]);
//Bronze
recipes.addShaped("compartment_bronze", <binniecore:storage:2>, [[<ore:plateWood>, <ore:plateBronze>, <ore:plateWood>], [<ore:plateBronze>, <binniecore:storage:1>, <ore:plateBronze>], [<ore:plateWood>, <ore:plateBronze>, <ore:plateWood>]]);

print("### Forestry Init Complete ###");
