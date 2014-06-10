library tekartik_jqm_test_lightdom_element;

import 'package:polymer/polymer.dart';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/polymer_utils.dart';
import 'package:tekartik_jquery/jquery.dart';

import 'dart:html';
/**
 * A Polymer click counter element.
 */
@CustomTag('lightdom-element')
class LightDomElement extends PolymerElement with NoShadowDom {

  LightDomElement.created() : super.created() {
    devPrint('LightDomElement.created $innerHtml');
  }
  
  @override
  attached() {
    devPrint('LightDomElement.attached1 $innerHtml');
    super.attached();
    devPrint('LightDomElement.attached2 $innerHtml');
    
  }
}
