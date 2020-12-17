#priority 499
#loader contenttweaker
import mods.contenttweaker.tconstruct.MaterialBuilder;

print("~~~ Begin TConstruct Custom Material Creator Init ~~~");

//New Traits
val nuclearTrait = mods.contenttweaker.tconstruct.TraitBuilder.create("nuclear");
nuclearTrait.color = 0x42a120;
nuclearTrait.maxLevel = 4;
nuclearTrait.countPerLevel = 1;
nuclearTrait.localizedName = "Nuclear";
nuclearTrait.localizedDescription = "Living mobs are given a strong wither effect on hit.";
nuclearTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
	if(wasHit)
	{
		if(!target.isUndead)
		{
			//If the target is not an undead monster, give it a wither effect.
			target.addPotionEffect(<potion:minecraft:wither>.makePotionEffect(100, 2));
		}
	}
};
nuclearTrait.register();

val nanoscarabTrait = mods.contenttweaker.tconstruct.TraitBuilder.create("nanoscarab");
nanoscarabTrait.color = 0x42a120;
nanoscarabTrait.maxLevel = 3;
nanoscarabTrait.countPerLevel = 1;
nanoscarabTrait.localizedName = "Nanoscarab";
nanoscarabTrait.localizedDescription = "Heals for damage dealt when a critical strike is made.";
nanoscarabTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
	if(wasHit && wasCritical)
	{
		attacker.heal(damageDealt);
	}
};
nanoscarabTrait.register();

val bloodLettingTrait = mods.contenttweaker.tconstruct.TraitBuilder.create("bloodletting");
bloodLettingTrait.color = 0xbf081d;
bloodLettingTrait.maxLevel = 3;
bloodLettingTrait.countPerLevel = 1;
bloodLettingTrait.localizedName = "Bloodletting";
bloodLettingTrait.localizedDescription = "Critical hits heal you instead of dealing extra damage.";
bloodLettingTrait.addItem(<contenttweaker:sanguine_ingot>, 5, 1);
bloodLettingTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
	if(isCritical)
	{
		//Heal the target the difference they would take if it was a crit
		var critlessDamage as int = (originalDamage / 1.5f);

		//Heal the player based on the level of the skill
		attacker.heal(trait.getData(tool).level * 2);

		return critlessDamage;
	}
};
bloodLettingTrait.afterHit = function(trait, tool, attacker, target, damageDealt, wasCritical, wasHit) {
	if(wasHit && wasCritical)
	{
		attacker.heal(trait.getData(tool).level * 2);
	}
};
bloodLettingTrait.register();

val netherwarriorTrait = mods.contenttweaker.tconstruct.TraitBuilder.create("netherwarrior");
netherwarriorTrait.color = 0x8f776e;
netherwarriorTrait.maxLevel = 1;
netherwarriorTrait.countPerLevel = 1;
netherwarriorTrait.localizedName = "Blessing of the Bastion";
netherwarriorTrait.localizedDescription = "Drastically increases in strength whilst in the nether.";
netherwarriorTrait.calcDamage = function(trait, tool, attacker, target, originalDamage, newDamage, isCritical) {
	if(target.getDimension() == -1)
	{
		//If the target is in the nether, double the damage dealt
		var buffedDamage as int = (originalDamage * 2);

		return buffedDamage;
	}
};
netherwarriorTrait.onPlayerHurt = function(trait, tool, player, attacker, event) {
	if(player.getDimension() == -1 && event.amount >= 6)
	{
		player.addPotionEffect(<potion:minecraft:regeneration>.makePotionEffect(20, 5));
		player.addPotionEffect(<potion:minecraft:swiftness>.makePotionEffect(20, 2));
	}
};
netherwarriorTrait.register();

//New Materials
//Yellorium
val yelloriumMat = mods.contenttweaker.tconstruct.MaterialBuilder.create("yellorium");
yelloriumMat.color = 0xcff73e;
yelloriumMat.craftable = true;
yelloriumMat.liquid = <liquid:yellorium>;
yelloriumMat.representativeItem = <item:contenttweaker:material_part:606>;
yelloriumMat.addHeadMaterialStats(800 /*Durability*/, 5.0f /*MiningSpeed*/, 7.5f /*AttackDamage*/, 4 /*HarvestLevel*/);
yelloriumMat.addHandleMaterialStats(1.4f /*Modifier*/, -200 /*Durability*/);
yelloriumMat.addExtraMaterialStats(-200 /*Durability*/);
yelloriumMat.addBowMaterialStats(1.08f /*DrawSpeed*/, 0.88f /*RangeMult*/, 8.0f /*BnusDmg*/);
yelloriumMat.addMaterialTrait("nuclear", null);
yelloriumMat.localizedName = "Yellorium";
yelloriumMat.register();

//Necrodermis
val necrodermisMat = mods.contenttweaker.tconstruct.MaterialBuilder.create("necrodermis");
necrodermisMat.color = 0x15bf20;
necrodermisMat.craftable = true;
necrodermisMat.liquid = <liquid:necrodermis>;
necrodermisMat.representativeItem = <item:contenttweaker:material_part:616>;
necrodermisMat.addHeadMaterialStats(900 /*Durability*/, 8.5f /*MiningSpeed*/, 12.0f /*AttackDamage*/, 5 /*HarvestLevel*/);
necrodermisMat.addHandleMaterialStats(1.1f /*Modifier*/, 400 /*Durability*/);
necrodermisMat.addExtraMaterialStats(-500 /*Durability*/);
necrodermisMat.addBowMaterialStats(6.0f /*DrawSpeed*/, 2.5f /*RangeMult*/, 14.0f /*BnusDmg*/);
necrodermisMat.addMaterialTrait("nanoscarab", "head");
necrodermisMat.addMaterialTrait("nanoscarab", "extra");
necrodermisMat.addMaterialTrait("unnatural", null);
necrodermisMat.localizedName = "Necrodermis";
necrodermisMat.register();

//Netherite
val netheriteMat = mods.contenttweaker.tconstruct.MaterialBuilder.create("netherite");
netheriteMat.color = 0x423d3a;
netheriteMat.craftable = true;
netheriteMat.liquid = <liquid:netherite>;
netheriteMat.representativeItem = <futuremc:netherite_ingot>;
netheriteMat.addHeadMaterialStats(1050 /*Durability*/, 7.5f /*MiningSpeed*/, 9.5f /*AttackDamage*/, 5 /*HarvestLevel*/);
netheriteMat.addHandleMaterialStats(0.5f /*Modifier*/, 10 /*Durability*/);
netheriteMat.addExtraMaterialStats(100 /*Durability*/);
netheriteMat.addBowMaterialStats(1.75f /*DrawSpeed*/, 1.4f /*RangeMult*/, 6.0f /*BnusDmg*/);
netheriteMat.addMaterialTrait("netherwarrior", "head");
netheriteMat.addMaterialTrait("simmering", "extra");
netheriteMat.addMaterialTrait("writable", null);
netheriteMat.localizedName = "Necrodermis";
netheriteMat.register();

print("### TConstruct Custom Material Creator Init Complete ###");
