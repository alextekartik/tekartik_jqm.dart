library tekartik_jqm_pageheader_widget;

import 'package:tekartik_jqm/jquerymobile.dart';
import 'package:polymer/polymer.dart';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/js_utils.dart';
import 'package:tekartik_utils/polymer_utils.dart';
import 'package:tekartik_jquery/jquery.dart';
import 'package:tekartik_jqm/widget/widget.dart';
import 'dart:html';


/**
 * A Polymer click counter element.
 */
@CustomTag('jqm-pageheader')
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
    try {
      devPrint('JqmPageHeaderWidget.attaching...');
      devPrint('pageheader: $outerHtml');

      List<Node> nodes = new List();
      Element headerElement = this.querySelector('[data-role="header"]');
      if (headerElement == null) {
        return;
      }
      for (Node child in childNodes) {
        print(child);
       
        if (child == headerElement) {
          break;
        }
        nodes.add(child);
      }
      for (Node child in nodes) {
        child.remove();
      }
    
    
  
    
//    List<Node> contentElements = new List.from(children);
//    contentElements.remove(headerElement);
//    new List();
//    for (Element child in childNodes) {
//      if (child.attributes[ATTR_DATA_ROLE] == 'header') {
//        break;
//      }
//      contentElements.add(childNodes);
//    }

    
    //devPrint('Children: $children');
    //devPrint(innerHtml);
    if (headerElement == null) {
      devError("no header found");
    } else {
      headerElement.remove();
      jWidgetElement = new JElement(queryElement(headerElement));
    }
    super.attached();
    // TODO not needed to be here, can be done before
    //headerElement.parent.insertAllBefore(childNodes,  )
    replaceContentWithNodes(headerElement, nodes);
    devPrint('pageheader: ${headerElement.outerHtml}');
//
//    //    //devPrint(childNodes);
//    //    devPrint(contentElement);
//
//   
//    //super.attached();
    
    //super.attached();
    
    // in javascript we to enhanced it
    jPageElementCallEnhanceWithin(jWidgetElement);
    //jPageElementCallPage(jWidgetElement);
    devPrint('JqmPageHeaderWidget.attached');
    //jPageElementCallPage(
    } catch (e, st) {
      print("$e $st");
      throw e;
    }


  }
}
