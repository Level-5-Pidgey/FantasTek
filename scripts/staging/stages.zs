#priority 501

import mods.zenstages.Stage;
import mods.zenstages.ZenStager;

/*

	This file is to create and store stages in one place.
	This should be edited as stages are introduced or removed.

*/

//Create Static ZenStage objects for each game stage.
//Progression Stages - Tech
static progression1 as Stage = ZenStager.initStage("stage_i");
static progression2 as Stage = ZenStager.initStage("stage_ii");
static progression3 as Stage = ZenStager.initStage("stage_iii");
static progression4 as Stage = ZenStager.initStage("stage_iv");
static progression5 as Stage = ZenStager.initStage("stage_v");
static progression6 as Stage = ZenStager.initStage("stage_vi");

//Progression Stages - Magic
	//Blood Magic
	static BloodMagic1 as Stage = ZenStager.initStage("bloodmagic_i");
	static BloodMagic2 as Stage = ZenStager.initStage("bloodmagic_ii");
	static BloodMagic3 as Stage = ZenStager.initStage("bloodmagic_iii");
	static BloodMagic4 as Stage = ZenStager.initStage("bloodmagic_iv");
	static BloodMagic5 as Stage = ZenStager.initStage("bloodmagic_v");

	//Botania
	static Botania1 as Stage = ZenStager.initStage("botania_i");
	static Botania2 as Stage = ZenStager.initStage("botania_ii");
	static Botania3 as Stage = ZenStager.initStage("botania_iii");
	static Botania4 as Stage = ZenStager.initStage("botania_iv");
	static Botania5 as Stage = ZenStager.initStage("botania_v");

	//Astral Sorcery
	static AstralSorcery1 as Stage = ZenStager.initStage("astral_i");
	static AstralSorcery2 as Stage = ZenStager.initStage("astral_ii");
	static AstralSorcery3 as Stage = ZenStager.initStage("astral_iii");
	static AstralSorcery4 as Stage = ZenStager.initStage("astral_iv");
	static AstralSorcery5 as Stage = ZenStager.initStage("astral_v");

	//Embers
	static Embers1 as Stage = ZenStager.initStage("embers_i");
	static Embers2 as Stage = ZenStager.initStage("embers_ii");
	static Embers3 as Stage = ZenStager.initStage("embers_iii");
	static Embers4 as Stage = ZenStager.initStage("embers_iv");
	static Embers5 as Stage = ZenStager.initStage("embers_v");

	//Thaumcraft
	static Thaumcraft1 as Stage = ZenStager.initStage("thaumcraft_i");
	static Thaumcraft2 as Stage = ZenStager.initStage("thaumcraft_ii");
	static Thaumcraft3 as Stage = ZenStager.initStage("thaumcraft_iii");
	static Thaumcraft4 as Stage = ZenStager.initStage("thaumcraft_iv");
	static Thaumcraft5 as Stage = ZenStager.initStage("thaumcraft_v");

//Misc Stages
static Locked as Stage = ZenStager.initStage("locked");

//Optional Milestone Stages
