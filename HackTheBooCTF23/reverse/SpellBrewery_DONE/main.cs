// SpellBrewery.Brewery
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.CompilerServices;
using System.Text;
using SpellBrewery;

internal class Brewery
{
	private static readonly string[] IngredientNames = new string[106]
	{
		"Witch's Eye", "Bat Wing", "Ghostly Essence", "Toadstool Extract", "Vampire Blood", "Mandrake Root", "Zombie Brain", "Ghoul's Breath", "Spider Venom", "Black Cat's Whisker",
		"Werewolf Fur", "Banshee's Wail", "Spectral Ash", "Pumpkin Spice", "Goblin's Earwax", "Haunted Mist", "Wraith's Tear", "Serpent Scale", "Moonlit Fern", "Cursed Skull",
		"Raven Feather", "Wolfsbane", "Frankenstein's Bolt", "Wicked Ivy", "Screaming Banshee Berry", "Mummy's Wrappings", "Dragon's Breath", "Bubbling Cauldron Brew", "Gorehound's Howl", "Wraithroot",
		"Haunted Grave Moss", "Ectoplasmic Slime", "Voodoo Doll's Stitch", "Bramble Thorn", "Hocus Pocus Powder", "Cursed Clove", "Wicked Witch's Hair", "Halloween Moon Dust", "Bog Goblin Slime", "Ghost Pepper",
		"Phantom Firefly Wing", "Gargoyle Stone", "Zombie Toenail", "Poltergeist Polyp", "Spectral Goo", "Salamander Scale", "Cursed Candelabra Wax", "Witch Hazel", "Banshee's Bane", "Grim Reaper's Scythe",
		"Black Widow Venom", "Moonlit Nightshade", "Ghastly Gourd", "Siren's Song Seashell", "Goblin Gold Dust", "Spider Web Silk", "Haunted Spirit Vine", "Frog's Tongue", "Mystic Mandrake", "Widow's Peak Essence",
		"Wicked Warlock's Beard", "Crypt Keeper's Cryptonite", "Bewitched Broomstick Bristle", "Dragon's Scale Shimmer", "Vampire Bat Blood", "Graveyard Grass", "Halloween Harvest Pumpkin", "Cursed Cobweb Cotton", "Phantom Howler Fur", "Wraithbone",
		"Goblin's Green Slime", "Witch's Brew Brew", "Voodoo Doll Pin", "Bramble Berry", "Spooky Spellbook Page", "Halloween Cauldron Steam", "Spectral Spectacles", "Salamander's Tail", "Cursed Crypt Key", "Pumpkin Patch Spice",
		"Haunted Hay Bale", "Banshee's Bellflower", "Ghoulish Goblet", "Frankenstein's Lab Liquid", "Zombie Zest Zest", "Werewolf Whisker", "Gargoyle Gaze", "Black Cat's Meow", "Wolfsbane Extract", "Goblin's Gold",
		"Phantom Firefly Fizz", "Spider Sling Silk", "Widow's Weave", "Wraith Whisper", "Siren's Serenade", "Moonlit Mirage", "Spectral Spark", "Dragon's Roar", "Banshee's Banshee", "Witch's Whisper",
		"Ghoul's Groan", "Toadstool Tango", "Vampire's Kiss", "Bubbling Broth", "Mystic Elixir", "Cursed Charm"
	};

	private static readonly string[] correct = new string[36]
	{
		"Phantom Firefly Wing", "Ghastly Gourd", "Hocus Pocus Powder", "Spider Sling Silk", "Goblin's Gold", "Wraith's Tear", "Werewolf Whisker", "Ghoulish Goblet", "Cursed Skull", "Dragon's Scale Shimmer",
		"Raven Feather", "Dragon's Scale Shimmer", "Zombie Zest Zest", "Ghoulish Goblet", "Werewolf Whisker", "Cursed Skull", "Dragon's Scale Shimmer", "Haunted Hay Bale", "Wraith's Tear", "Zombie Zest Zest",
		"Serpent Scale", "Wraith's Tear", "Cursed Crypt Key", "Dragon's Scale Shimmer", "Salamander's Tail", "Raven Feather", "Wolfsbane", "Frankenstein's Lab Liquid", "Zombie Zest Zest", "Cursed Skull",
		"Ghoulish Goblet", "Dragon's Scale Shimmer", "Cursed Crypt Key", "Wraith's Tear", "Black Cat's Meow", "Wraith Whisper"
	};

