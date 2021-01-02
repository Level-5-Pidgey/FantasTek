
print("~~~ Begin DeepMobLearning Init ~~~");

//Change Durability of Glitch Armour
val GlitchEquipment = [
    <deepmoblearning:glitch_infused_helmet>,
    <deepmoblearning:glitch_infused_chestplate>,
    <deepmoblearning:glitch_infused_leggings>,
    <deepmoblearning:glitch_infused_boots>,
    <deepmoblearning:glitch_infused_sword>,
] as crafttweaker.item.IItemStack[];

for equipmentItem in GlitchEquipment
{
	equipmentItem.maxDamage = (equipmentItem.maxDamage * 4) / 10;
}

print("### DeepMobLearning Init Complete ###");
