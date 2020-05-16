
print("~~~ Begin Random Things Init ~~~");

//Make these Specified Items Shop-Only
val shopItems =
[
  <randomthings:onlinedetector>,
  <randomthings:chatdetector>,
  <randomthings:enderbridge>,
  <randomthings:blockdestabilizer>,
  <randomthings:soundbox>,
  <randomthings:sounddampener>,
  <randomthings:globalchatdetector>,
  <randomthings:contactbutton>,
  <randomthings:contactlever>,
  <randomthings:rainshield>,
  <randomthings:potionvaporizer>,
  <randomthings:advancedredstonerepeater>,
  <randomthings:advancedredstonetorch_on>,
  <randomthings:basicredstoneinterface>,
  <randomthings:advancedredstoneinterface>,
  <randomthings:sidedredstone>,
  <randomthings:portablesounddampener>,
  <randomthings:redstoneremote>,
  <randomthings:chunkanalyzer>,
  <randomthings:notificationinterface>,
  <randomthings:enderanchor>,
  <randomthings:spectrelens>,
  <randomthings:soundrecorder>,
  <randomthings:soundpattern>
] as crafttweaker.item.IItemStack[];

for item in shopItems
{
	recipes.remove(item);
	scripts.helpers.AddTooltip(item, ["Cannot be crafted.", "Purchasable from various villagers."]);
}

print("### Random Things Init Complete ###");
