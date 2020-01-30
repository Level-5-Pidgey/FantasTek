#priority 100
#loader contenttweaker
import mods.contenttweaker.Color;
import mods.contenttweaker.VanillaFactory;

print("~~~ Begin Custom Fluid Creator Init ~~~");

var liquidLubricant = VanillaFactory.createFluid("lubricant", Color.fromHex("d6b340"));
liquidLubricant.register();

var troll_marrow = VanillaFactory.createFluid("troll_marrow", Color.fromHex("e3dbaa"));
troll_marrow.register();

var moltenAwakenedDraconium = MaterialSystem.getMaterialBuilder().setName("Awakened Draconium").setColor(Color.fromHex("ff4917")).build();
var liquid_molten_moltenAwakenedDraconium = molten_.registerPart("molten").getData();
liquid_molten_moltenAwakenedDraconium.addDataValue("density", "2000");
liquid_molten_moltenAwakenedDraconium.addDataValue("viscosity", 6000);
liquid_molten_moltenAwakenedDraconium.addDataValue("temperature", 800);
liquid_molten_moltenAwakenedDraconium.addDataValue("luminosity", 15);

var molten_black_iron = MaterialSystem.getMaterialBuilder().setName("Black Iron").setColor(Color.fromHex("262626")).build();
var liquid_molten_black_iron = molten_.registerPart("molten").getData();
liquid_molten_black_iron.addDataValue("density", "2000");
liquid_molten_black_iron.addDataValue("viscosity", 6000);
liquid_molten_black_iron.addDataValue("temperature", 800);
liquid_molten_black_iron.addDataValue("luminosity", 15);

var molten_modularium = MaterialSystem.getMaterialBuilder().setName("Modularium").setColor(Color.fromHex("757575")).build();
var liquid_molten_modularium = molten_.registerPart("molten").getData();
liquid_molten_modularium.addDataValue("density", "2000");
liquid_molten_modularium.addDataValue("viscosity", 6000);
liquid_molten_modularium.addDataValue("temperature", 800);
liquid_molten_modularium.addDataValue("luminosity", 15);

var molten_crude_steel = MaterialSystem.getMaterialBuilder().setName("Crude Steel").setColor(Color.fromHex("ccccb3")).build();
var liquid_molten_crude_steel = molten_.registerPart("molten").getData();
liquid_molten_crude_steel.addDataValue("density", 2000);
liquid_molten_crude_steel.addDataValue("viscosity", 6000);
liquid_molten_crude_steel.addDataValue("temperature", 800);
liquid_molten_crude_steel.addDataValue("luminosity", 15);

print("### Custom Fluid Creator Init Complete ###");
