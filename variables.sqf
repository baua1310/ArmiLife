PLAYERDATA = [0];

playerarray=[p1];
capWar = nil;

dmgSkip = false;
dmgHead = 0; dmgBody = 0; dmgHands = 0; dmgLegs = 0;
dmgCap = 0.99;


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


// 0 = NATO | 1 = CSAT (get from DB, start with 100mio)
bankSafes = [100000000,100000000];
canRobBank = true;
robbedTotal = 0;

if(!isDedicated) then {
	handItem = 0;
	handItems = ["Empty Hands","Fists","Credit Card"];
	antwort = 2;
	allowTP = false;
	INV_isOpen = false;
	
	dmgSkip = false;
	dmgHead = 0; dmgBody = 0; dmgHands = 0; dmgLegs = 0;
	dmgCap = 0.99;
	
	moveBusy = ["AinvPknlMstpSnonWrflDnon_medic"];
	moveSurrender = ["amovpercmstpssurwnondnon"];
	
	furnances = ["FirePlace_burning_F","i_stone_housebig_v2"];
	
	profs = [
		["Medic","STR_prof_medic",5000,"(PLAYERDATA select 11) > 0"],
		["Judge","STR_prof_judge",30000,"(PLAYERDATA select 11) > 0"]
	];
	
	isNMayor = false;
	isCMayor = false;
	isAMayor = false;
	
	// ArmiPhone
	smsArray = [ [true, "[DEV] Armitxes", "You","Welcome to ArmiLife","ArmiLife combines all your favorite missions - redone, and more performant! ArmiLife is a journey you will never forget!",true] ];
	emMarkers = [];

	vclKeys = [];
	localSirens = [];
};
