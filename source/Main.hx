package;

import flixel.FlxState;
import flixel.FlxGame;
import openfl.display.Sprite;
import openfl.display.FPS;
import lime.app.Application;
import flixel.FlxG;

class Main extends Sprite
{
	public static var gameWidth:Int = 500; // Width of the game in pixels (might be less / more in actual pixels depending on your zoom).
	public static var gameHeight:Int = 500; // Height of the game in pixels (might be less / more in actual pixels depending on your zoom).

	var initialState:Class<FlxState> = PlayState; // The FlxState the game starts with.

	public static var framerate:Int = 240; // How many frames per second the game should run at.

	var skipSplash:Bool = true; // Whether to skip the flixel splash screen that appears in release mode.

	public function new()
	{
		super();
		addChild(new FlxGame(gameWidth, gameHeight, initialState, framerate, framerate, skipSplash));
		addChild(new FPS(10, 10, 0xffffff));
	}
}
