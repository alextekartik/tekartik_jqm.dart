part of tekartik_jquerymobile;


class JqmPageEvent extends JqmEvent {
  JPageElement get jToPage {
    if (toPage is JsObject) {
      return new JPageElement(toPage);
    }
    return null;
  }
  JqmPageEvent(JsObject jqmEvent, JsObject jqmData) : super(jqmEvent, jqmData);
  dynamic get toPage => _jqmData['toPage'];
  @override
  String toString() {
    return "to:${toPageAsString} ${super.toString()}";
  }


  String get toPageAsString {
    String toPageString;
    JPageElement jToPage = this.jToPage;
    if (jToPage is JPageElement) {
      toPageString = "j${jToPage}";
    } else if (toPage is String) {
      toPageString = toPage;
    }
    return toPageString;
  }
  String get toPageId {
    String id;
    if (jToPage is JPageElement) {
      //devPrint(jToPage.firstElement);
      //devPrint(new Map.from(jToPage.firstElement.attributes));
      id = jToPage.id;
    }
    if (id == null) {
      if (toPage is String) {
        Uri uri = Uri.parse(toPage);
        id = uri.fragment;

        if (id.startsWith('#')) {
          id = id.substring(1);
        }
      }
    }
    return id;
  }
}

class JPageBeforeChangeEvent extends JqmPageEvent {
  JPageChangeOptions _options;
  JPageChangeOptions get options {
    if (_options == null) {
      JsObject jqmOptions = _jqmOptions;
      _options = new JPageChangeOptions.fromEventOptions(_jqmOptions);
    }
    return _options;
  }
  JsObject get _jqmOptions => _jqmData['options'];
  dynamic get toPage => _jqmData['toPage'];
  void set toPageId(String id) {
    _jqmData['toPage'] = id;
  }

  JPageBeforeChangeEvent(JsObject jqmEvent, JsObject jqmData) : super(jqmEvent, jqmData);
  void preventDefault() {
    _jqmEvent.callMethod("preventDefault", []);
  }

  //  String toString() {
  //    return "toPage $toPageAsString ${super.toString()}";
  //  }
}