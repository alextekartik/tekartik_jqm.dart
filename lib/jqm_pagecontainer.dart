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

// between on hide and on show save the next page id
String _nextPageId;
String _prevPageId;

const String PAGE_CONTAINER_ON_SHOW_EVENT_TYPE = "pagecontainerbeforeshow";

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
  //List<String> pageIdStack = new List();

  Map<String, JqmPage> pages = new Map();
  String firstPageId;

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
        jqmPage.enhanced();
        String id = jqmPage.id;
        pages[id] = jqmPage;

        _goFirstPage();
      }
    });

    on[PAGE_CONTAINER_ON_SHOW_EVENT_TYPE].listen((CustomEvent e) {
      print('### $PAGE_CONTAINER_ON_SHOW_EVENT_TYPE');
      print(e);
    });

    jPageContainer.onBeforeHide.listen((JPageBeforeHideEvent event) {
      _nextPageId = new JPageElement(event.nextPage).id;
    });

    jPageContainer.onHide.listen((JPageHideEvent event) {
      var prevJqmPage = pages[_prevPageId];
      if (prevJqmPage is PageHandleOnHide) {
        prevJqmPage.onHide();
      }
    });

    jPageContainer.onShow.listen((JPageShowEvent event) {
      var nextJqmPage = pages[_nextPageId];
      if (nextJqmPage is PageHandleOnShow) {
        nextJqmPage.onShow();
      }
    });

    jPageContainer.onBeforeShow.listen((JPageBeforeShowEvent event) {
      //devPrint(event);
      //devPrint(activePageId);
      _prevPageId = new JPageElement(event.prevPage).id;
      var prevJqmPage = pages[_prevPageId];
      if (prevJqmPage is PageHandleOnBeforeHide) {
        prevJqmPage.onBeforeHide();
      }
      JPageElement pageElement = event.jToPage;
      //if (pa)
      var jqmPage = pages[_nextPageId];

      if (jqmPage is PageHandleOnBeforeShow) {
        jqmPage.onBeforeShow();
      }
    });

    jPageContainer.onBeforeChange.listen((JPageBeforeChangeEvent event) {
      //try {
      try {
        String toPageId = event.toPageId;
        String toPage = event.toPageAsString;

        //devPrint("event: pageId $toPageId, toPage:$toPage $event");
        // {type: pagebeforechange, timeStamp: 1400796025912, jQuery210010103490157052875: true, isTrigger: 3, namespace: , namespace_re: null, result: null, target: body, delegateTarget: body, currentTarget: body, handleObj: {type: pagebeforechange, origType: pagebeforechange, data: null, handler: {guid: 41}, guid: 41, selector: null, needsContext: null, namespace: }, data: null} {toPage: #test_dynamic_2, options: {reverse: false, changeHash: null, fromHashChange: false, showLoadMsg: true, allowSamePageTransition: false, transition: null, tekartik_param: null, fromPage: {0: div, length: 1, prevObject: {0: body, context: body, length: 1}, context: body}}, absUrl: http://127.0.0.1:3030/jquery_mobile/example/two_page_dynamic.html#test_dynamic_2} (:1)

        if (event.jToPage == null) {
          //devPrint("jToPage is null");
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
          // Handle going back to home
          //devPrint("jPage.id ${event.jToPage.id} $toPageId");
          if (toPageId == null) {
            print('null page id for ${toPageId}');
            jPageContainer.changeToPageId(firstPageId, event.options);
            event.preventDefault();
            return;
          }
          //devPrint(jsRuntimeType(event.jToPage.jsObject));
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
        //print('On Event.PAGE_BEFORE_CHANGE ${event.toPageId}/${event.toPageAsString} $jPageChangeOptions');
        //      } on (Exception) catch (e) {
        //
        //         }
      } catch (e) {
        print('Exception $e');
      }

      //}
    });

    try {
      //pages.addAll($);
      _goFirstPage();
    } catch (e, st) {
      print('Exception $e $st');
    }

  }

  void _goFirstPage() {
    if (!firstPageShown) {
      if (pages.isNotEmpty) {
        Polymer.onReady.then((_) {
          devPrint('Polymer.onReady');
          firstPageShown = true;

          devPrint("pages:${pages}");
          devPrint("keys:${$.keys}");
          //devPrint(innerHtml);
          // if ($.keys.isNotEmpty) {
          if (pages.isNotEmpty) {
            firstPageId = pages.keys.first;

            devPrint('active page id: ${activePageId} first: $firstPageId');

            if (activePageId == null) {
              firstPageShown = true;


              //var jPageElement = new JPageElement(jq.queryElement($['simple']));
              // don't change hash on first page
              JPageChangeOptions options = new JPageChangeOptions(transition: 'fade', changeHash: false);
              //    print(options);
              //   jQueryMobilePageContainer.changeTo(jPageElement, options);
              //         jPageContainer.onBeforeChange.listen((JPageBeforeChangeEvent event) {
              //
              //         });

              // when no id is set change to the element
              if (firstPageId == null) {
                jPageContainer.changeToElement(pages.values.first);
                return;
              }
              changeTo(firstPageId, options);

            }


          }
        });
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
