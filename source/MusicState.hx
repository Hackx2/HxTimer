package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.system.frontEnds.SoundFrontEnd;

class MusicState extends FlxState
{

	override public function create()
	{
        super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}

	/**
	 * Play Music!
	 * @param key Music File
	 * @param volume Volume Of The File
	 * @param looped If its looped
	 */
	function playMusic(key:String, ?volume:Int = 1, ?looped:Bool = false) {
        #if !web
            FlxG.sound.playMusic('assets/music/$key.ogg', volume, looped);
        #else
            FlxG.sound.playMusic('assets/music/$key.mp3', volume, looped);
        #end
	}

    function playSound(key:String) {
        #if !web
            FlxG.sound.playMusic('assets/sounds/$key.ogg', 1, false);
        #else
            FlxG.sound.playMusic('assets/sounds/$key.mp3', 1, false);
        #end
	}
}
