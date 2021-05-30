
print("~~~ Begin Bountiful Baubles Init ~~~");

val bountifulbaubles = [
	<bountifulbaubles:trinketballoon>,
	<bountifulbaubles:shieldcobalt>,
	<bountifulbaubles:trinketobsidianskull>,
	<bountifulbaubles:trinketmagiclenses>,
	<bountifulbaubles:trinketblackdragonscale>,
	<bountifulbaubles:trinketankhcharm>,
	<bountifulbaubles:ringflywheel>,
	<bountifulbaubles:ringflywheeladvanced>,
	<bountifulbaubles:magicmirror>,
	<bountifulbaubles:wormholemirror>,
	<bountifulbaubles:trinketluckyhorseshoe>,
	<bountifulbaubles:amuletsinempty>,
	<bountifulbaubles:amuletsingluttony>,
	<bountifulbaubles:amuletsinpride>,
	<bountifulbaubles:amuletsinwrath>,
	<bountifulbaubles:trinketbrokenheart>,
	<bountifulbaubles:amuletcross>,
] as crafttweaker.item.IItemStack[];

for bauble in bountifulbaubles {
	recipes.remove(bauble);
}

//Bountiful Bauble Recipes
val randomthingsRecipes_CRAFTINGTABLE = {
	<bountifulbaubles:disintegrationtablet> : [[<ore:dustGlowstone>, <ore:dustRedstone>, <ore:dustGlowstone>], [<ore:dustRedstone>, <ore:platePulsatingIron>, <ore:dustRedstone>], [<ore:dustGlowstone>, <ore:dustRedstone>, <ore:dustGlowstone>]],
	<bountifulbaubles:flaregun> : [[<ore:gearStone>, <ore:ingotIron>, <ore:ingotIron>], [null, <ore:dustGlowstone>, <ore:dustGlowstone>], [<ore:ingotIron>, null, null]],
	<bountifulbaubles:reforger> : [[null, null, null], [null, null, <ore:chestWood>], [<ore:workbench>, <minecraft:anvil>, <ore:blockDiamond>]],
} as crafttweaker.item.IIngredient[][][crafttweaker.item.IItemStack];

for key, value in randomthingsRecipes_CRAFTINGTABLE {
	recipes.remove(key.withAmount(1));
	recipes.addShaped(scripts.helpers.createRecipeName(key), key, value);
}

//Unstage and Hide Some Items
scripts.helpers.unstageAndHide(<bountifulbaubles:ringiron>);
scripts.helpers.unstageAndHide(<bountifulbaubles:ringflywheel>);
scripts.helpers.unstageAndHide(<bountifulbaubles:ringflywheeladvanced>);

//Change the output rate for Spectral Silt
recipes.remove(<bountifulbaubles:spectralsilt>);
val siltItems = [
	<bountifulbaubles:trinketballoon>,
	<bountifulbaubles:shieldcobalt>,
	<bountifulbaubles:trinketobsidianskull>,
	<bountifulbaubles:trinketmagiclenses>,
	<bountifulbaubles:trinketblackdragonscale>,
	<bountifulbaubles:trinketankhcharm>,
	<bountifulbaubles:magicmirror>,
	<bountifulbaubles:wormholemirror>,
	<bountifulbaubles:trinketluckyhorseshoe>,
	<bountifulbaubles:amuletsinempty>,
	<bountifulbaubles:amuletsingluttony>,
	<bountifulbaubles:amuletsinpride>,
	<bountifulbaubles:amuletsinwrath>,
	<bountifulbaubles:trinketbrokenheart>,
	<bountifulbaubles:amuletcross>,
] as crafttweaker.item.IItemStack[];

for siltItem in siltItems {
	recipes.addShapeless(scripts.helpers.createRecipeName(siltItem) ~ "_siltCreate", <bountifulbaubles:spectralsilt> * 8, [<bountifulbaubles:disintegrationtablet>.reuse(), siltItem]);
	scripts.helpers.addCrushingRecipeWithSecondary(<bountifulbaubles:spectralsilt> * 12, siltItem, 12500, <bountifulbaubles:spectralsilt> * 4, 50, 3);
}


print("### Bountiful Baubles Init Complete ###");
