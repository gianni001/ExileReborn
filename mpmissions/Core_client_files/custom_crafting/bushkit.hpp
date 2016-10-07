class CraftBushKit: Exile_AbstractCraftingRecipe
{
	name = "Craft bush kit";
	pictureItem = "Exile_Item_BushKit_Green";
	returnedItems[] =
	{
		{1, "Exile_Item_BushKit_Green"}
	};
	tools[] =
	{
		"Exile_Item_Pliers"
	};
	components[] = 
	{
		{8, "Exile_Item_Leaves"},
		{4, "Exile_Item_WoodSticks"},
		{1, "Exile_Item_Rope"}
	};
};