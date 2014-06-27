part of tekartik_jquerymobile;


class JqmPageEvent extends JqmEvent {

  JqmPageEvent(JsObject jqmEvent, JsObject jqmData) : super(jqmEvent, jqmData);
  dynamic get prevPage => _jqmData['prevPage']; // valid for before show


}

abstract class JqmPageEventWithOptions {
  JsObject get _jqmData;
  
  JPageChangeOptions _options;
  JPageChangeOptions get options {
    if (_options == null) {
      JsObject jqmOptions = _jqmOptions;
      _options = new JPageChangeOptions.fromEventOptions(_jqmOptions);
    }
    return _options;
  }
  JsObject get _jqmOptions => _jqmData['options'];
  JsObject get jqmOptions => _jqmData['options'];
}

abstract class JqmPageEventWithToPage {
  JsObject get _jqmData;
  dynamic get toPage => _jqmData['toPage']; // valid for before hide

  JPage get jToPage {
    if (toPage is JsObject) {
      return new JPage(toPage);
    }
    return null;
  }
  @override
  String toString() {
    return "to:${toPageAsString}";
  }

  String get toPageAsString {
    String toPageString;
    JPage jToPage = this.jToPage;
    if (jToPage is JPage) {
      toPageString = "j${jToPage}";
    } else if (toPage is String) {
      toPageString = toPage;
    }
    return toPageString;
  }
  String get toPageId {
    String id;
    if (jToPage is JPage) {
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
// nextPage is valid
class JPageBeforeHideEvent extends JqmPageEvent {
  JPageBeforeHideEvent(JsObject jqmEvent, JsObject jqmData) : super(jqmEvent, jqmData);
  dynamic get nextPage => _jqmData['nextPage']; // valid for before show
}

// prevPage is valid
class JPageBeforeShowEvent extends JqmPageEvent with JqmPageEventWithToPage {
  JPageBeforeShowEvent(JsObject jqmEvent, JsObject jqmData) : super(jqmEvent, jqmData);
}

class JPageShowEvent extends JqmPageEvent {
  JPageShowEvent(JsObject jqmEvent, JsObject jqmData) : super(jqmEvent, jqmData);
}

class JPageHideEvent extends JqmPageEvent {
  JPageHideEvent(JsObject jqmEvent, JsObject jqmData) : super(jqmEvent, jqmData);
}

class JPageBeforeTransitionEvent extends JqmPageEvent with JqmPageEventWithToPage, JqmPageEventWithOptions {
  JPageBeforeTransitionEvent(JsObject jqmEvent, JsObject jqmData) : super(jqmEvent, jqmData);
}

class JPageBeforeChangeEvent extends JqmPageEvent with JqmPageEventWithToPage, JqmPageEventWithOptions {

  JPageBeforeChangeEvent(JsObject jqmEvent, JsObject jqmData) : super(jqmEvent, jqmData);
  void preventDefault() {
    _jqmEvent.callMethod("preventDefault", []);
  }

  //  String toString() {
  //    return "toPage $toPageAsString ${super.toString()}";
  //  }
}
