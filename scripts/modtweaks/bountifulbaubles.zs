
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
	<bountifulbaubles:disintegrationtablet>,
	<bountifulbaubles:flaregun>,
	<bountifulbaubles:reforger>
] as crafttweaker.item.IItemStack[];

for bauble in bountifulbaubles {
	recipes.remove(bauble);
}

//Re-add recipes
//<bountifulbaubles:disintegrationtablet>
//<bountifulbaubles:flaregun>
//<bountifulbaubles:reforger>

print("### Bountiful Baubles Init Complete ###");
