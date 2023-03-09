import openfl.display.Application;
import lime.ui.Window;
import openfl.events.Event;
import openfl.display.Sprite;

@:access(lime.system.System)
class ApplicationMain {
	// the standard Haxe entry point
	public static function main()
	{
		lime.system.System.__registerEntryPoint("::APP_FILE::", create);
		#if !html5
		create(null);
		#end
	}

	private static function create(config):Void
	{
		var app = createApp();
		createWindows(app, config);
		createDocumentClass(app.window);
		app.window.stage.color = 0xffffff;

		var result = app.exec();
		#if (sys && !ios)
		lime.system.System.exit(result);
		#end
	}

	private static function createApp():Application {
		trace("creating app");
		var app = new Application();
		app.meta["build"] = "::meta.buildNumber::";
		app.meta["company"] = "::meta.company::";
		app.meta["file"] = "::APP_FILE::";
		app.meta["name"] = "::meta.title::";
		app.meta["packageName"] = "::meta.packageName::";
		app.meta["version"] = "::meta.version::";
		return app;
	}

	private static function createWindows(app:Application, config:Dynamic):Void {
		trace("creating windows");
		#if !flash
		::foreach windows::
		var attributes:lime.ui.WindowAttributes = {
			allowHighDPI: ::allowHighDPI::,
			alwaysOnTop: ::alwaysOnTop::,
			borderless: ::borderless::,
			element: null,
			frameRate: ::fps::,
			#if !web fullscreen: ::fullscreen::, #end
			height: ::height::,
			hidden: ::hidden::,
			maximized: ::maximized::,
			minimized: ::minimized::,
			parameters: ::parameters::,
			resizable: ::resizable::,
			title: "::title::",
			width: ::width::,
			x: ::x::,
			y: ::y::,
			context: {
				antialiasing: ::antialiasing::,
				background: ::background::,
				colorDepth: ::colorDepth::,
				depth: ::depthBuffer::,
				hardware: ::hardware::,
				stencil: ::stencilBuffer::,
				type: null,
				vsync: ::vsync::
			}
		};
		if (app.window == null)
		{
			if (config != null)
			{
				for (field in Reflect.fields(config))
				{
					if (Reflect.hasField(attributes, field))
					{
						Reflect.setField(attributes, field, Reflect.field(config, field));
					}
					else if (Reflect.hasField(attributes.context, field))
					{
						Reflect.setField(attributes.context, field, Reflect.field(config, field));
					}
				}
			}

			#if sys
			lime.system.System.__parseArguments(attributes);
			#end
		}
		app.createWindow(attributes);
		::end::
		#elseif !air
		app.window.context.attributes.background = ::WIN_BACKGROUND::;
		app.window.frameRate = ::WIN_FPS::;
		#end
	}

	private static function createDocumentClass(window:Window):Void {
		trace("creating document class");
		new DocumentClass(cast window.stage.getChildAt(0));
	}
}

class DocumentClass extends ::APP_MAIN:: {
	public function new(parent:Sprite) {
		parent.addChild(this);
		super();
		dispatchEvent(new Event(Event.ADDED_TO_STAGE, false, false));
	}
}