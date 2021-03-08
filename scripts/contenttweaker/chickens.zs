#priority 500
#loader contenttweaker
#modloaded chickens

//This file is automatically appended by a script. Please don't mess with it unecessarily!
import mods.contenttweaker.Color;
import mods.contenttweaker.ChickenFactory;
import mods.contenttweaker.ResourceLocation;

//Earthen Element
var earthen_element = ChickenFactory.createChicken("earthen_element_chicken", Color.fromInt(0x82e34d), <item:contenttweaker:elemental_mote_earth>);
earthen_element.setForegroundColor(Color.fromInt(0x82e34d));
earthen_element.layCoefficient = 3.5f;
earthen_element.register();

//Molten Element
var molten_element = ChickenFactory.createChicken("molten_element_chicken", Color.fromInt(0xd44219), <item:contenttweaker:elemental_mote_fire>);
molten_element.setForegroundColor(Color.fromInt(0xd44219));
molten_element.layCoefficient =  3.5f;
molten_element.register();

//Aqueous Element
var aqueous_element = ChickenFactory.createChicken("aqueous_element_chicken", Color.fromInt(0x6effd1), <item:contenttweaker:elemental_mote_water>);
aqueous_element.setForegroundColor(Color.fromInt(0x6effd1));
aqueous_element.layCoefficient =  3.5f;
aqueous_element.register();

//Aerial Element
var aerial_element = ChickenFactory.createChicken("aerial_element_chicken", Color.fromInt(0xebe2ca), <item:contenttweaker:elemental_mote_air>);
aerial_element.setForegroundColor(Color.fromInt(0xebe2ca));
aerial_element.layCoefficient =  3.5f;
aerial_element.register();

//Lubricated
//var lubricated = ChickenFactory.createChicken("lubricated_chicken", Color.fromInt(0xd6b340), <item:minecraft:bedrock>);
//lubricated.setForegroundColor(Color.fromInt(0xd6b340));
//lubricated.parentOne = ResourceLocation.create("contenttweaker:aerial_element_chicken");
//lubricated.parentTwo = ResourceLocation.create("contenttweaker:aqueous_element_chicken");
//lubricated.register();
