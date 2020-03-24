
print("~~~ Begin Blood Magic Init ~~~");

//Make T1 Slates require Marble Rather than
mods.bloodmagic.BloodAltar.removeRecipe(<minecraft:stone>);
for ore in <ore:blockMarble>.items
{
  mods.bloodmagic.BloodAltar.addRecipe(<bloodmagic:slate>, ore, 0, 1000, 25, 15);
}

print("### Blood Magic Init Complete ###");
