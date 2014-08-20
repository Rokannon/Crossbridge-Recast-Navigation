# Crossbridge-Recast-Navigation
This project is a [FlasCC](http://www.adobe.com/devnet-docs/flascc/README.html) port to ActionScript 3.0 of C++ navigation mesh library [Recast Navigation](https://github.com/memononen/recastnavigation) by Mikko Mononen.

## Usage
In order to integrate the library with your project simply add `as3_lib/bin/Crossbridge-Recast-Navigation.swc` to it's library path.

## Demo
Live demo in Flash featuring some of Recast Navigation capabilities is available [here](http://work.rokannon.com/navmesh_demo/). It's source code can be found in `demo` folder.

#### How to build demo
To build demo from source you need to add `demo/src` and `demo/themes` folders to source path, add `lib` folder to library path. You can use html template from `demo/html-template` folder or use your own, but don't forget to set `wmode` parameter to `"direct"` as it is required by Starling Stage 3D rendering. Input geometry meshes are in `demo/meshes` folder.

## How  it's all organized
FlasCC compiler is used to generate swc library with internal API which is further used in final AS3 library project providing easy to understand AS3 API. Final product preserves original API as much as it's possible.

#### Internal API
Using FlasCC compiler you can manually expose C++ functions to AS3. Study [this](http://www.adobe.com/devnet-docs/flascc/docs/samples.html#T5) example to understand how it's done. Internal API creation code is in folder `as3_internal_api`. To build `as3_internal_api.swc` run `crossbridge_compile.sh` from Crossbridge environment. You can also run `crossbridge_launcher.bat` providing it with path to Crossbridge folder as an argument.

#### AS3 Library
Final AS3 library wraps internal API methods and C++ structures and classes. It creates simple AS3 classes and functions so it can be easily used in standard AS3 workflows. Most recent version of it is always available in `as3_lib/bin` folder. But you can build it yourself. You need to create an AS3 library project with source from `as3_lib` folder and add `as3_internal_api/as3_internal_api.swc` as a library. You can also add `-inline` as an additional compiler options.
