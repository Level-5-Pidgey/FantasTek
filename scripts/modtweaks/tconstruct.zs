import crafttweaker.liquid.ILiquidStack;
import mods.zenstages.Stage;
import scripts.staging.stages;

print("~~~ Begin TConstruct Init ~~~");

function CreateToolForgeAndStage(material as string, stageToSet as string)
{
	var oreBlock = oreDict.get("block" ~ material);

	if (!oreBlock.empty)
	{
		var ToolforgeData as crafttweaker.data.IData = {textureBlock: {id: oreBlock.firstItem.definition.id, Count: 1, Damage: oreBlock.firstItem.damage as short}};
		var ToolForgeBlock as crafttweaker.item.IItemStack = <tconstruct:toolforge>.withTag(ToolforgeData);

		//Create Recipe for Tool Forge
		mods.extendedcrafting.TableCrafting.addShaped(0, ToolForgeBlock, [[<ore:blockSeared>, <ore:blockSeared>, <ore:blockSeared>], [oreBlock, <tconstruct:tooltables:3>, oreBlock], [oreBlock, null, oreBlock]]);

		//Stage Tool Forge
		if (stageToSet != "stage_i")
		{
			mods.ItemStages.addItemStage(stageToSet, ToolForgeBlock);
		}

		//Add to JEI
		mods.jei.JEI.addItem(ToolForgeBlock);
	}
}

//Remove all casting-based sharpening kits
recipes.removeByRecipeName("tconstruct:repair");
scripts.helpers.AddTooltip(<tconstruct:sharpening_kit>, ["Cannot be used to repair tools in a crafting table.", "Still can be used to upgrade the mining level of a tool!"]);

//Remove tool forge crafting recipes
recipes.remove(<tconstruct:toolforge>);

//Hide default tool forges
val toolForges =
[
	<tconstruct:toolforge>.withTag({textureBlock: {id: "enderio:block_alloy", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "enderio:block_alloy", Count: 1 as byte, Damage: 1 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "enderio:block_alloy", Count: 1 as byte, Damage: 2 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "enderio:block_alloy", Count: 1 as byte, Damage: 3 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "enderio:block_alloy", Count: 1 as byte, Damage: 4 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "enderio:block_alloy", Count: 1 as byte, Damage: 5 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "enderio:block_alloy", Count: 1 as byte, Damage: 6 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "enderio:block_alloy", Count: 1 as byte, Damage: 7 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "enderio:block_alloy", Count: 1 as byte, Damage: 8 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "enderio:block_alloy", Count: 1 as byte, Damage: 9 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "enderio:block_alloy_endergy", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "enderio:block_alloy_endergy", Count: 1 as byte, Damage: 1 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "enderio:block_alloy_endergy", Count: 1 as byte, Damage: 2 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "enderio:block_alloy_endergy", Count: 1 as byte, Damage: 3 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "enderio:block_alloy_endergy", Count: 1 as byte, Damage: 4 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "enderio:block_alloy_endergy", Count: 1 as byte, Damage: 5 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage", Count: 1 as byte, Damage: 2 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage", Count: 1 as byte, Damage: 3 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage_alloy", Count: 1 as byte, Damage: 3 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "tconstruct:metal", Count: 1 as byte, Damage: 2 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "tconstruct:metal", Count: 1 as byte, Damage: 1 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "chisel:blockcobalt", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "tconstruct:metal", Count: 1 as byte, Damage: 5 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "tconstruct:metal", Count: 1 as byte, Damage: 3 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "tconstruct:metal", Count: 1 as byte, Damage: 4 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "minecraft:iron_block", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "enderio:block_alloy_endergy", Count: 1 as byte, Damage: 6 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage_alloy", Count: 1 as byte, Damage: 1 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage_alloy", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "minecraft:gold_block", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thaumcraft:metal_brass", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage", Count: 1 as byte, Damage: 1 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage", Count: 1 as byte, Damage: 5 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "jaopca:block_blockzinc", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage", Count: 1 as byte, Damage: 4 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "iceandfire:dragonsteel_fire_block", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "iceandfire:dragonsteel_ice_block", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage", Count: 1 as byte, Damage: 6 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage", Count: 1 as byte, Damage: 7 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage_alloy", Count: 1 as byte, Damage: 2 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage_alloy", Count: 1 as byte, Damage: 4 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage_alloy", Count: 1 as byte, Damage: 5 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage_alloy", Count: 1 as byte, Damage: 6 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage_alloy", Count: 1 as byte, Damage: 7 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "minecraft:glowstone", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "minecraft:redstone_block", Count: 1 as byte, Damage: 0 as short}}),
] as crafttweaker.item.IItemStack[];

