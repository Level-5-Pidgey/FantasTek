#priority 500
#loader contenttweaker
import mods.contenttweaker.Color;
import mods.contenttweaker.VanillaFactory;

print("~~~ Begin Custom Fluid Creator Init ~~~");

var liquidLubricant = VanillaFactory.createFluid("lubricant", Color.fromHex("d6b340"));
liquidLubricant.register();

var moltenAwakenedDraconium = mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Awakened Draconium").setColor(Color.fromHex("ff4917")).build();
var liquid_molten_AwakenedDraconium = moltenAwakenedDraconium.registerPart("molten").getData();
liquid_molten_AwakenedDraconium.addDataValue("density", "2000");
liquid_molten_AwakenedDraconium.addDataValue("viscosity", "6000");
liquid_molten_AwakenedDraconium.addDataValue("temperature", "800");
liquid_molten_AwakenedDraconium.addDataValue("luminosity", "15");

var molten_black_iron = mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Black Iron").setColor(Color.fromHex("262626")).build();
var liquid_molten_black_iron = molten_black_iron.registerPart("molten").getData();
liquid_molten_black_iron.addDataValue("density", "2000");
liquid_molten_black_iron.addDataValue("viscosity", "6000");
liquid_molten_black_iron.addDataValue("temperature", "800");
liquid_molten_black_iron.addDataValue("luminosity", "15");

var molten_modularium = mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Modularium").setColor(Color.fromHex("757575")).build();
var liquid_molten_modularium = molten_modularium.registerPart("molten").getData();
liquid_molten_modularium.addDataValue("density", "2000");
liquid_molten_modularium.addDataValue("viscosity", "6000");
liquid_molten_modularium.addDataValue("temperature", "800");
liquid_molten_modularium.addDataValue("luminosity", "15");

var molten_netherite = mods.contenttweaker.MaterialSystem.getMaterialBuilder().setName("Netherite").setColor(Color.fromHex("525150")).build();
var liquid_molten_netherite = molten_netherite.registerPart("molten").getData();
liquid_molten_netherite.addDataValue("density", "2000");
liquid_molten_netherite.addDataValue("viscosity", "6000");
liquid_molten_netherite.addDataValue("temperature", "800");
liquid_molten_netherite.addDataValue("luminosity", "15");

//Elemental Liquids
var elemental_water_fire = VanillaFactory.createFluid("elemental_water_fire", Color.fromHex("d44219"));
elemental_water_fire.register();
var elemental_water_water = VanillaFactory.createFluid("elemental_water_water", Color.fromHex("6effd1"));
elemental_water_water.register();
var elemental_water_air = VanillaFactory.createFluid("elemental_water_air", Color.fromHex("ebe2ca"));
elemental_water_air.register();
var elemental_water_earth = VanillaFactory.createFluid("elemental_water_earth", Color.fromHex("82e34d"));
elemental_water_earth.register();

print("### Custom Fluid Creator Init Complete ###");
