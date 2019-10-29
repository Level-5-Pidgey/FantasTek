#priority 100
#loader contenttweaker

import mods.contenttweaker.Color;
import mods.contenttweaker.VanillaFactory;

var liquidLubricant = VanillaFactory.createFluid("lubricant", Color.fromHex("d6b340"));
liquidLubricant.register();
