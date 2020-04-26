
print("~~~ Begin  Quark Init ~~~");

//Add Tooltips for various blocks to explain their uses
var quarkTooltips =
{
	<quark:chain> : ["Can be used to connect boats and minecarts together."],
	<quark:trowel> : ["Can be used to place blocks on your hotbar randomly."],
	<quark:rope> : ["Can be used as a ladder/vine replacement.", "Right clicking the top of a rope will pull up the bottom block it's connected to!", "Can also be used in a dispenser!"],
	<quark:iron_rod> : ["When pushed by a piston will break the block it's moving towards.", "Can be used for easy vanilla/early game auto farms for cobble/concrete!"],
	<quark:chute> : ["Toggleable by redstone, will drop any items piped into it by a hopper."],
	<quark:redstone_inductor> : ["A redstone circuit piece where the output is the sum of the 3 other input sides."],
	<quark:gravisand> : ["Falls only when a redstone signal is given.", "Floats upwards if it cannot fall down.", "Emits a comparator signal of 15 and propagates to adjacent gravisand blocks."],
	<quark:grate> : ["Players can walk on top of the grate just fine", "but animals will be too scared to walk over it.", "Items will drop straight through it"],
	<quark:horse_whistle> : ["Teleports your horse to you if you're within a medium-sized radius."]
} as string[][crafttweaker.item.IItemStack];

for item, textArray in quarkTooltips
{
	scripts.helpers.AddTooltip(item, textArray);
}
print("### Quark Init Complete ###");
