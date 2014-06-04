library tekartik_jquerymobile;

import 'dart:js';
import 'package:tekartik_jquery/jquery.dart';

part 'src/jpage_element.dart';
part 'src/jpage_container.dart';



class JQueryMobile {
  JsObject jsObject;
  JQueryMobile(this.jsObject);
}
dynamic _jQueryMobile = jQuery.jsObject['mobile'];

dynamic get jQueryMobile => _jQueryMobile;

JPageContainer _jQueryMobilePageContainer;

JPageContainer get jQueryMobilePageContainer {
  if (_jQueryMobilePageContainer == null) {
    JsObject jsPageContainer = jQueryMobile['pageContainer'];
    _jQueryMobilePageContainer = new JPageContainer(jsPageContainer);
  }
  return _jQueryMobilePageContainer;
}