for item in toolForges
{
	scripts.helpers.unstageAndHide(item);
	recipes.remove(item);
}

//Native Clusters and Rocky Chunks in TCon Smeltery
val chunkMaterials =
{
	"Lead" : <liquid:lead>,
	"Aluminum" : <liquid:aluminum>,
	"Yellorium" : <liquid:yellorium>,
	"Vibranium" : <liquid:vibranium>,
	"Uranium" : <liquid:uranium>,
	"Titanium" : <liquid:titanium>,
	"Thorium" : <liquid:thorium>,
	"Platinum" : <liquid:platinum>,
	"Necrodermis" : <liquid:necrodermis>,
	"Iridium" : <liquid:iridium>,
	"Draconium" : <liquid:draconium>,
	"Chromium" : <liquid:chromium>,
	"AstralStarmetal" : <liquid:astral_starmetal>,
	"Ardite" : <liquid:ardite>
} as ILiquidStack[string];

for materialString, molten in chunkMaterials
{
	if(!oreDict.get("nativeCluster" ~ materialString).empty)
	{
		mods.tconstruct.Melting.addRecipe(molten * 288, oreDict.get("nativeCluster" ~ materialString).firstItem, 291);
	}

	if(!oreDict.get("chunk" ~ materialString).empty)
	{
		mods.tconstruct.Melting.addRecipe(molten * 288, oreDict.get("chunk" ~ materialString).firstItem, 291);
	}

	if(!oreDict.get("rockyChunk" ~ materialString).empty)
	{
		mods.tconstruct.Melting.addRecipe(molten * 288, oreDict.get("rockyChunk" ~ materialString).firstItem, 291);
	}
}

//Nerf Demonic Metal Damage
<ticmat:xu_demonic_metal>.attackHead = 5.7;

//Remove Default Grout Crafting Recipes
recipes.removeByRecipeName("tconstruct:smeltery/grout");
recipes.removeByRecipeName("tconstruct:smeltery/grout_simple");

//Smeltery Controller with Magical Fire Items
recipes.remove(<tconstruct:smeltery_controller>);
for item in scripts.helpers.AllFireT1Items
{
	mods.extendedcrafting.TableCrafting.addShaped(0, <tconstruct:smeltery_controller>, [
		[<ore:ingotBrickSeared>, <ore:ingotBrickSeared>, <ore:ingotBrickSeared>],
		[<ore:ingotBrickSeared>, item, <ore:ingotBrickSeared>],
		[<ore:ingotBrickSeared>, <ore:ingotBrickSeared>, <ore:ingotBrickSeared>]
	]);
}

