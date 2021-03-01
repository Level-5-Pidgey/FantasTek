print("~~~ Begin JAOPCA Init ~~~");

//Remove Dense Plate Recipes
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
	<jaopca:item_platedensevibranium>,
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
	<jaopca:item_platedensechromium>,
	<jaopca:item_platedenseancientdebris>,
] as crafttweaker.item.IItemStack[];

for JAOPCAPlate in JAOPCAPlates
{
	//scripts.helpers.unstageAndHide(JAOPCAPlate);
}

//Add Coal Nugget Tooltips
if(!<ore:nuggetCoal>.empty)
{
	for coal in <ore:nuggetCoal>.items
	{
		furnace.setFuel(coal, 200);
		scripts.helpers.AddTooltip(coal, ["Can be used in a furnace to smelt 1 single item!"]);
	}
}

//Sulfur Compiling
recipes.remove(<bloodmagic:component:23>);
recipes.addShapeless(scripts.helpers.createRecipeName(<thermalfoundation:material:771>) ~ "_small", <thermalfoundation:material:771>, [<ore:dustSmallSulfur>, <ore:dustSmallSulfur>, <ore:dustSmallSulfur>, <ore:dustSmallSulfur>]);
recipes.addShapeless(scripts.helpers.createRecipeName(<thermalfoundation:material:771>) ~ "_tiny", <thermalfoundation:material:771>, [<ore:dustTinySulfur>, <ore:dustTinySulfur>, <ore:dustTinySulfur>, <ore:dustTinySulfur>, <ore:dustTinySulfur>, <ore:dustTinySulfur>, <ore:dustTinySulfur>, <ore:dustTinySulfur>, <ore:dustTinySulfur>]);


print("### JAOPCA Init Complete ###");
