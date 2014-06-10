library tekartik_jqm_widget_base;

import 'package:polymer/polymer.dart';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/polymer_utils.dart';
import 'package:tekartik_jquery/jquery.dart';

import 'dart:html';

/**
 * A Polymer click counter element.
 */
@CustomTag('page-controller')
class PageController extends PolymerElement with NoShadowDom {

  PageController.created() : super.created() {
    devPrint('PageController.created');
  }

  @override
  attached() {
    super.attached();
    //devPrint(document.body.innerHtml);
    devPrint('PageController.attached ${parent}');
  }
  
  @override
    detached() {
      super.detached();
      //devPrint(document.body.innerHtml);
      devPrint('PageController.detached');
    }
}
