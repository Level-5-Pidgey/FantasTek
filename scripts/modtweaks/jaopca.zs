print("~~~ Begin JAOPCA Init ~~~");

//Hide Dense Plates
val JAOPCAPlates =
[
	<jaopca:item_platedensealuminium>,
	<jaopca:item_platedenseardite>,
	<jaopca:item_platedenseastralstarmetal>,
	<jaopca:item_platedensecobalt>,
	<jaopca:item_platedensecopper>,
	<jaopca:item_platedensedraconium>,
	<jaopca:item_platedensegold>,
	<jaopca:item_platedenseiridium>,
	<jaopca:item_platedenseiron>,
	<jaopca:item_platedenselead>,
	<jaopca:item_platedensemithril>,
	<jaopca:item_platedensenecrodermis>,
	<jaopca:item_platedensenickel>,
	<jaopca:item_platedenseosmium>,
	<jaopca:item_platedenseplatinum>,
	<jaopca:item_platedensesilver>,
	<jaopca:item_platedensethorium>,
	<jaopca:item_platedensetin>,
	<jaopca:item_platedensetitanium>,
	<jaopca:item_platedensetungsten>,
	<jaopca:item_platedenseuranium>,
	<jaopca:item_platedensevibranium>,
	<jaopca:item_platedenseyellorium>,
	<jaopca:item_platedensezinc>,
	<jaopca:item_platedenseamber>,
	<jaopca:item_platedenseamethyst>,
	<jaopca:item_platedenseapatite>,
	<jaopca:item_platedenseaquamarine>,
	<jaopca:item_platedensecertusquartz>,
	<jaopca:item_platedensechargedcertusquartz>,
	<jaopca:item_platedensecoal>,
	<jaopca:item_platedensediamond>,
	<jaopca:item_platedensedilithium>,
	<jaopca:item_platedensedimensionalshard>,
	<jaopca:item_platedenseemerald>,
	<jaopca:item_platedenseenderbiotite>,
	<jaopca:item_platedenselapis>,
	<jaopca:item_platedensemalachite>,
	<jaopca:item_platedenseperidot>,
	<jaopca:item_platedensequartz>,
	<jaopca:item_platedenseruby>,
	<jaopca:item_platedensesapphire>,
	<jaopca:item_platedensetanzanite>,
	<jaopca:item_platedensetopaz>,
	<jaopca:item_platedensechromium>
] as crafttweaker.item.IItemStack[];

for JAOPCAPlate in JAOPCAPlates
{
	mods.jei.JEI.hide(JAOPCAPlate);
}

print("### JAOPCA Init Complete ###");
