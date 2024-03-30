package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.system.frontEnds.SoundFrontEnd;

class MusicState extends FlxState
{
	inline static final SOUND_EXT:String = #if !web 'ogg' #else 'mp3' #end;

	override public function create()
	{
		if (FlxG.save.data.muted != null)
			FlxG.sound.muted = FlxG.save.data.muted;
		if (FlxG.save.data.volume != null)
			FlxG.sound.volume = FlxG.save.data.volume;
		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	/**
	 * Save Variables
	 */
	function save()
	{
		FlxG.save.data.muted = FlxG.sound.muted;
		FlxG.save.data.volume = FlxG.sound.volume;
	}

	/**
	 * Play Music!
	 * @param key Music File
	 * @param volume Volume Of The File
	 * @param looped If its looped
	 */
	function playMusic(key:String, ?volume:Int = 1, ?looped:Bool = false)
	{
		FlxG.sound.playMusic('assets/music/$key.$SOUND_EXT', volume, looped);
	}

	/**
	 * Play a Sound!
	 * @param key Sound File
	 * @param volume Volume Of The File
	 * @param looped If its looped
	 */
	function playSound(key:String, ?volume:Float = 1, ?looped:Bool = false)
	{
		FlxG.sound.play('assets/sounds/$key.$SOUND_EXT', volume, false);
	}
}
