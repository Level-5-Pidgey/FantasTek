print("~~~ Begin Good Ol' Currency Mod Init ~~~");

val moneyItems =
[
	<modcurrency:banknote:1>,
	<modcurrency:banknote:2>,
	<modcurrency:banknote:3>,
	<modcurrency:banknote:4>,
	<modcurrency:banknote:5>,
	<modcurrency:coin>,
	<modcurrency:coin:1>,
	<modcurrency:coin:2>,
	<modcurrency:coin:3>,
	<modcurrency:coin:4>,
	<modcurrency:coin:5>
] as crafttweaker.item.IItemStack[];

for money in moneyItems
{
	scripts.helpers.AddTooltip(money, ["Money will be destroyed if it is in your inventory when you die.", "A wallet can store money safely!"]);
}

//Hide unused currency item.
scripts.helpers.unstageAndHide(<modcurrency:banknote>);

print("### Good Ol' Currency Mod Init Complete ###");
