class CfgPatches
{
	class ArmiLife_Items
	{
		units[] = {};
		weapons[] = { "AL_apple","AL_copper","AL_gold","AL_iron","AL_lqvehshield","AL_orange","AL_potato","AL_silver","AL_water","AL_wood" };
		requiredVersion = 1.0;
		requiredAddons[] = {};
	};
};
class CfgVehicles {};
class CfgWeapons {
	/*extern*/ class Default;
	class AL_ItemCore : Default { type = 43212; model = "\A3\Structures_F\Items\Luggage\Suitcase_F.p3d"; picture = "\A3\Weapons_F\Data\clear_empty.paa"; muzzles[] = {}; class Armory { disabled = 1; }; count = 1; };
	class AL_InventoryItem_Base { type = 401; scope = 2; mass = 0; };

	class AL_apple : AL_ItemCore {
		displayName = "Apple";
		class ItemInfo : AL_InventoryItem_Base { mass = 1; };
		picture = "\ArmiLife_Items\images\items\apple.paa";
		descriptionShort = "A yummy fruit";
	};
	class AL_copper : AL_ItemCore {
		displayName = "Copper";
		class ItemInfo : AL_InventoryItem_Base { mass = 5; };
		picture = "\ArmiLife_Items\images\items\copper.paa";
		descriptionShort = "I could use this for crafting...";
	};
	class AL_gold : AL_ItemCore {
		displayName = "Gold";
		class ItemInfo : AL_InventoryItem_Base { mass = 5; };
		picture = "\ArmiLife_Items\images\items\gold.paa";
		descriptionShort = "Completly useless material, but it shines so bright *.*";
	};
	class AL_iron : AL_ItemCore {
		displayName = "Iron";
		class ItemInfo : AL_InventoryItem_Base { mass = 3; };
		picture = "\ArmiLife_Items\images\items\iron.paa";
		descriptionShort = "It is hard. Hard is gooood";
	};
	class AL_lqvehshield: AL_ItemCore {
		displayName = "[LQ] Vehicle Shield";
		class ItemInfo : AL_InventoryItem_Base { mass = 30; };
		picture = "\ArmiLife_Items\images\items\unknown.paa";
		descriptionShort = "A low quality vehicle shield";
	};
	class AL_orange : AL_ItemCore {
		displayName = "Orange";
		class ItemInfo : AL_InventoryItem_Base { mass = 1; };
		picture = "\ArmiLife_Items\images\items\orange.paa";
		descriptionShort = "A yummy fruit";
	};
	class AL_potato : AL_ItemCore {
		displayName = "Potato";
		class ItemInfo : AL_InventoryItem_Base { mass = 1; };
		picture = "\ArmiLife_Items\images\items\potato.paa";
		descriptionShort = "Could make Mr Potatoman of it...";
	};
	class AL_silver : AL_ItemCore {
		displayName = "Silver";
		class ItemInfo : AL_InventoryItem_Base { mass = 3; };
		picture = "\ArmiLife_Items\images\items\silver.paa";
		descriptionShort = "Completly useless material, why is it so valueable?";
	};
	class AL_water : AL_ItemCore {
		displayName = "Clean Water";
		class ItemInfo : AL_InventoryItem_Base {mass = 1;};
		model = "\A3\Structures_F\Items\Food\BottlePlastic_V1_F.p3d";
		picture = "\ArmiLife_Items\images\items\water.paa";
		descriptionShort = "Drink it fast!";
	};
	class AL_wood : AL_ItemCore {
		displayName = "Wood";
		class ItemInfo : AL_InventoryItem_Base {mass = 3;};
		picture = "\ArmiLife_Items\images\items\wood.paa";
		descriptionShort = "It burns!";
	};
};