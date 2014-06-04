part of tekartik_jquerymobile;


class JqmEvent {
  JsObject _jqmEvent;
  JsObject _jqmData;
  JqmEvent(this._jqmEvent, this._jqmData);

  String _toString(JsObject object) {
    //return jsObjectKeys(object).toString();
    return jsObjectAsMap(object).toString();
  }
  @override
  String toString() {
    return "$runtimeType: ${_toString(_jqmEvent)} ${_toString(_jqmData)}";
  }

  String get type => _jqmEvent['type'];

}