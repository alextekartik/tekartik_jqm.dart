part of tekartik_jquerymobile_controller;


abstract class ContainerPageFactory {
  Page createPage(String pageId);
  //PageContainer get container;
}

class PageChangeOptions {
  JPageChangeOptions jOptions;
  PageChangeOptions({bool changeHash, JTransition transition, bool reverse, dynamic param}) {
    jOptions = new JPageChangeOptions(changeHash: changeHash, //
    transition: transition != null ? transition.name : null, //
    reverse: reverse, param: param);
  }
  //  var param;
  //  Transition transition;
  //  String id;
  //  Page page;
  //  bool changeHash; // default true
}

class PageContainer {

  ContainerPageFactory pageFactory;

  // Set on first change
  String rootPageId;

  JPageContainer jPageContainer;

  Map<String, Page> pages = {};

  void register(String pageId, Page page) {
    if (page.jPage == null) {
      page._initCreate(this, pageId);
    }
  }

  void _change(String pageId, PageChangeOptions options) {
    jPageContainer.changeToPageId(pageId, options != null ? options.jOptions : null);
  }
  //  /**
  //   * TODO remove jPage?
  //   */
  //  void change({String id, JPage jPage, DivPage page, bool changeHash, String transition, dynamic param}) {
  //    jPageContainer.change(id: id, jPage: jPage, page: page, transition: transition, param: param, changeHash: changeHash);
  //  }
  //
  Page getOrCreate(String pageId) {
    if (pageId == null) {
      return null;
    }
    Page page = pages[pageId];
    if (page == null) {
      // create it (to implement in the app)
      // devPrint('Creation page $pageId');
      if (pageFactory == null) {
        if (this is ContainerPageFactory) {
          pageFactory = this as ContainerPageFactory;
        }
      }
      if (pageFactory == null) {
        throw new UnimplementedError("no template to create page '$pageId' - missing ContainerPageFactory");
      }
      page = pageFactory.createPage(pageId);
      pages[pageId] = page;
      //page = createPage(pageId);


    }
    return page;
  }

  /**
   * To override
   */
  Page createPage(String pageId) {
    throw new UnimplementedError("no template to create page '$pageId'");
  }

  void back() {
    window.history.back();
  }
  //
  void navigate(String pageId, [PageChangeOptions options]) {
    Page page = pages[pageId];
    JTransition transition;
    bool changeHash;

    // Set default options for start page
    if (options == null) {
      if (pages.length == 0) {
        options = new PageChangeOptions(changeHash: false, transition: JTransition.FADE);
      }
    }
    //
    //      }
    //    } else {
    //      // create it (to implement in the app)
    //      page = createPage(pageId);
    //    }
    // first page fade in
    _change(pageId, options);
  }

//  String getToPageId(JqmPageEvent event) {
//    String pageId = event.toPageId;
//    if (pageId == null) {
//      pageId = jPageContainer.activePage.id;
//    }
//    return pageId;
//  }
  //
  //  Page getToPage(JqmPageEvent event) {
  //    return pages[getToPageId(event)];
  //  }

  // between on hide and on show save the next page id
  String _nextPageId;
  String _prevPageId;

