import crafttweaker.liquid.ILiquidStack;

print("~~~ Begin TConstruct Init ~~~");

//Remove all casting-based sharpening kits
recipes.removeByRecipeName("tconstruct:repair");

//Remove tool forge crafting recipes
val forgeCrafts =
[
	"tconstruct:tools/forge/blockiron",
	"tconstruct:tools/forge/blockgold",
	"tconstruct:tools/forge/blockbrass",
	"tconstruct:tools/forge/blockterrasteel",
	"tconstruct:tools/forge/blockosmium",
	"tconstruct:tools/forge/blocktitanium",
	"tconstruct:tools/forge/blockknightslime",
	"tconstruct:tools/forge/blockalumite",
	"tconstruct:tools/forge/blockthaumium",
	"tconstruct:tools/forge/blockelvenelementium",
	"tconstruct:tools/forge/blocksteel",
	"tconstruct:tools/forge/blockosgloglas",
	"tconstruct:tools/forge/blockbronze",
	"tconstruct:tools/forge/blockcobalt",
	"tconstruct:tools/forge/blockpigiron",
	"tconstruct:tools/forge/blockenderium",
	"tconstruct:tools/forge/blockmanyullyn",
	"tconstruct:tools/forge/blockconstantan",
	"tconstruct:tools/forge/blocktin",
	"tconstruct:tools/forge/blockicedragonsteel",
	"tconstruct:tools/forge/blockastralstarmetal",
	"tconstruct:tools/forge/blockaluminum",
	"tconstruct:tools/forge/blockiridium",
	"tconstruct:tools/forge/blockardite",
	"tconstruct:tools/forge/blockpsi",
	"tconstruct:tools/forge/blockelectrum",
	"tconstruct:tools/forge/blockzinc",
	"tconstruct:tools/forge/blockinfinity",
	"tconstruct:tools/forge/blockcopper",
	"tconstruct:tools/forge/blockinvar",
	"tconstruct:tools/forge/blocklumium",
	"tconstruct:tools/forge/blockmirion",
	"tconstruct:tools/forge/blockrefinedglowstone",
	"tconstruct:tools/forge/blockalubrass",
	"tconstruct:tools/forge/blocksignalum",
	"tconstruct:tools/forge/blockmanasteel",
	"tconstruct:tools/forge/blocklead",
	"tconstruct:tools/forge/blockenergeticalloy",
	"tconstruct:tools/forge/blockredstonealloy",
	"tconstruct:tools/forge/blockconstructionalloy",
	"tconstruct:tools/forge/blockender",
	"tconstruct:tools/forge/blockglowstone",
	"tconstruct:tools/forge/blockvibrantalloy",
	"tconstruct:tools/forge/blocksoularium",
	"tconstruct:tools/forge/blockconductiveiron",
	"tconstruct:tools/forge/blockdarksteel",
	"tconstruct:tools/forge/blockpulsatingiron",
	"tconstruct:tools/forge/blockelectricalsteel",
	"tconstruct:tools/forge/blockendsteel",
	"tconstruct:tools/forge/blockredstone"
] as string[];

for item in forgeCrafts
{
	recipes.removeByRecipeName(item);
}

//Hide Tables from JEI (So we can add only the craftable tables back in later)
val TConForges =
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
	<tconstruct:toolforge>.withTag({textureBlock: {id: "minecraft:iron_block", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "tconstruct:metal", Count: 1 as byte, Damage: 4 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "tconstruct:metal", Count: 1 as byte, Damage: 3 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "tconstruct:metal", Count: 1 as byte, Damage: 5 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "chisel:blockcobalt", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "tconstruct:metal", Count: 1 as byte, Damage: 1 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "tconstruct:metal", Count: 1 as byte, Damage: 2 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "forestry:resource_storage", Count: 1 as byte, Damage: 1 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "forestry:resource_storage", Count: 1 as byte, Damage: 3 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage", Count: 1 as byte, Damage: 3 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage", Count: 1 as byte, Damage: 2 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage_alloy", Count: 1 as byte, Damage: 1 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage_alloy", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "minecraft:gold_block", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage_alloy", Count: 1 as byte, Damage: 5 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage_alloy", Count: 1 as byte, Damage: 4 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage_alloy", Count: 1 as byte, Damage: 2 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage", Count: 1 as byte, Damage: 7 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage", Count: 1 as byte, Damage: 6 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "iceandfire:dragonsteel_ice_block", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "iceandfire:dragonsteel_fire_block", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage", Count: 1 as byte, Damage: 4 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "jaopca:block_blockzinc", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage", Count: 1 as byte, Damage: 5 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "forestry:resource_storage", Count: 1 as byte, Damage: 2 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thaumcraft:metal_brass", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage_alloy", Count: 1 as byte, Damage: 6 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "thermalfoundation:storage_alloy", Count: 1 as byte, Damage: 7 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "minecraft:glowstone", Count: 1 as byte, Damage: 0 as short}}),
	<tconstruct:toolforge>.withTag({textureBlock: {id: "minecraft:redstone_block", Count: 1 as byte, Damage: 0 as short}})
] as crafttweaker.item.IItemStack[];

for TConForge in TConForges
{
	mods.jei.JEI.hide(TConForge);
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

//Change Pattern Recipe
recipes.remove(<tconstruct:pattern>);
recipes.addShaped("pattern", <tconstruct:pattern> * 4, [[<ore:stickWood>, <ore:plateWood>], [<ore:plateWood>, <ore:stickWood>]]);

//Change Grout Crafting
recipes.removeByRecipeName("tconstruct:smeltery/grout");
recipes.removeByRecipeName("tconstruct:smeltery/grout_simple");
mods.inworldcrafting.FluidToItem.transform(<tconstruct:soil> * 20, <liquid:creosote>, [<ore:stoneLimestone> * 2, <ore:gravel> * 2, <ore:sand> * 2, <ore:itemClay> * 2], true);
print("### TConstruct Init Complete ###");