	private static readonly List<Ingredient> recipe = new List<Ingredient>();

	private static void Main()
	{
		while (true)
		{
			switch (Menu.RunMenu())
			{
			case Menu.Choice.ListIngredients:
				ListIngredients();
				break;
			case Menu.Choice.DisplayRecipe:
				DisplayRecipe();
				break;
			case Menu.Choice.AddIngredient:
				AddIngredient();
				break;
			case Menu.Choice.BrewSpell:
				BrewSpell();
				break;
			case Menu.Choice.ClearRecipe:
				ClearRecipe();
				break;
			}
		}
	}

	private static void ListIngredients()
	{
		for (int i = 0; i < IngredientNames.Length; i++)
		{
			Console.Write(IngredientNames[i] ?? "");
			if (i + 1 < IngredientNames.Length)
			{
				Console.Write(", ");
			}
			if (i % 6 == 5)
			{
				Console.Write("\n");
			}
		}
		Console.Write("\n");
	}

	private static void DisplayRecipe()
	{
		if (recipe.get_Count() == 0)
		{
			Console.WriteLine("There are no current ingredients");
		}
		else
		{
			Console.WriteLine(string.Join<Ingredient>(", ", (System.Collections.Generic.IEnumerable<Ingredient>)recipe));
		}
	}

	private static void AddIngredient()
	{
		Console.Write("What ingredient would you like to add? ");
		string text;
		while (true)
		{
			text = Console.ReadLine();
			if (Enumerable.Contains<string>((System.Collections.Generic.IEnumerable<string>)IngredientNames, text))
			{
				break;
			}
			Console.WriteLine("Invalid ingredient name");
		}
		recipe.Add(new Ingredient(text));
		string text2 = ("aeiou".Contains(char.ToLower(text.get_Chars(0))) ? "an" : "a");
		DefaultInterpolatedStringHandler val = default(DefaultInterpolatedStringHandler);
		((DefaultInterpolatedStringHandler)(ref val))..ctor(41, 2);
		((DefaultInterpolatedStringHandler)(ref val)).AppendLiteral("The cauldron fizzes as you toss in ");
		((DefaultInterpolatedStringHandler)(ref val)).AppendFormatted(text2);
		((DefaultInterpolatedStringHandler)(ref val)).AppendLiteral(" '");
		((DefaultInterpolatedStringHandler)(ref val)).AppendFormatted(text);
		((DefaultInterpolatedStringHandler)(ref val)).AppendLiteral("'...");
		Console.WriteLine(((DefaultInterpolatedStringHandler)(ref val)).ToStringAndClear());
	}

	private static void BrewSpell()
	{
		if (recipe.get_Count() < 1)
		{
			Console.WriteLine("You can't brew with an empty cauldron");
			return;
		}
		byte[] array = Enumerable.ToArray<byte>(Enumerable.Select<Ingredient, byte>((System.Collections.Generic.IEnumerable<Ingredient>)recipe, (Func<Ingredient, byte>)((Ingredient ing) => (byte)(System.Array.IndexOf<string>(IngredientNames, ((object)ing).ToString()) + 32))));
        
		if (Enumerable.SequenceEqual<Ingredient>((System.Collections.Generic.IEnumerable<Ingredient>)recipe, Enumerable.Select<string, Ingredient>((System.Collections.Generic.IEnumerable<string>)correct, (Func<string, Ingredient>)((string name) => new Ingredient(name)))))
		{
			Console.WriteLine("The spell is complete - your flag is: " + Encoding.get_ASCII().GetString(array));
			Environment.Exit(0);
		}
		else
		{
			Console.WriteLine("The cauldron bubbles as your ingredients melt away. Try another recipe.");
		}
	}

	private static void ClearRecipe()
	{
		recipe.Clear();
		Console.WriteLine("You pour the cauldron down the drain. A fizzing noise and foul smell rises from it...");
	}
}
