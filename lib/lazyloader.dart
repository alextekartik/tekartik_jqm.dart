import 'package:tekartik_utils/css_utils.dart';
import 'package:tekartik_utils/js_utils.dart';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/version.dart';
import 'package:tekartik_jquery/jquery.dart';
import 'package:tekartik_jqm/jquerymobile.dart';
import 'package:polymer/init.dart' as init;
import 'dart:async';
import 'dart:html';

// Polymer lazyloader

Future load() {
  Version jqmVersion = new Version(1, 4, 2);
    Version jqVersion = new Version(2, 1, 0);
    // load css
    return loadStylesheet('packages/tekartik_jqm_asset/jquery-mobile/$jqmVersion/jquery.mobile-$jqmVersion.min.css').then((_) {
      // load jquery
      return loadJavascriptScript("packages/tekartik_jquery_asset/jquery/$jqVersion/jquery-$jqVersion.min.js");
    }).then((_) {
      //devPrint(jQuery.version);
      jsDocument.callMethod('on', ["mobileinit", (event_) {
              //onBeforeCreate();
              //devPrint('mobileinit $event_');
              //devPrint('beforeShow2');
            }]);
      // load jquery_mobile
      return loadJavascriptScript("packages/tekartik_jqm_asset/jquery-mobile/$jqmVersion/jquery.mobile-$jqmVersion.min.js");
    }).then((_) {
      //devPrint(jQueryMobile.version);
      //jElement(document.body)
      
      devPrint("done loading css");
      
    });
}
void main() {
  load().then((_) {
    init.main();
  });
}