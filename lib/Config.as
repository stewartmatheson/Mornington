package mornington.lib {

	public class Config {
		
		private static var values:Array;
		
		public static function getValue(k:Object):Object
		{
			return values[k];
		}
		
		public static function setValue(k:Object, v:Object):void
		{
			if(values == null)
				values = new Array();
			values[k] = v;
		}
		
	}
}
