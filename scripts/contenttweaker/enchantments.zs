#priority 500
#loader contenttweaker

import mods.contenttweaker.enchantments.EnchantmentBuilder;
import crafttweaker.enchantments.IEnchantmentDefinition;

var mechanical_imbuement = EnchantmentBuilder.create("mechanical_imbuement");
mechanical_imbuement.allowedOnBooks = false;
mechanical_imbuement.setDomain("contenttweaker");
mechanical_imbuement.setRarityVeryRare();
mechanical_imbuement.minLevel = 1;
mechanical_imbuement.maxLevel = 2;
mechanical_imbuement.setTreasure(false);
mechanical_imbuement.register();
