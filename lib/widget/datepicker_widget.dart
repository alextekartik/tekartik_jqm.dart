library tekartik_jqm_datepicker_widget;

import 'package:polymer/polymer.dart';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/polymer_utils.dart';

import 'dart:html';

/**
 * A Polymer click counter element.
 */
@CustomTag('jqm-datepicker-widget')
class JqmDatePickerWidget extends PolymerElement with NoShadowDom {
  
  JqmDatePickerWidget.created() : super.created() {
      print('JqmDatePickerWidget.created');
    }

    //  //This enables the bootstrap javascript to see the elements
    //  @override
    //  Node shadowFromTemplate(Element template) {
    //    var dom = instanceTemplate(template);
    //    append(dom);
    //    shadowRootReady(this, template);
    //    return null; // no shadow here, it's all bright and shiny
    //  }

    @override
    attached() {
      super.attached();
      devPrint('JqmDatePickerWidget.attached');
    }
}