  PageContainer(JPageContainer jPageContainer) : this.withFactory(jPageContainer, null);
  PageContainer.withFactory(this.jPageContainer, this.pageFactory) {

    if (pageFactory == null && this is ContainerPageFactory) {
      pageFactory = this as ContainerPageFactory;
    }
    jPageContainer.onBeforeHide.listen((JPageBeforeHideEvent event) {
      _nextPageId = new JPage(event.nextPage).id;
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
      //devPrint(activePageId);

      _prevPageId = new JPage(event.prevPage).id;
      log.finest("onBeforeShow($_prevPageId->$_nextPageId) $event");
      Page prevJqmPage = getOrCreate(_prevPageId);
      if (prevJqmPage is PageHandleOnBeforeHide) {
        (prevJqmPage as PageHandleOnBeforeHide).onBeforeHide();
      }
      JPage page = event.jToPage;
      //if (pa)
      var jqmPage = pages[_nextPageId];

      if (jqmPage is PageHandleOnBeforeShow) {
        jqmPage.onBeforeShow();
      } else {
        log.fine("onBeforeShow($_nextPageId) $event");
      }
    });
    //
    //    //    jPageContainer.onCreate.listen((JPage jPage) {
    //    //      NewPage page = pages[jPage.id];
    //    //
    //    //      if (page is NewPageWithOnCreate) {
    //    //        (page as NewPageWithOnCreate).onCreate();
    //    //      } else {
    //    //        print('On Event.PAGE_CONTAINER_CREATE ' + jPage.id);
    //    //      }
    //    //    });
    //
    jPageContainer.onBeforeTransition.listen((JPageBeforeTransitionEvent event) {
      String pageId = event.toPageId;
      Page jqmPage = pages[pageId];

      if (jqmPage is PageHandleOnBeforeTransition) {
        (jqmPage as PageHandleOnBeforeTransition).onBeforeTransition(event.options.param);
      } else {
        log.fine("onBeforeShow($_nextPageId) $event");
      }
      //
      //          if (page is PageHandleOnBeforeTransition) {
      //            (page as PageHandleOnBeforeTransition).onBeforeTransition();
      //          } else {
      //            print('On Event.PAGE_CONTAINER_BEFORE_TRANSITION ${event.toPageAsString}');
      //          }
    });

    jPageContainer.onBeforeChange.listen((JPageBeforeChangeEvent event) {
      //devPrint("event: $event");

      // {type: pagebeforechange, timeStamp: 1400796025912, jQuery210010103490157052875: true, isTrigger: 3, namespace: , namespace_re: null, result: null, target: body, delegateTarget: body, currentTarget: body, handleObj: {type: pagebeforechange, origType: pagebeforechange, data: null, handler: {guid: 41}, guid: 41, selector: null, needsContext: null, namespace: }, data: null} {toPage: #test_dynamic_2, options: {reverse: false, changeHash: null, fromHashChange: false, showLoadMsg: true, allowSamePageTransition: false, transition: null, tekartik_param: null, fromPage: {0: div, length: 1, prevObject: {0: body, context: body, length: 1}, context: body}}, absUrl: http://127.0.0.1:3030/jquery_mobile/example/two_page_dynamic.html#test_dynamic_2} (:1)
      String toPageId = event.toPageId;
      String toPage = event.toPageAsString;
      log.fine("onBeforeChange($toPageId) $event ${event.options}");
      //devPrint("toPage: $toPage '$toPageId'");

      if (toPageId != null) {
        getOrCreate(toPageId);
      }

      //      if (event.jToPage is JObject) {
      //        if (event.jToPage.id == null) {
      //          // devPrint('#### null?');
      //          change(id: rootPageId);
      //          event.preventDefault();
      //          return;
      //        }
      //      }
      //      // Handle going to root
      //      // if (pages.length == 0) {
      //      if (rootPageId == null) {
      //        rootPageId = toPageId;
      //      } else if (toPageId == '') {
      //        toPageId = rootPageId;
      //      }
      //
      //      Page page = getOrCreate(toPageId);
      //      page.jPageChangeOptions = event.options;
      //
      ////      if (toPage != null) {
      ////        //devPrint("### ${toPage}");
      ////        // devPrint(window.location.href);
      ////        if (toPage == window.location.href) {
      ////          devPrint('Preventing going to ${toPage}');
      ////          event.preventDefault();
      ////        }
      ////      }
      //
      //      //          if (page is PageWithOnBeforeShow) {
      //      //            (page as PageWithOnBeforeShow).onBeforeShow();
      //      //          } else {
      //      print('On Event.PAGE_BEFORE_CHANGE ${event.toPageId}');
      //}
    });
  }


  //  Stream get onBeforeShow {
  //    StreamController controller = new StreamController();
  //
  //    jPageContainer.jsObject.callMethod('on', [Event.PAGE_CONTAINER_BEFORE_SHOW, (event, ui) {
  //        //onBeforeCreate();
  //        String activePageId = pageContainer.activePage.id;
  //        Page page = pages[activePageId];
  //
  //        if (page is PageWithOnBeforeShow) {
  //          (page as PageWithOnBeforeShow).onBeforeShow();
  //        } else {
  //          print('On _Event.PAGE_CONTAINER_BEFORE_SHOW ${activePageId}');
  //        }
  //
  //        //
  //        //        print('activePage ' + );
  //        //        print(jsObjectAsMap(ui['prevPage']));
  //        //           print('On Event.PAGE_CONTAINER_BEFORE_SHOW');
  //      }]);
  //    return controller.stream;


  //
  //  Stream get onBeforeChange {
  //      StreamController controller = new StreamController();
  //
  //      jPageContainer.jsObject.callMethod('on', [Event.PAGE_BEFORE_CHANGE, (event, ui) {
  //          //onBeforeCreate();
  //          String activePageId = pageContainer.activePage.id;
  //          Page page = pages[activePageId];
  //
  ////          if (page is PageWithOnBeforeShow) {
  ////            (page as PageWithOnBeforeShow).onBeforeShow();
  ////          } else {
  //            print('On Event.PAGE_BEFORE_CHANGE ${activePageId}');
  //          //}
  //
  //          //
  //          //        print('activePage ' + );
  //          //        print(jsObjectAsMap(ui['prevPage']));
  //          //           print('On Event.PAGE_CONTAINER_BEFORE_SHOW');
  //        }]);
  //      return controller.stream;


}
