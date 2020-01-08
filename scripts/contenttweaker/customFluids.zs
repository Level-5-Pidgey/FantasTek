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

var molten_black_iron = VanillaFactory.createFluid("molten_black_iron", Color.fromHex("262626"));
molten_black_iron.register();

//Molten Elemental Crystals (Astral Sorcery)
var molten_elemental_fire_crystal = VanillaFactory.createFluid("molten_elemental_fire_crystal", Color.fromHex("ff4a4a"));
molten_elemental_fire_crystal.register();
var molten_elemental_water_crystal = VanillaFactory.createFluid("molten_elemental_water_crystal", Color.fromHex("8fffd0"));
molten_elemental_water_crystal.register();
var molten_elemental_earth_crystal = VanillaFactory.createFluid("molten_elemental_earth_crystal", Color.fromHex("bbff78"));
molten_elemental_earth_crystal.register();
var molten_elemental_air_crystal = VanillaFactory.createFluid("molten_elemental_air_crystal", Color.fromHex("c7edff"));
molten_elemental_air_crystal.register();

var molten_modularium = VanillaFactory.createFluid("molten_modularium", Color.fromHex("757575"));
molten_modularium.register();

print("### Custom Fluid Creator Init Complete ###");
