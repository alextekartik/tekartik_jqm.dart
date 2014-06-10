library tekartik_jqm_widget_base;

import 'package:polymer/polymer.dart';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/polymer_utils.dart';
import 'package:tekartik_jquery/jquery.dart';

import 'dart:html';

// the detail is the PolymerElement element (typically a JqmPage)
const String JQM_WIDGET_ATTACHED_EVENT_TYPE = "tekartik_jqm_widget_attached";

/**
 * A Polymer click counter element.
 */
@CustomTag('jqm-widget-base')
class JqmWidgetBase extends PolymerElement with NoShadowDom {

  //bool get applyAuthorStyles => true;
  JElement jWidgetElement;
  bool isAttached = false;
  JqmWidgetBase.created() : super.created() {
    devPrint('JqmWidget.created');
  }

  void replaceContent(Element parent, List<Element> elements) {
    Element contentElement = parent.querySelector('content');
    if (contentElement != null) {
      Element parent = contentElement.parent;
      int index = parent.children.indexOf(contentElement);
      parent.children.removeAt(index);
      //parent.children.insertAll(index, elements);
      for (Element element in elements) {
        //if (contentElement.anc)
        parent.children.insert(index++, element);
      }
    }
  }
  
//  void replaceContentWithNodes(Element parent, List<Node> elements) {
//      Element contentElement = parent.querySelector('content');
//      if (contentElement != null) {
//        Element parent = contentElement.parent;
//        int index = parent.children.indexOf(contentElement);
//        parent.children.removeAt(index);
//        //parent.children.insertAll(index, elements);
//        for ( Node element in elements) {
//          parent.childNodes.insert(index++, element);
//        }
//      }
//    }
  onAttached() {

  }
  //  Node shadowFromTemplate(Element template) {
  //    PolymerElement.shadowFromTemplate(template);
  //      var dom = instanceTemplate(template);
  //      append(dom);
  //      shadowRootReady(this as Node, template);
  //      return null; // no shadow here, it's all bright and shiny
  //    }
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
    devPrint(innerHtml);
    if (jWidgetElement == null) {
      devError("jWidgetElement must be set by parent");
    }
    isAttached = true;
    super.attached();
    devPrint('JqmWidget.attached');
    // Import for js to add the page
    // This is done automatically for JqmPage object
    asyncFire(JQM_WIDGET_ATTACHED_EVENT_TYPE, detail: this);
  }

  @override
  detached() {
    isAttached = false;
    super.detached();
  }
}