//Extended Crafting Table Tier 1 Recipes
val componentRecipes = {
		<tconstruct:tinker_tank_controller> : [[<tconstruct:materials>, <tconstruct:materials>, <tconstruct:materials>],[<tconstruct:materials>, <minecraft:bucket>, <tconstruct:materials>],[<tconstruct:materials>, <tconstruct:materials>, <tconstruct:materials>]],
		<tconstruct:channel> : [[null, null, null],[<tconstruct:materials>, null, <tconstruct:materials>],[<tconstruct:materials>, <tconstruct:materials>, <tconstruct:materials>]],
		<tconstruct:smeltery_io> : [[<tconstruct:materials>, null, <tconstruct:materials>],[<tconstruct:materials>, null, <tconstruct:materials>],[<tconstruct:materials>, null, <tconstruct:materials>]],
		<tconstruct:casting> : [[<tconstruct:materials>, <tconstruct:materials>, <tconstruct:materials>],[<tconstruct:materials>, null, <tconstruct:materials>],[<tconstruct:materials>, null, <tconstruct:materials>]],
		<tconstruct:seared_tank:2> : [[<tconstruct:materials>, <ore:blockGlassBlack>, <tconstruct:materials>],[<tconstruct:materials>, <ore:blockGlassBlack>, <tconstruct:materials>],[<tconstruct:materials>, <ore:blockGlassBlack>, <tconstruct:materials>]],
		<tconstruct:seared_furnace_controller> : [[<tconstruct:materials>, <tconstruct:materials>, <tconstruct:materials>],[<tconstruct:materials>, <minecraft:furnace>, <tconstruct:materials>],[<tconstruct:materials>, <tconstruct:materials>, <tconstruct:materials>]],
		<tconstruct:seared_tank> : [[<tconstruct:materials>, <tconstruct:materials>, <tconstruct:materials>],[<tconstruct:materials>, <ore:blockGlassBlack>, <tconstruct:materials>],[<tconstruct:materials>, <tconstruct:materials>, <tconstruct:materials>]],
		<tconstruct:seared_tank:1> : [[<tconstruct:materials>, <ore:blockGlassBlack>, <tconstruct:materials>],[<ore:blockGlassBlack>, <ore:blockGlassBlack>, <ore:blockGlassBlack>],[<tconstruct:materials>, <ore:blockGlassBlack>, <tconstruct:materials>]],
		<tconstruct:casting:1> : [[<tconstruct:materials>, null, <tconstruct:materials>],[<tconstruct:materials>, null, <tconstruct:materials>],[<tconstruct:materials>, <tconstruct:materials>, <tconstruct:materials>]],
		<tconstruct:faucet> : [[null, null, null],[<tconstruct:materials>, null, <tconstruct:materials>],[null, <tconstruct:materials>, null]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in componentRecipes {
	recipes.remove(key.withAmount(1));
	mods.extendedcrafting.TableCrafting.addShaped(0, key, value);
}

//Crafting Table Recipes
val tconstructRecipes_CRAFTINGTABLE = {
	<tconstruct:materials:15> * 4 : [[<minecraft:gold_nugget>, <randomthings:ingredient:12>, <minecraft:gold_nugget>], [<randomthings:ingredient:12>, <minecraft:gold_nugget>, <randomthings:ingredient:12>], [<minecraft:gold_nugget>, <randomthings:ingredient:12>, <minecraft:gold_nugget>]],
	<tconstruct:soil> * 8 : [[<ore:gravel>, <ore:gravel>, <ore:gravel>],[<ore:gravel>, <forge:bucketfilled>.withTag({FluidName: "creosote", Amount: 1000}), <ore:gravel>], [<ore:gravel>, <ore:gravel>, <ore:gravel>]],
	<tconstruct:pattern> * 4 : [[<ore:stickWood>, <ore:plateWood>], [<ore:plateWood>, <ore:stickWood>]]
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in tconstructRecipes_CRAFTINGTABLE {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

//Remove Easy Book Crafting Recipe.
recipes.removeByRecipeName("tconstruct:tools/book");

//Faster Dry Bricks
mods.tconstruct.Drying.removeRecipe(<tconstruct:materials:2>);
mods.tconstruct.Drying.addRecipe(<tconstruct:materials:2>, <minecraft:clay_ball>, 120);

//Create new Tool Forge Recipes
var tconForges as Stage[string]=
{
	"CrudeSteel" : stages.progression1,
	"AncientDebris" : stages.progression1,
	"Diamond" : stages.progression1,
	"Ruby" : stages.progression1,
	"Sapphire" : stages.progression1,
	"Peridot" : stages.progression1,
	"Amber" : stages.progression1,
	"Amethyst" : stages.progression1,
	"Malachite" : stages.progression1,
	"Tanzanite" : stages.progression1,
	"Topaz" : stages.progression1,
};

for materialString, stageToSet in tconForges
{
	CreateToolForgeAndStage(materialString, stageToSet.stage);
}

//Hide Excavate Modifier
recipes.remove(<oeintegration:excavatemodifier>);
scripts.helpers.AddTooltip(<oeintegration:excavatemodifier>, ["Uncraftable.", "Excavation is exclusive to Vanilla Tools!"]);

print("### TConstruct Init Complete ###");
