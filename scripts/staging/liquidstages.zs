#priority 50
import scripts.staging.stages;

print("~~~ Begin Liquid Staging ~~~");

var liquidStages as mods.zenstages.Stage[crafttweaker.liquid.ILiquidStack] =
{
	<liquid:aerotheum> : stages.Locked,
	<liquid:alchemical_redstone> : stages.Locked,
	<liquid:alubrass> : stages.Locked,
	<liquid:aluminum> : stages.Locked,
	<liquid:ardite> : stages.Locked,
	<liquid:astral_starmetal> : stages.Locked,
	<liquid:beetroot_soup> : stages.progression1,
	<liquid:biocrude> : stages.Locked,
	<liquid:biofuel> : stages.Locked,
	<liquid:biomass> : stages.Locked,
	<liquid:blockfluidantimatter> : stages.Locked,
	<liquid:blockfluiddirt> : stages.Locked,
	<liquid:blood> : stages.Locked,
	<liquid:blueslime> : stages.Locked,
	<liquid:brass> : stages.Locked,
	<liquid:brine> : stages.Locked,
	<liquid:bronze> : stages.Locked,
	<liquid:chromium> : stages.Locked,
	<liquid:clay> : stages.progression1,
	<liquid:cloud_seed> : stages.Locked,
	<liquid:cloud_seed_concentrated> : stages.Locked,
	<liquid:coal> : stages.progression1,
	<liquid:cobalt> : stages.Locked,
	<liquid:conductive_iron> : stages.progression1,
	<liquid:constantan> : stages.Locked,
	<liquid:construction_alloy> : stages.Locked,
	<liquid:copper> : stages.Locked,
	<liquid:creosote> : stages.progression1,
	<liquid:crude_oil> : stages.Locked,
	<liquid:cryotheum> : stages.Locked,
	<liquid:dark_steel> : stages.Locked,
	<liquid:dawnstone> : stages.Locked,
	<liquid:diesel> : stages.Locked,
	<liquid:dirt> : stages.progression1,
	<liquid:draconium> : stages.Locked,
	<liquid:dragonsteel_fire> : stages.Locked,
	<liquid:dragonsteel_ice> : stages.Locked,
	<liquid:electrical_steel> : stages.Locked,
	<liquid:electrum> : stages.Locked,
	<liquid:elementium> : stages.Locked,
	<liquid:emerald> : stages.progression1,
	<liquid:end_steel> : stages.Locked,
	<liquid:ender> : stages.progression1,
	<liquid:ender_distillation> : stages.Locked,
	<liquid:enderium> : stages.Locked,
	<liquid:energetic_alloy> : stages.Locked,
	<liquid:enrichedlava> : stages.Locked,
	<liquid:essence> : stages.Locked,
	<liquid:experience> : stages.Locked,
	<liquid:fire_water> : stages.Locked,
	<liquid:flux_goo> : stages.Locked,
	<liquid:fuel> : stages.Locked,
	<liquid:gasoline> : stages.Locked,
	<liquid:glass> : stages.progression1,
	<liquid:glowstone> : stages.progression1,
	<liquid:gold> : stages.progression1,
	<liquid:heavy_oil> : stages.Locked,
	<liquid:heavywater> : stages.Locked,
	<liquid:honey> : stages.progression1,
	<liquid:hootch> : stages.Locked,
	<liquid:hot_crude> : stages.Locked,
	<liquid:hot_spring_water> : stages.progression1,
	<liquid:hydrogen> : stages.Locked,
	<liquid:ice> : stages.Locked,
	<liquid:invar> : stages.Locked,
	<liquid:iridium> : stages.Locked,
	<liquid:iron> : stages.progression1,
	<liquid:juice> : stages.progression1,
	<liquid:kerosene> : stages.Locked,
	<liquid:knightslime> : stages.Locked,
	<liquid:latex> : stages.Locked,
	<liquid:lava> : stages.progression1,
	<liquid:lead> : stages.Locked,
	<liquid:lifeessence> : stages.BloodMagic1,
	<liquid:light_oil> : stages.Locked,
	<liquid:liquid_death> : stages.Thaumcraft1,
	<liquid:liquid_sunshine> : stages.Locked,
	<liquid:liquidchlorine> : stages.Locked,
	<liquid:liquiddeuterium> : stages.Locked,
	<liquid:liquidethene> : stages.Locked,
	<liquid:liquidfusionfuel> : stages.Locked,
	<liquid:liquidhydrogen> : stages.Locked,
	<liquid:liquidhydrogenchloride> : stages.Locked,
	<liquid:liquidlithium> : stages.Locked,
	<liquid:liquidoxygen> : stages.Locked,
	<liquid:liquidsodium> : stages.Locked,
	<liquid:liquidsulfurdioxide> : stages.Locked,
	<liquid:liquidsulfurtrioxide> : stages.Locked,
	<liquid:liquidtritium> : stages.Locked,
	<liquid:lpg> : stages.Locked,
	<liquid:lubricant> : stages.Locked,
	<liquid:lumium> : stages.Locked,
	<liquid:mana> : stages.Locked,
	<liquid:manasteel> : stages.Locked,
	<liquid:manyullyn> : stages.Locked,
	<liquid:meat> : stages.Locked,
	<liquid:milk> : stages.progression1,
	<liquid:mithril> : stages.Locked,
	<liquid:molten_awakened_draconium> : stages.Locked,
	<liquid:molten_black_iron> : stages.progression1,
	<liquid:molten_crude_steel> : stages.progression1,
	<liquid:molten_elemental_air_crystal> : stages.Locked,
	<liquid:molten_elemental_earth_crystal> : stages.Locked,
	<liquid:molten_elemental_fire_crystal> : stages.Locked,
	<liquid:molten_elemental_water_crystal> : stages.Locked,
	<liquid:molten_modularium> : stages.progression1,
	<liquid:molten_reinforced_pink_slime> : stages.Locked,
	<liquid:mushroom_stew> : stages.progression1,
	<liquid:naphtha> : stages.Locked,
	<liquid:natural_gas> : stages.Locked,
	<liquid:necrodermis> : stages.Locked,
	<liquid:nickel> : stages.Locked,
	<liquid:nitrogen> : stages.Locked,
	<liquid:nutrient_distillation> : stages.Locked,
	<liquid:obsidian> : stages.progression1,
	<liquid:oil> : stages.Locked,
	<liquid:oil_residue> : stages.Locked,
	<liquid:osmium> : stages.Locked,
	<liquid:oxygen> : stages.Locked,
	<liquid:petrotheum> : stages.Locked,
	<liquid:pewterfluid> : stages.Locked,
	<liquid:pigiron> : stages.progression1,
	<liquid:plastic> : stages.Locked,
	<liquid:platinum> : stages.Locked,
	<liquid:poison> : stages.progression1,
	<liquid:potato_soup> : stages.Locked,
	<liquid:potion> : stages.progression1,
	<liquid:potion_lingering> : stages.progression1,
	<liquid:potion_splash> : stages.progression1,
	<liquid:pulsating_iron> : stages.progression1,
	<liquid:purifying_fluid> : stages.Locked,
	<liquid:purpleslime> : stages.Locked,
	<liquid:pyrotheum> : stages.Locked,
	<liquid:rabbit_stew> : stages.progression1,
	<liquid:redstone> : stages.progression1,
	<liquid:redstone_alloy> : stages.progression1,
	<liquid:refined_biofuel> : stages.Locked,
	<liquid:refined_fuel> : stages.Locked,
	<liquid:refined_oil> : stages.Locked,
	<liquid:resin> : stages.Locked,
	<liquid:rocket_fuel> : stages.Locked,
	<liquid:rocketfuel> : stages.Locked,
	<liquid:sand> : stages.progression1,
	<liquid:sap> : stages.Locked,
	<liquid:seed_oil> : stages.Locked,
	<liquid:sewage> : stages.Locked,
	<liquid:signalum> : stages.Locked,
	<liquid:silver> : stages.Locked,
	<liquid:sludge> : stages.Locked,
	<liquid:soularium> : stages.Locked,
	<liquid:starmetal> : stages.Locked,
	<liquid:steam> : stages.Locked,
	<liquid:steel> : stages.progression1,
	<liquid:stone> : stages.progression1,
	<liquid:sulfuricacid> : stages.Locked,
	<liquid:syrup> : stages.Locked,
	<liquid:terrasteel> : stages.Locked,
	<liquid:thaumium> : stages.Locked,
	<liquid:thorium> : stages.Locked,
	<liquid:tin> : stages.Locked,
	<liquid:titanium> : stages.Locked,
	<liquid:tree_oil> : stages.Locked,
	<liquid:troll_marrow> : stages.Locked,
	<liquid:tungsten> : stages.Locked,
	<liquid:uranium> : stages.Locked,
	<liquid:vapor_of_levity> : stages.Locked,
	<liquid:vibranium> : stages.Locked,
	<liquid:vibrant_alloy> : stages.Locked,
	<liquid:voidmetal> : stages.Locked,
	<liquid:water> : stages.progression1,
	<liquid:wood_gas> : stages.Locked,
	<liquid:xpjuice> : stages.Locked,
	<liquid:xu_demonic_metal> : stages.Locked,
	<liquid:xu_enchanted_metal> : stages.Locked,
	<liquid:xu_evil_metal> : stages.Locked,
	<liquid:yellorium> : stages.Locked,
	<liquid:zinc> : stages.Locked
};

for liquidObject, zenStageObject in liquidStages
{
	if(zenStageObject.stage != "stage-i")
	{
		zenStageObject.addLiquid(liquidObject);
	}
}

print("### Liquid Staging Complete ###");
