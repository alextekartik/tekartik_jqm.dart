library tekartik_jqm_page;

import 'package:polymer/polymer.dart';
import 'dart:html';

import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/polymer_utils.dart';
import 'package:tekartik_jqm/jquerymobile.dart';
import 'package:tekartik_jqm/jquerymobile.dart';

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
    print('created');
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

    //
    //JsObject jsObject = jq.jElement(firstChild as Element).jsObject;//jElement(querjq.queryElement($['simple']);
    //    Element jqmPageElement = querySelector(".ui-page");

    //devPrint(jsObjectAsMap(jsObject));
    //  devPrint('### $jqmPageElement');
    // detached content right away
    Element pageElement = shadowRoot.querySelector('[data-role="page"]');

    // if not found create it
    if (pageElement == null) {
      // search in content also
      pageElement = this.querySelector('[data-role="page"]');
      if (pageElement == null) {
        pageElement = new DivElement()
            ..attributes[ATTR_DATA_ROLE] = DATA_ROLE_PAGE
            ..id = id;
        pageElement.children.addAll(shadowRoot.children);
        pageElement.children.addAll(children);
      }
    }
    // devPrint(pageElement.innerHtml);
    document.body.children.insert(0, pageElement);
    //devPrint(document.body.innerHtml);

    JPageElement jPage = new JPageElement(jElement(pageElement).jsObject);
    //jPage.element.attributes['data-url'] = '#id';
    jPageElement = jPage..page();

    // Import for js to add the page
    // This is done automatically for JqmPage object
    asyncFire(JQM_PAGE_ATTACHED_EVENT_TYPE, detail: this);
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
}
