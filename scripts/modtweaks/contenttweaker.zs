print("~~~ Begin ContentTweaker recipes Init ~~~");

//Steel Blend Crafting
recipes.addShaped("steel_blend_crafting", <contenttweaker:steel_blend> * 2, [[<contenttweaker:coke_dust>, <ore:dustIron>, <contenttweaker:coke_dust>],[<contenttweaker:coke_dust>, <ore:dustIron>, <contenttweaker:coke_dust>], [<contenttweaker:coke_dust>, <ore:dustIron>, <contenttweaker:coke_dust>]]);

//Melt Steel Blend into Steel
mods.tconstruct.Melting.addRecipe(<liquid:steel> * 144, <contenttweaker:steel_blend>);

//Add Plate Press for Wooden Boards
for wood in <ore:logWood>.items
{
	mods.advancedrocketry.PlatePresser.addRecipe(<contenttweaker:wood_plate> * 2, wood);
}

print("### ContentTweaker recipes Init Complete ###");
