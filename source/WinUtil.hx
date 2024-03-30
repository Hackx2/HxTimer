#if (windows && cpp)
@:buildXml('
<target id="haxe">
    <lib name="dwmapi.lib" if="windows" />
</target>
')
@:headerCode('#include <dwmapi.h>')
#end
class WinUtil
{
	#if (windows && cpp)
	/**
	 * Change the Window Theme to Dark Mode
	 */
	@:functionCode('
        int darkMode = enabled ? 1 : 0;
        HWND window = GetActiveWindow();
        if (S_OK != DwmSetWindowAttribute(window, 19, &darkMode, sizeof(darkMode)))
            DwmSetWindowAttribute(window, 20, &darkMode, sizeof(darkMode));
        UpdateWindow(window);
    ')
	public static function setDarkMode(enabled:Bool)
	{
		lime.app.Application.current.window.borderless = true;
		lime.app.Application.current.window.borderless = false;
	}
	#end
}
