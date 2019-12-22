#priority 100
#loader contenttweaker
import mods.contenttweaker.Color;
import mods.contenttweaker.VanillaFactory;

print("~~~ Begin Custom Fluid Creator Init ~~~");

var liquidLubricant = VanillaFactory.createFluid("lubricant", Color.fromHex("d6b340"));
liquidLubricant.register();

var troll_marrow = VanillaFactory.createFluid("troll_marrow", Color.fromHex("e3dbaa"));
troll_marrow.register();

var moltenAwakenedDraconium = VanillaFactory.createFluid("molten_awakened_draconium", Color.fromHex("ff4917"));
moltenAwakenedDraconium.register();

print("### Custom Fluid Creator Init Complete ###");
