import mods.zensummoning.SummoningDirector;
import mods.zensummoning.SummoningAttempt;
import mods.zensummoning.SummoningInfo;
import mods.zensummoning.MobInfo;

print("~~~ Begin ZenSummoning Init ~~~");

//Ferrous Wroghtnaut Boss
SummoningDirector.addSummonInfo(
    SummoningInfo.create()
        .setCatalyst(<minecraft:diamond_sword>)
        .setReagents([<ore:plateSteel>.firstItem, <ore:plateSteel>.firstItem, <ore:plateSteel>.firstItem, <ore:plateSteel>.firstItem])
        .addMob(MobInfo.create()
            .setMob("mowziesmobs:ferrous_wroughtnaut")
            .setData({
				"Health": 60,
				"Attributes": [
					{"Name":"generic.maxHealth","Base":60}
				],
				"CustomName":"Steel Titan",
				"CustomNameVisible":1
			})
        )
);

print("### ZenSummoning Init Complete ###");
