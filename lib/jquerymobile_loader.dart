library tekartik_jquerymobile_loader;

import 'package:tekartik_utils/css_utils.dart';
import 'package:tekartik_utils/js_utils.dart';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/version.dart';
import 'package:tekartik_jquery/jquery.dart';
import 'package:tekartik_jquery/jquery_loader.dart';
import 'package:tekartik_jqm/jquerymobile.dart';
import 'dart:async';

Version get JQUERYMOBILE_DEFAULT_VERSION => new Version(1, 4, 2);

Future<JQueryMobile> loadJQueryMobile({Version version, Version jqueryVersion, void onMobileInit()}) {
  if (version == null) {
    version = JQUERYMOBILE_DEFAULT_VERSION;
  }

  if (jsQuery != null) {
    // already loaded?
    if (jsQueryMobile != null) {
      if (jQueryMobile.version < version) {
        devError("jQueryMobile version expected $version but currently loaded is ${jQueryMobile.version}");
      }
      return new Future.value(jQueryMobile);
    }
  }

  // load css
  return loadStylesheet('packages/tekartik_jqm_asset/jquery-mobile/$version/jquery.mobile-$version.min.css').then((_) {
    // load jquery if needed
    return loadJQuery(version: jqueryVersion);

  }).then((_) {
    //devPrint(jQuery.version);
    if (onMobileInit != null) {
      jsDocument.callMethod('on', ["mobileinit", (event_) {
          onMobileInit();
        }]);
    }

    // load jquery_mobile
    return loadJavascriptScript("packages/tekartik_jqm_asset/jquery-mobile/$version/jquery.mobile-$version.min.js");
  }).then((_) {
    bool checkPageContainer() {
      return new JElement(jQueryMobile.jsPageContainer).element != null;
    }

    // Wait until jquery mobile is loaded for good
    // One bug i've seen is that pageContainer is not valid immediately when running the page in a background tab
    // The following is false when running the tab closed
    // Typically it works after 1ms so allow this simple test 
    if (checkPageContainer()) {
      return jQueryMobile;
    } else {
      Completer completer = new Completer();

      void lazyCheck() {
        new Future.delayed(new Duration(milliseconds: 1)).then((_) {
          if (checkPageContainer()) {
            completer.complete(jQueryMobile);
          } else {
            lazyCheck();
          }
        });
      }
      lazyCheck();
      return completer.future;
    }
  });
}
