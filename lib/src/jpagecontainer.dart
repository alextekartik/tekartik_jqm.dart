part of tekartik_jquerymobile;

class JPageContainer extends JElement {
  // For documents
  static final String PAGE_BEFORE_CHANGE = 'pagebeforechange';

  static final String PAGE_BEFORE_SHOW = 'pagecontainerbeforeshow';
  static final String PAGE_SHOW = 'pagecontainershow';
  static final String PAGE_BEFORE_HIDE = 'pagecontainerbeforehide';
  // before transition called before "before hide & before show"
  static final String PAGE_BEFORE_TRANSITION = 'pagecontainerbeforetransition';
  static final String PAGE_HIDE = 'pagecontainerhide';

  JPageContainer(jsPageContainer) : super(jsPageContainer);

  String get activePageId {
    return _callPageContainer(['getActivePage'])['id'];
  }

  JPage get activePage {
    return new JPage(_callPageContainer(['getActivePage'])['id']);
  }

  _callPageContainer(List args) {
    return jsObject.callMethod('pagecontainer', args);
  }

  _changeTo(dynamic target, [JPageChangeOptions options]) {
    JsObject jsOptions;
    if (options != null) {
      jsOptions = new JsObject.jsify(options.toMap());
    }
    devPrint(jsObjectOrAnyToDebugString(target));

    _callPageContainer(['change', target, jsOptions]);
  }
  changeTo(JPageElement jPageElement, [JPageChangeOptions options]) {
    _changeTo(jPageElement.jsObject, options);
  }

  Stream<JPageBeforeShowEvent> get onBeforeShow {
    StreamController<JPageBeforeShowEvent> controller = new StreamController(sync: true);

    jsObject.callMethod('on', [PAGE_BEFORE_SHOW, (event_, ui_) {
        //onBeforeCreate();
        //devPrint('beforeShow $ui_');
        JPageBeforeShowEvent event = new JPageBeforeShowEvent(event_, ui_);
        controller.add(event);
        //devPrint('beforeShow2');
      }]);
    return controller.stream;
  }

  Stream<JPageBeforeTransitionEvent> get onBeforeTransition {
    StreamController<JPageBeforeTransitionEvent> controller = new StreamController(sync: true);

    jsObject.callMethod('on', [PAGE_BEFORE_TRANSITION, (event_, ui_) {
        devPrint('onBeforeTransition $ui_ $event_');
        JPageBeforeTransitionEvent event = new JPageBeforeTransitionEvent(event_, ui_);
        devPrint('onBeforeTransition ${event}');
        controller.add(event);
      }]);
    return controller.stream;
  }

  Stream<JPageShowEvent> get onShow {
    StreamController<JPageShowEvent> controller = new StreamController(sync: true);

    jsObject.callMethod('on', [PAGE_SHOW, (event_, ui_) {
        //onBeforeCreate();
        devPrint('show $ui_');
        JPageShowEvent event = new JPageShowEvent(event_, ui_);
        controller.add(event);
      }]);
    return controller.stream;
  }

  Stream<JPageBeforeHideEvent> get onBeforeHide {
    StreamController<JPageBeforeHideEvent> controller = new StreamController(sync: true);

    jsObject.callMethod('on', [PAGE_BEFORE_HIDE, (event_, ui_) {
        //onBeforeCreate();
        devPrint('beforeHide $ui_');
        JPageBeforeHideEvent event = new JPageBeforeHideEvent(event_, ui_);
        controller.add(event);
        //devPrint('beforeShow2');
      }]);
    return controller.stream;
  }

  Stream<JPageHideEvent> get onHide {
    StreamController<JPageHideEvent> controller = new StreamController(sync: true);

    jsObject.callMethod('on', [PAGE_HIDE, (event_, ui_) {
        //onBeforeCreate();
        devPrint('show $ui_');
        JPageHideEvent event = new JPageHideEvent(event_, ui_);
        controller.add(event);
      }]);
    return controller.stream;
  }

  Stream<JPageBeforeChangeEvent> get onBeforeChange {
    StreamController<JPageBeforeChangeEvent> controller = new StreamController(sync: true);

    jsObject.callMethod('on', [PAGE_BEFORE_CHANGE, (event_, ui) {
        //devPrint("1onBeforeChange toPage: ${ui['toPage']}");
        //  pageContainer.activePage
        //devPrint('beforeChange1');
        JPageBeforeChangeEvent event = new JPageBeforeChangeEvent(event_, ui);
        controller.add(event);
        //devPrint('beforeChange2');
        //devPrint("2onBeforeChange toPage: ${ui['toPage']}");
      }]);
    return controller.stream;
  }

  void changeToElement(Element page, [JPageChangeOptions options]) {
    _changeTo(queryElement(page), options);
  }

  void changeToPageId(String pageId, [JPageChangeOptions options]) {
    _changeTo('#${pageId}', options);
  }
}


class JPageChangeOptions {
  JPageChangeOptions.fromEventOptions(JsObject jqmOptions)
      : param = jqmOptions['tekartik_param'],
        //
      transition = jqmOptions['transition'],
        //
      changeHash = jqmOptions['changeHash'],
        reverse = jqmOptions['reverse'] {

  }
  // options:
  //  {reverse: false,
  //  changeHash: null,
  //  fromHashChange: false,
  //  showLoadMsg: true,
  //  allowSamePageTransition: false,
  //  transition: null,
  //  tekartik_param: null,
  //  fromPage: {0: div, length: 1, prevObject: {0: body, context: body, length: 1}, context: body}},
  //  absUrl: http://127.0.0.1:3030/jquery_mobile/example/two_page_dynamic.html#test_dynamic_2} (:1)
  JPageChangeOptions({this.changeHash, this.transition, this.param, this.reverse}) {
  }
  final bool changeHash;
  final String transition;
  // User param
  final dynamic param;
  final bool reverse;

  Map toMap() {
    Map map = {
      'changeHash': changeHash,
      'transition': transition,
      'tekartik_param': param,
      'reverse': reverse,
    };
    return map;
  }
  @override
  String toString() {
    return toMap().toString();
  }

}
