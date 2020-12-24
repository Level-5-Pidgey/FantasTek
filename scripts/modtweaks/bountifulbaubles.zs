
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
	<bountifulbaubles:disintegrationtablet> : [[null, null, null], [null, null, null], [null, null, null]],
	<bountifulbaubles:flaregun> : [[null, null, null], [null, null, null], [null, null, null]],
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

print("### Bountiful Baubles Init Complete ###");
