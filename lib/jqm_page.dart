library tekartik_jqm_page;

import 'package:polymer/polymer.dart';
import 'dart:html';
import 'widget/widget.dart';
import 'widget/pageheader_widget.dart';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/polymer_utils.dart';
import 'package:tekartik_jqm/jquerymobile.dart';
import 'package:tekartik_jquery/jquery.dart';

// the detail is the PolymerElement element (typically a JqmPage)
const String JQM_PAGE_ATTACHED_EVENT_TYPE = "tekartik_jqm_page_attached";

const String DATA_ROLE_PAGE = r'page';

//JPageElement findJPageElement(Polymer top) {
//  //JsObject jsObject = jq.jElement(firstChild as Element).jsObject;//jElement(querjq.queryElement($['simple']);
//  Element jqmPageElement = top.querySelector('[data-role="page"]');
//  devPrint('YES${jqmPageElement}');
//  if (jqmPageElement == null) {
//    return null;
//  }
//  JPageElement jPageElement = new JPageElement(jElement(jqmPageElement).jsObject);
//  devPrint('YES${jqmPageElement}');
//  return jPageElement;
//}

//devPrint(jsObjectAsMap(jsObject));

abstract class PageHandleOnShow {
  void onShow();
}

abstract class PageHandleOnBeforeShow {
  void onBeforeShow();
}

abstract class PageHandleOnBeforeHide {
  void onBeforeHide();
}

abstract class PageHandleOnHide {
  void onHide();
}

/**
 * A Polymer click counter element.
 */
@CustomTag('jqm-page')
class JqmPage extends PolymerElement {

  /**
   * smart id getter
   * can get from polymer element or from container
   */
  String get id {
    if (super.id != null && super.id.isNotEmpty) {
      return super.id;
    } else if (jPageElement != null) {
      return jPageElement.id;
    }
    return super.id;
  }

  JPageElement jPageElement;
  JqmPage.created() : super.created() {
    print('JqmPage.created');
  }

  //  //This enables the bootstrap javascript to see the elements
  //  @override
  //  Node shadowFromTemplate(Element template) {
  //    var dom = instanceTemplate(template);
  //    append(dom);
  //    shadowRootReady(this, template);
  //    return null; // no shadow here, it's all bright and shiny
  //  }

  void enhance() {
    jPageElement.page();
    //jPageElement.enhanceWithin();
  }

  void replaceContent(Element parent, List<Element> elements) {
    Element contentElement = parent.querySelector('content');
    if (contentElement != null) {
      Element parent = contentElement.parent;
      int index = parent.children.indexOf(contentElement);
      parent.children.removeAt(index);
      //parent.children.insertAll(index, elements);
      for (Element element in elements) {
        parent.children.insert(index++, element);
      }
    }
  }
  
  void replaceContentWithNodes(Element parent, List<Node> elements) {
        Element contentElement = parent.querySelector('content');
        if (contentElement != null) {
          Element parent = contentElement.parent;
          parent.insertAllBefore(elements, contentElement);
          contentElement.remove();
//        int index = parent.children.indexOf(contentElement);
//        parent.children.removeAt(index);
//        //parent.children.insertAll(index, elements);
//        for (Element element in elements) {
//          parent.children.insert(index++, element);
//        }
        }
      }


  @override
  attached() {
  devPrint('JqmPage.attached');
    super.attached();


    if (id.isEmpty) {
      devError("id cannot be empty  ${outerHtml}");
    }
    //    // This is for javascript where pages are loaded later...
    //    on[JQM_WIDGET_ATTACHED_EVENT_TYPE].listen((CustomEvent e) {
    //      print(JQM_WIDGET_ATTACHED_EVENT_TYPE);
    //      print(e);
    //      print(e.detail);
    //      JqmWidget widget = e.detail;
    //      if (widget is JqmPageHeaderWidget) {
    //        widget.page();
    //
    //      }
    //    });

    // Wait for all the changes to be made
    Polymer.onReady.then((_) {
        //devPrint("JqmPage: ${innerHtml}");


 //     Element pageElement = this.querySelector('[data-role="page"]');

//      //
//      //JsObject jsObject = jq.jElement(firstChild as Element).jsObject;//jElement(querjq.queryElement($['simple']);
//      //    Element jqmPageElement = querySelector(".ui-page");
//      //String content = innerHtml;
//      //devPrint(innerHtml);
//      //  devPrint('### $jqmPageElement');
//      // detached content right away
      Element pageElement = shadowRoot.querySelector('[data-role="page"]');

      // if not found create it
      if (pageElement == null) {
        
        //
        // search in content also
        pageElement = this.querySelector('[data-role="page"]');
        if (pageElement == null) {
         
         
        }
      }
      if (pageElement != null) {
        devError('found date-role=page in ${outerHtml} - please remove');
      }
      
      
               pageElement = new DivElement()
                   ..attributes[ATTR_DATA_ROLE] = DATA_ROLE_PAGE
                   ..id = id;
               pageElement.children.addAll(shadowRoot.children);
               
               replaceContent(pageElement, children);
             
      //devError("temp");
      //devPrint(pageElement.innerHtml);

//      // Find content
//      List<Element> contentElements = new List();
//      for (Element child in children) {
//        if (child.attributes[ATTR_DATA_ROLE] == 'page') {
//          break;
//        }
//        contentElements.add(child);
//      }
//      replaceContent(pageElement, contentElements);
//      pageElement.id = id;
//      // Also chage our own id
//      // Otherwise we have 2 items with the same id
//      // jqm 1.4.2 does not like that (jqm_page_test.html)
//      // if the content is a direct body child
//      if (parent == document.body) {
//        id = "jqm-page-$id";
//      }

      //devPrint(pageElement.innerHtml);
              // devPrint(pageElement.outerHtml);
      document.body.children.insert(0, pageElement);


      JPageElement jPage = new JPageElement(jElement(pageElement).jsObject);
      //jPage.element.attributes['data-url'] = '#id';
      jPageElement = jPage;

      if (jPageElement.isEnhanced) {
        devError("weird page is already enhanced... ${pageElement.innerHtml}");
      }
      enhance();

      // Import for js to add the page
      // This is done automatically for JqmPage object
      asyncFire(JQM_PAGE_ATTACHED_EVENT_TYPE, detail: this);
    });
  }
  //This enables the styling via bootstrap.css
  // bool get applyAuthorStyles => true;

  //TODO remove
  String get checkedId {
    //    String polymerId = this.id;
    //
    //          if (polymerId != id) {
    //            if (polymerId != null && polymerId.length > 0) {
    //              if (id != null && id.length > 0) {
    //              throw new UnsupportedError("page ${pagePolymer} has conflicting id '$polymerId' inner '$id'");
    //              }
    //              // else ok outer wins
    //              id = polymerId;
    //              pageElement.element.id = id;
    //
    //            } else {
    //              // outer wins
    //            }
    //
    //          } else {
    //            if (id == null || id.isEmpty) {
    //              throw new UnsupportedError("page ${pagePolymer} must have an id");
    //            }
    //          }
  }
  
  /**
   * null if not found
   */
  Element find(String selector) {
    return jPageElement.element.querySelector(selector); 
  }

  /**
   * Get by id
   */
  JListView getListView(String id) => new JListView.fromElement($[id]);
  JListView findListView(String selector) => new JListView.fromElement(find(selector));
}
