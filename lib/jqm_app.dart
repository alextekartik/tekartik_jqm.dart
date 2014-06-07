import 'package:polymer/polymer.dart';

import 'dart:js';
import 'dart:html';

import 'package:tekartik_jqm/jquerymobile.dart';
import 'package:tekartik_utils/js_utils.dart';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/polymer_utils.dart';
import 'package:tekartik_jquery/jquery.dart' as jq;

export 'jqm_page.dart';
export 'jqm_pagecontainer.dart';
export 'widget/widget.dart';
export 'widget/pageheader_widget.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('jqm-app')
class JqmApp extends PolymerElement with NoShadowDom {

  Map<String, dynamic> pages = new Map();
  
  JPageContainer get pageContainer => jQueryMobilePageContainer;
  //JPageElement jPageElement;
  JqmApp.created() : super.created() {
    devPrint('JqmApp created');
  }

  @override
  void attached() {
    pageContainer.onBeforeChange.listen((JPageBeforeChangeEvent event) {
      devPrint("event: $event");
      // {type: pagebeforechange, timeStamp: 1400796025912, jQuery210010103490157052875: true, isTrigger: 3, namespace: , namespace_re: null, result: null, target: body, delegateTarget: body, currentTarget: body, handleObj: {type: pagebeforechange, origType: pagebeforechange, data: null, handler: {guid: 41}, guid: 41, selector: null, needsContext: null, namespace: }, data: null} {toPage: #test_dynamic_2, options: {reverse: false, changeHash: null, fromHashChange: false, showLoadMsg: true, allowSamePageTransition: false, transition: null, tekartik_param: null, fromPage: {0: div, length: 1, prevObject: {0: body, context: body, length: 1}, context: body}}, absUrl: http://127.0.0.1:3030/jquery_mobile/example/two_page_dynamic.html#test_dynamic_2} (:1)
      String toPageId = event.toPageId;
      String toPage = event.toPageAsString;
      devPrint("toPage: $toPage '$toPageId'");

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
      print('On Event.PAGE_BEFORE_CHANGE ${event.toPageId} $jPageChangeOptions');
      //}
    });


  }
}
