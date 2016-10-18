class crafted_canOpener: Exile_AbstractCraftingRecipe
{
	name = "Can Opener";
	pictureItem = "Exile_Item_CanOpener";
	requiresFire = 1;
	returnedItems[] =
	{
		{1, "Exile_Item_CanOpener"}
	};
	tools[] =
	{
		"Exile_Item_Pliers"
	};
	components[] = 
	{
		{2, "Exile_Item_JunkMetal"}
	};
};