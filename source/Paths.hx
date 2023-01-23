package;

#if sys
import sys.FileSystem;
#end

import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import openfl.utils.AssetType;
import openfl.utils.Assets as OpenFlAssets;

class Paths
{

    static final audioExtension:String = "ogg";
	inline public static var SOUND_EXT = #if web "mp3" #else "ogg" #end;

    inline static public function file(key:String, location:String, extension:String):String{

        var data:String = 'assets/$location/$key.$extension';
        /*#if override
        if(FileSystem.exists('override/$location/$key.$extension')){
            data = 'override/$location/$key.$extension';
            //trace("OVERRIDE FOR " + key + " FOUND!");
        }
        #end*/
        return data;

    }

    inline static public function image(key:String, forceLoadFromDisk:Bool = false):Dynamic{

        var data:String = file(key, "images", "png");

        if(ImageCache.exists(data) && !forceLoadFromDisk){
            //trace(key + " is in the cache");
            return ImageCache.get(data);
        }
        else{
            //trace(key + " loading from file");
            return data;
        }
            
    }

    inline static public function xml(key:String, ?location:String = "images"){
        return file(key, location, "xml");
    }

    inline static public function text(key:String, ?location:String = "data"){
        return file(key, location, "txt");
    }

    inline static public function json(key:String, ?location:String = "data"){
        return file(key, location, "json");
    }

    inline static public function sound(key:String){
        return file(key, "sounds", audioExtension);
    }

    inline static public function music(key:String){
        return file(key, "music", audioExtension);
    }
	
    inline static public function voices(key:String){
        return file("Voices", "songs/" + ${key.toLowerCase()}, audioExtension);
    }
	
    inline static public function voicesOPP(key:String){
        return file("VoicesOpp", "songs/" + ${key.toLowerCase()}, audioExtension);
    }
	
    inline static public function voicesBF(key:String){
        return file("VoicesBF", "songs/" + ${key.toLowerCase()}, audioExtension);
    }
	
    inline static public function inst(key:String){
        return file("Inst", "songs/" + ${key.toLowerCase()}, audioExtension);
    }

    inline static public function getSparrowAtlas(key:String){
        return FlxAtlasFrames.fromSparrow(image(key), xml(key));
    }

    inline static public function getPackerAtlas(key:String){
        return FlxAtlasFrames.fromSpriteSheetPacker(image(key), text(key, "images"));
    }

    inline static public function video(key:String){
        return file(key, "videos", "mp4");
    }
    
    inline static public function font(key:String, ?extension:String = "ttf"){
        return file(key, "fonts", extension);
    }

}