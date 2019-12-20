#priority 100
#loader contenttweaker

import mods.contenttweaker.Color;
import mods.contenttweaker.VanillaFactory;

print("~~~ Begin Custom Blocks and Items Init ~~~");

var cokeDust = VanillaFactory.createItem("coke_dust");
cokeDust.register();

var steelBlend = VanillaFactory.createItem("steel_blend");
steelBlend.register();

print("### Custom Blocks and Items Init Complete ###");
