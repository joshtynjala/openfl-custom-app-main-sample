# OpenFL custom _ApplicationMain.hx_ template

The [OpenFL](https://openfl.org) library for Haxe contains a number of template files that are used when building a project. You can find them in the [_assets/templates_](https://github.com/openfl/openfl/tree/develop/assets/templates) directory. Using the `<template>` element in _project.xml_, it's possible to replace one or more of these template files with custom versions, on a per-project basis, and without forking OpenFL.

This sample project contains a directory named [_custom-templates_](https://github.com/joshtynjala/openfl-custom-app-main-sample/tree/main/custom-templates). It is configured in [_project.xml_](https://github.com/joshtynjala/openfl-custom-app-main-sample/tree/main/project.xml) like this:

```xml
<template path="custom-templates"/>
```

Inside [_custom-templates_](https://github.com/joshtynjala/openfl-custom-app-main-sample/tree/main/custom-templates), there's a file at [_haxe/ApplicationMain.hx_](https://github.com/joshtynjala/openfl-custom-app-main-sample/tree/main/custom-templates/haxe/ApplicationMain.hx). The relative path to this file matches the file named [_haxe/ApplicationMain.hx_](https://github.com/openfl/openfl/tree/develop/assets/templates/haxe/ApplicationMain.hx) inside OpenFL's [_assets/templates_](https://github.com/openfl/openfl/tree/develop/assets/templates) directory.

The custom [_haxe/ApplicationMain.hx_](https://github.com/joshtynjala/openfl-custom-app-main-sample/tree/main/custom-templates/haxe/ApplicationMain.hx) template file contains several `trace()` calls during the OpenFL initialization process. To confirm that the custom [_haxe/ApplicationMain.hx_](https://github.com/joshtynjala/openfl-custom-app-main-sample/tree/main/custom-templates/haxe/ApplicationMain.hx) is being used, compile and run this project, and check the debug console for output.

```sh
openfl test html5
```