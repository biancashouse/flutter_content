// Conditional export: selects the web renderer when dart.library.js_interop
// is available (Flutter web), and the native renderer otherwise.
export 'svg_view_native.dart'
    if (dart.library.js_interop) 'svg_view_web.dart';
