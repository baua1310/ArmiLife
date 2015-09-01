PLAYERDATA = [0];

// NON-DB
playerarray=[p1];

handItem = "Empty Hands";
handItems = ["Empty Hands","Fists"];
capWar = nil;
antwort = 2;
allowTP = false;

dmgSkip = false;
dmgHead = 0; dmgBody = 0; dmgHands = 0; dmgLegs = 0;
dmgCap = 0.99;

moveSurrender = ["amovpercmstpssurwnondnon"];

isBusy = false;
furnances = ["i_stone_housebig_v2"];
laws = [
	[
	"Government not formed - no existing laws",
	"Somebody needs to claim the government"
	],
	[
	"Government not formed - no existing laws",
	"Somebody needs to claim the government"
	]
];
taxes = [0,0];

profs = [
	["Medic","STR_prof_medic",5000,"((PLAYERDATA select 11) > 0)"],
	["Judge","STR_prof_judge",30000,"((PLAYERDATA select 11) > 0)"]
];

isNMayor = false;
isCMayor = false;
isAMayor = false;