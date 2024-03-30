package;

import openfl.display.Application;
import flixel.ui.FlxButton;
import flixel.FlxG;
import flixel.FlxGame;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.text.FlxText;
import flixel.FlxState;
import lime.app.Application;
import WinUtil;

class PlayState extends MusicState
{
	private var currentTime:FlxText;
	private var muteButton:FlxButton;
	private var versionTxt:FlxText;

	override public function create()
	{
		super.create();

		#if (windows && cpp)
		WinUtil.setDarkMode(true);
		#end

		playMusic('MainMusic', 1, true);

		var bg:FlxSprite;
		bg = new FlxSprite().loadGraphic('assets/images/bgs/new.jpg');
		bg.updateHitbox();
		bg.screenCenter();
		bg.setGraphicSize(Main.gameWidth, Main.gameHeight);
		bg.antialiasing = true;
		add(bg);

		currentTime = new FlxText(90, 90);
		currentTime.setFormat('assets/fonts/vcr.ttf', 50);
		currentTime.alignment = CENTER;
		currentTime.color = FlxColor.WHITE;
		currentTime.borderStyle = FlxTextBorderStyle.OUTLINE;
		currentTime.borderColor = FlxColor.BLACK;
		add(currentTime);

		versionTxt = new FlxText(10, 475, 0, "Version • " + Application.current.meta.get('version'), 20);
		versionTxt.font = 'assets/fonts/vcr.ttf';
		versionTxt.alignment = CENTER;
		add(versionTxt);

		muteButton = new FlxButton(210, 400, "Mute", function()
		{
			mute();
		});
		muteButton.color = FlxG.sound.muted ? FlxColor.RED : FlxColor.WHITE;
		save();
		add(muteButton);
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);

		if (FlxG.keys.justPressed.PLUS || FlxG.keys.justPressed.MINUS)
			save();
		currentTime.text = DateTools.format(Date.now(), "%r");
	}

	private function mute()
	{
		FlxG.sound.muted = !FlxG.sound.muted;
		muteButton.color = FlxG.sound.muted ? FlxColor.RED : FlxColor.WHITE;
		save();
	}
}
