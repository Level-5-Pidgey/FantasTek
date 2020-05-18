#priority 500
#loader contenttweaker
import mods.contenttweaker.Color;
import mods.contenttweaker.VanillaFactory;

print("~~~ Begin Custom Fluid Creator Init ~~~");

var liquidLubricant = VanillaFactory.createFluid("lubricant", Color.fromHex("d6b340"));
liquidLubricant.register();

var bone_marrow = VanillaFactory.createFluid("bone_marrow", Color.fromHex("e3dbaa"));
bone_marrow.register();

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

print("### Custom Fluid Creator Init Complete ###");
