package;

import flixel.input.gamepad.FlxGamepad;
import Controls.KeyboardScheme;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.effects.FlxFlicker;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import lime.app.Application;

#if windows
import Discord.DiscordClient;
#end

using StringTools;

class CreditState extends MusicBeatState
{
	var creditsPage1:FlxTypedGroup<FlxSprite>;
	var textPage1:FlxTypedGroup<FlxSprite>;

	override function create()
	{

		if (!FlxG.sound.music.playing)
		{
			FlxG.sound.playMusic(Paths.music('freakyMenu'));
		}

		persistentUpdate = persistentDraw = true;

	    var bg:FlxSprite = new FlxSprite(-100).loadGraphic(Paths.loadImage('menuBG'));
		bg.scrollFactor.x = 0;
		bg.scrollFactor.y = 0.10;
		bg.setGraphicSize(Std.int(bg.width * 1.1));
		bg.updateHitbox();
		bg.screenCenter();
		bg.antialiasing = FlxG.save.data.antialiasing;
		add(bg);

		var icon = new FlxSprite(0, 0).loadGraphic(Paths.image('CreditIcons'));
		icon.scrollFactor.set();
		icon.antialiasing = true;
		icon.visible = true;
		icon.x = -50;
		add(icon);

		addVirtualPad(NONE, B);

		super.create();
	}

	override function update(elapsed:Float)
	{
	var movedBack:Bool = false;

	if (!movedBack)
		{
		   if (controls.BACK && !movedBack)
		  {
			  FlxG.sound.play(Paths.sound('cancelMenu'));
			  movedBack = true;
			  FlxG.switchState(new MainMenuState());
		  }
		super.update(elapsed);
	}
}
}