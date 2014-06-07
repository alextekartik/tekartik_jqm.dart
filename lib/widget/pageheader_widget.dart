library tekartik_jqm_pageheader_widget;

import 'package:tekartik_jqm/jquerymobile.dart';
import 'package:polymer/polymer.dart';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/js_utils.dart';
import 'package:tekartik_utils/polymer_utils.dart';
import 'package:tekartik_jquery/jquery.dart';
import 'widget.dart';
import 'dart:html';

/**
 * A Polymer click counter element.
 */
@CustomTag('jqm-pageheader-widget')
class JqmPageHeaderWidget extends JqmWidget {

  void page() {

  }

  JqmPageHeaderWidget.created() : super.created() {
    print('JqmPageHeaderWidget.created');
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
    devPrint('Children: $children');

    List<Element> contentElements = new List();
    for (Element child in children) {
      if (child.attributes[ATTR_DATA_ROLE] == 'header') {
        break;
      }
      contentElements.add(child);
    }

    Element headerElement = this.querySelector('[data-role="header"]');
    devPrint('Children: $children');
    if (headerElement == null) {
      devError("no header found");
    } else {
      jWidgetElement = new JElement(queryElement(headerElement));
    }
    super.attached();
    replaceContent(headerElement, contentElements);
//
//    //    //devPrint(childNodes);
//    //    devPrint(contentElement);
//
//   
//    //super.attached();
    devPrint('JqmPageHeaderWidget.attached');
    //super.attached();


  }
}
