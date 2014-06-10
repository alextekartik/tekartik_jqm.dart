library tekartik_jquerymobile;

import 'dart:js';
import 'dart:async';
import 'dart:html';
import 'package:tekartik_jquery/jquery.dart';
import 'package:tekartik_utils/js_utils.dart';
import 'package:tekartik_utils/dev_utils.dart';

export 'package:tekartik_jquery/jquery.dart';

import 'package:tekartik_utils/version.dart';

part 'src/jattributes.dart';
part 'src/jpage_element.dart';
part 'src/jpage_container.dart';
part 'src/jevent.dart';
part 'src/jpage_event.dart';


class JQueryMobile {
  JsObject jsObject;
  JQueryMobile(this.jsObject);
  
  String get _jsVersion => jsObject['version'];
  JsObject get _jsPageContainer => jsObject['pageContainer'];
  
  Version _version;
  Version get version {
    if (_version == null) {
      _version = new Version.parse(_jsVersion);
    }
    return _version;
  }
}

JsObject get _jsQueryMobile => jQuery.jsObject['mobile'];

JQueryMobile _jQueryMobile; // = jQuery.jsObject['mobile'];

JQueryMobile get jQueryMobile {
  if (_jQueryMobile == null) {
    Version jqueryVersionMin = new Version(2, 1, 0);
    if (jQuery.version < jqueryVersionMin) {
      devError("jquerymobile: invalid jQuery version '${jQuery.version}' expected min $jqueryVersionMin");
    }
    _jQueryMobile = new JQueryMobile(_jsQueryMobile);
    if (_jQueryMobile.jsObject == null) {
      devError("Missing jQueryMobile");
    }
    // test version
     Version versionMin = new Version(1, 4, 2);
     if (_jQueryMobile.version < versionMin) {
       devError("jquerymobile: invalid jQueryMobile version '${_jQueryMobile.version}' expected min $versionMin");
     }
  }
  return _jQueryMobile;
}

JPageContainer _jQueryMobilePageContainer;

JPageContainer get jQueryMobilePageContainer {
  if (_jQueryMobilePageContainer == null) {
    JsObject jsPageContainer = jQueryMobile._jsPageContainer;
    _jQueryMobilePageContainer = new JPageContainer(jsPageContainer);
  }
  return _jQueryMobilePageContainer;
}
