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

//Thermal Elementals
//Blizz
SummoningDirector.addSummonInfo(
    SummoningInfo.create()
        .setCatalyst(<thermalfoundation:material:2049>)
        .setReagents([<bountifulbaubles:spectralsilt>, <bountifulbaubles:spectralsilt>, <bountifulbaubles:spectralsilt>, <bountifulbaubles:spectralsilt>])
        .addMob(MobInfo.create()
            .setMob("thermalfoundation:blizz")
            .setCount(4)
            .setOffset(0, 2, 0)
            .setSpread(4, 1, 4)
        )
);
//Basalz
SummoningDirector.addSummonInfo(
    SummoningInfo.create()
        .setCatalyst(<thermalfoundation:material:2053>)
        .setReagents([<bountifulbaubles:spectralsilt>, <bountifulbaubles:spectralsilt>, <bountifulbaubles:spectralsilt>, <bountifulbaubles:spectralsilt>])
        .addMob(MobInfo.create()
            .setMob("thermalfoundation:basalz")
            .setCount(4)
            .setOffset(0, 2, 0)
            .setSpread(4, 1, 4)
        )
);
//Blitz
SummoningDirector.addSummonInfo(
    SummoningInfo.create()
        .setCatalyst(<thermalfoundation:material:2051>)
        .setReagents([<bountifulbaubles:spectralsilt>, <bountifulbaubles:spectralsilt>, <bountifulbaubles:spectralsilt>, <bountifulbaubles:spectralsilt>])
        .addMob(MobInfo.create()
            .setMob("thermalfoundation:blitz")
            .setCount(4)
            .setOffset(0, 2, 0)
            .setSpread(4, 1, 4)
        )
);
//Blaze
SummoningDirector.addSummonInfo(
    SummoningInfo.create()
        .setCatalyst(<contenttweaker:magma_powder>)
        .setReagents([<bountifulbaubles:spectralsilt>, <bountifulbaubles:spectralsilt>, <bountifulbaubles:spectralsilt>, <bountifulbaubles:spectralsilt>])
        .addMob(MobInfo.create()
            .setMob("minecraft:blaze")
            .setCount(4)
            .setOffset(0, 2, 0)
            .setSpread(4, 1, 4)
        )
);

print("### ZenSummoning Init Complete ###");
