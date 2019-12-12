#priority 99
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
			target.addPotionEffect(<potion:minecraft:wither>.makePotionEffect(3, 5));
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
	if(wasHit & wasCritical)
	{
		attacker.heal(damageDealt);
	}
};
nanoscarabTrait.register();

//New Materials
//Yellorium
val yelloriumMat = mods.contenttweaker.tconstruct.MaterialBuilder.create("yellorium");
yelloriumMat.color = 0xcff73e;
yelloriumMat.craftable = true;
yelloriumMat.addItem(<item:contenttweaker:material_part:606>);
yelloriumMat.addItem(<item:jaopca:block_blockyellorium>, 1, 9);
yelloriumMat.liquid = <liquid:yellorium>;
yelloriumMat.representativeItem = <item:contenttweaker:material_part:606>;
yelloriumMat.addHeadMaterialStats(800 /*Durability*/, 5.0f /*MiningSpeed*/, 7.5f /*AttackDamage*/, 4 /*HarvestLevel*/);
yelloriumMat.addHandleMaterialStats(1.4f /*Modifier*/, -200 /*Durability*/);
yelloriumMat.addExtraMaterialStats(-200 /*Durability*/);
yelloriumMat.addBowMaterialStats(1.08f /*DrawSpeed*/, 0.88f /*RangeMult*/, 8.0f /*BnusDmg*/);
yelloriumMat.addMaterialTrait("nuclear", null);
yelloriumMat.localizedName = "Yellorium";
yelloriumMat.register();

val necrodermisMat = mods.contenttweaker.tconstruct.MaterialBuilder.create("necrodermis");
necrodermisMat.color = 0x15bf20;
necrodermisMat.craftable = true;
necrodermisMat.addItem(<item:contenttweaker:material_part:616>);
necrodermisMat.addItem(<item:jaopca:block_blocknecrodermis>, 1, 9);
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

print("### TConstruct Custom Material Creator Init Complete ###");
