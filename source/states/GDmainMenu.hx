package states;

import flixel.addons.display.FlxBackdrop;

class GDmainMenu extends MusicBeatState
{
	var bg:FlxBackdrop;
	var title:FlxSprite;
	var BOOBAS:Float = 0;

	override function create()
	{
		bg = new FlxBackdrop(Paths.image("agdm/Background"), X, 0, 0);
		bg.scale.set(2, 2);

		title = new FlxSprite(0, 50, Paths.image("agdm/titleMenu"));
		title.scale.set(0.5, 0.5);
		title.screenCenter(X);

		add(bg);
		add(title);

		super.create();

		Conductor.bpm = 90;

		FlxG.sound.playMusic(Paths.music('agdmMenu'), 0.9);
		FlxG.sound.music.fadeIn(4, 0, 0.7);
	}

	override function update(elapsed:Float)
	{
		bg.x += 1;
		title.scale.set(BOOBAS, BOOBAS);
		super.update(elapsed);
		BOOBAS = FlxMath.lerp(BOOBAS, 0.5, elapsed * 3);
	}

	override function beatHit()
	{
		BOOBAS += 0.3;
	}
}