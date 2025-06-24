@JS()
library web_fullscreen_helper;

import 'package:web/web.dart' as web;
import 'dart:js_interop';

@JS('Element.prototype.requestFullscreen')
external JSFunction get _requestFullscreen;

/// Requests fullscreen mode for the entire document.
/// Works on Flutter Web with no deprecated imports.
void enterFullscreen() {
  final htmlElement = web.document.documentElement!;
  _requestFullscreen.callAsFunction(htmlElement);
}
