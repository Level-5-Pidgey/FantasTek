
print("~~~ Begin Mekanism Init ~~~");

//Disable Chemical Dissolution Chamber
mods.mekanism.chemical.dissolution.removeAllRecipes();
mods.jei.JEI.hideCategory("mekanism.chemicaldissolutionchamber");
mods.jei.JEI.removeAndHide(<mekanism:machineblock2:6>);

print("### Mekanism Init Complete ###");
