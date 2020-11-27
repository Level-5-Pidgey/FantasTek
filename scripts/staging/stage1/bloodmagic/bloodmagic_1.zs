#priority 99
import scripts.staging.stages;

print("~~~ Begin Stage 1 Blood Magic Staging ~~~");

val Stage1BloodMagicItems = [
	<contenttweaker:sanguine_gem_air>,
	<contenttweaker:sanguine_gem_water>,
	<contenttweaker:sanguine_gem_fire>,
	<contenttweaker:sanguine_gem_earth>,
	<contenttweaker:sanguine_ingot>,
	<contenttweaker:sanguine_gem>,
	<bloodmagic:soul_snare>,
	<bloodmagic:monster_soul>,
	<bloodmagic:altar>,
	<bloodmagic:sacrificial_dagger>,
	<bloodmagic:blood_orb>.withTag({orb: "bloodmagic:weak"}),
	<bloodmagic:dagger_of_sacrifice>,
	<bloodmagic:pack_sacrifice>,
	<bloodmagic:pack_self_sacrifice>,
	<bloodmagic:soul_forge>,
	<bloodmagic:soul_gem>,
	<bloodmagic:soul_gem:1>,
	<bloodmagic:component:4>,
	<bloodmagic:sigil_void>,
	<bloodmagic:sigil_water>,
	<bloodmagic:sigil_blood_light>,
	<bloodmagic:component>,
	<bloodmagic:component:11>,
	<bloodmagic:sigil_divination>,
	<bloodmagic:sigil_phantom_bridge>,
	<bloodmagic:arcane_ashes>,
	<bloodmagic:component:15>,
	<modularmachinery:itemblueprint>.withTag({dynamicmachine: "modularmachinery:bloodmagic_converter"}),
	<bloodmagic:slate>,
] as crafttweaker.item.IItemStack[];

for item in Stage1BloodMagicItems
{
  mods.ItemStages.removeItemStage(item);
  scripts.helpers.setItemAndRecipesStage(item, stages.BloodMagic1.stage);
}

//Items that should not have a stage associated with them at all
val StageLessItems = [
  <guideapi:bloodmagic-guide>
] as crafttweaker.item.IItemStack[];

for item in StageLessItems
{
  mods.ItemStages.removeItemStage(item);
}

print("### Stage 1 Blood Magic Complete ###");
