#priority 500
import mods.mekatweaker.GasFactory;
import mods.mekatweaker.Gas;

print("~~~ Begin Custom Gas Creator Init ~~~");

var heliumGas = GasFactory.createFromFluid(<liquid:helium>);
heliumGas.register();

print("### Custom Gas Creator Init Complete ###");
