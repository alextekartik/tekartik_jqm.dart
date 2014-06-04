part of tekartik_jquerymobile;

class JPageContainer extends JObjectElement {
  JPageContainer(jsPageContainer) : super(jsPageContainer);

  _callPageContainer(List args) {
    return jsObject.callMethod('pagecontainer', args);
  }

  changeTo(JPageElement jPageElement, [JPageChangeOptions options]) {
    JsObject jsOptions;
    if (options != null) {
      jsOptions = new JsObject.jsify(options.toMap());
    }

    _callPageContainer(['change', jPageElement.jsObject, jsOptions]);
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
      'param': param,
      'reverse': reverse,
    };
    return map;
  }
  @override
  String toString() {
    return toMap().toString();
  }

}
