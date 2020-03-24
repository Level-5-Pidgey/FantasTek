print("~~~ Begin Ice And Fire Init ~~~");

//Change Iron Chain Recipe to match the cost of Quark Chains
recipes.remove(<iceandfire:chain_link>);
recipes.addShaped(scripts.helpers.createRecipeName(<iceandfire:chain_link>), <iceandfire:chain_link>, [[<ore:ingotIron>, null, null], [null, <ore:ingotIron>, <ore:nuggetIron>], [null, <ore:nuggetIron>, <ore:nuggetIron>]]);

print("### Ice And Fire Init Complete ###");
