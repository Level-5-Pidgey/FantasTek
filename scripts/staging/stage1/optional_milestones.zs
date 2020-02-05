#priority 96

print("~~~ Begin Stage 1 Optional Milestone Staging ~~~");

//Stage 1 Currency Wallet
mods.recipestages.Recipes.setRecipeStage(scripts.staging.stages.CurrencyWallet.stage, <modcurrency:wallet>);
mods.ItemStages.addItemStage(scripts.staging.stages.CurrencyWallet.stage, <modcurrency:wallet>);

print("### Stage 1 Optional Milestone Staging Complete ###");
