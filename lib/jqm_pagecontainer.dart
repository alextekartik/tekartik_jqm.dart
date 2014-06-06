library tekartik_jqm_pagecontainer.dart;

import 'package:polymer/polymer.dart';
import 'dart:html';
import 'jqm_page.dart';
import 'package:tekartik_jqm/jquerymobile.dart';

import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/js_utils.dart';
import 'package:tekartik_utils/polymer_utils.dart';

// Depending on whether the child is create first (dartium) or second (js)
bool firstPageShown = false;

JqmPageContainer findPageContainer(Element element) {
  if (element is JqmPageContainer) {
    return element;
  }
  Element parent = element.parent;
  if (parent != null) {
    return findPageContainer(parent);
  }
  return null;
}

//import 'package:tekartik_jqm/jquerymobile.dart';
// import 'package:tekartik_jquery/jquery.dart' as jq;
/**
 * A Polymer jquerymobile pagecontainer element (for now fake)
 */
@CustomTag('jqm-pagecontainer')
class JqmPageContainer extends PolymerElement with NoShadowDom {
  //Future get whenAttached =>
  JqmPageContainer.created() : super.created() {
    devPrint('jqm-pagecontainer created');

  }

  String get activePageId {
    return jPageContainer.activePageId;
  }
  // polymer element
  Map<String, Element> pages = new Map();
  JPageContainer jPageContainer = jQueryMobilePageContainer;

  changeTo(String pageId, [JPageChangeOptions options]) {
    jPageContainer.changeToPageId(pageId, options);
    //    Element page = $[pageId];
    //    if (page != null) {
    //      jPageContainer.changeToElement(page);
    //      return true;
    //    }
    //    return false;
  }

  @override
  ready() {
    devPrint('jqm-pagecontainer ready');
    super.ready();
  }

  @override
  attached() {
    devPrint('jqm-pagecontainer attached');
    super.attached();


    // This is for javascript where pages are loaded later...
    on[JQM_PAGE_ATTACHED_EVENT_TYPE].listen((CustomEvent e) {
      print(JQM_PAGE_ATTACHED_EVENT_TYPE);
      print(e);
      print(e.detail);
      JqmPage jqmPage = e.detail;
      if (jqmPage != null) {
         String id = jqmPage.id;
         pages[id] = jqmPage;
        
        _goFirstPage();
      }
    });

    jPageContainer.onBeforeChange.listen((JPageBeforeChangeEvent event) {
      //try {
      try {
        devPrint("event: $event");
        // {type: pagebeforechange, timeStamp: 1400796025912, jQuery210010103490157052875: true, isTrigger: 3, namespace: , namespace_re: null, result: null, target: body, delegateTarget: body, currentTarget: body, handleObj: {type: pagebeforechange, origType: pagebeforechange, data: null, handler: {guid: 41}, guid: 41, selector: null, needsContext: null, namespace: }, data: null} {toPage: #test_dynamic_2, options: {reverse: false, changeHash: null, fromHashChange: false, showLoadMsg: true, allowSamePageTransition: false, transition: null, tekartik_param: null, fromPage: {0: div, length: 1, prevObject: {0: body, context: body, length: 1}, context: body}}, absUrl: http://127.0.0.1:3030/jquery_mobile/example/two_page_dynamic.html#test_dynamic_2} (:1)
        String toPageId = event.toPageId;
        String toPage = event.toPageAsString;

        if (event.jToPage == null) {
//          // If not element was passed try to find it
//          if (toPageId == null) {
//            print('null page id for ${toPageId}');
//            event.preventDefault();
//            return;
//          }
//          // find patch in main map
//          Element page = pages[toPageId];
//          if (page == null) {
//            print('Could not find page id $toPageId\nfor event $event\n$this');
//            event.preventDefault();
//          } else {
//            jPageContainer.changeToElement(page, event.options);
//          }
//          devPrint("toPage: $toPage '$toPageId'");
        } else {
          devPrint(jsRuntimeType(event.jToPage.jsObject));
        }

        //         if (event.jToPage is JObject) {
        //           if (event.jToPage.id == null) {
        //             // devPrint('#### null?');
        //             change(id: rootPageId);
        //             event.preventDefault();
        //             return;
        //           }
        //         }
        //         // Handle going to root
        //         // if (pages.length == 0) {
        //         if (rootPageId == null) {
        //           rootPageId = toPageId;
        //         } else if (toPageId == '') {
        //           toPageId = rootPageId;
        //         }
        //
        //         Page page = getOrCreate(toPageId);
        //         page.jPageChangeOptions = event.options;

        JPageChangeOptions jPageChangeOptions = event.options;

        // old     if (toPage != null) {
        //        //devPrint("### ${toPage}");
        //        // devPrint(window.location.href);
        //        if (toPage == window.location.href) {
        //          devPrint('Preventing going to ${toPage}');
        //          event.preventDefault();
        //        }
        //      }

        //          if (page is PageWithOnBeforeShow) {
        //            (page as PageWithOnBeforeShow).onBeforeShow();
        //          } else {
        print('On Event.PAGE_BEFORE_CHANGE ${event.toPageId}/${event.toPageAsString} $jPageChangeOptions');
        //      } on (Exception) catch (e) {
        //
        //         }
      } catch (e) {
        print('Exception $e');
      }

      //}
    });

    try {
      pages.addAll($);
      _goFirstPage();
    } catch (e, st) {
      print('Exception $e $st');
    }

  }

  void _goFirstPage() {
    if (!firstPageShown) {
      devPrint("pages:${pages}");
      devPrint("keys:${$.keys}");
      //devPrint(innerHtml);
      // if ($.keys.isNotEmpty) {
      if (pages.isNotEmpty) {
        String firstPageId = pages.keys.first;

        devPrint('active page id: ${activePageId}');
        if (activePageId == null) {
          firstPageShown = true;


          //var jPageElement = new JPageElement(jq.queryElement($['simple']));
          JPageChangeOptions options = new JPageChangeOptions(transition: 'fase', changeHash: true);
          //    print(options);
          //   jQueryMobilePageContainer.changeTo(jPageElement, options);
          //         jPageContainer.onBeforeChange.listen((JPageBeforeChangeEvent event) {
          //
          //         });
          changeTo(firstPageId, options);

        }


      }
    }
  }
  void onChildrenAttached() {
    devPrint('_onChildrenAttached');
    _goFirstPage();
  }

  attributeChanged(String name, String oldValue, String newValue) {
    devPrint('$name=$newValue');
    super.attributeChanged(name, oldValue, newValue);
  }
  @override
  toString() {
    return 'page container: active $activePageId';
  }
}
