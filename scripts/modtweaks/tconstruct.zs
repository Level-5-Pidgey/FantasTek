
print("~~~ Begin TConstruct Init ~~~");

//Remove all casting-based sharpening kits
recipes.removeByRecipeName("tconstruct:repair"); //Not sure if this works but let's try lol

//Remove tool forge crafting recipes
val forgeCrafts =
[
	"tconstruct:tools/forge/blockrefinedobsidian",
	"tconstruct:tools/forge/blockiron",
	"tconstruct:tools/forge/blocknickel",
	"tconstruct:tools/forge/blockfiredragonsteel",
	"tconstruct:tools/forge/blockreinforcedpinkslime",
	"tconstruct:tools/forge/blocksilver",
	"tconstruct:tools/forge/blockplatinum",
	"tconstruct:tools/forge/blockosmiridium",
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
	"tconstruct:tools/forge/blocklead"
] as string[];

for item in forgeCrafts
{
	recipes.removeByRecipeName(item);
}

print("### TConstruct Init Complete ###");
