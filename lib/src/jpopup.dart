part of tekartik_jquerymobile;

//void refresh() {
//   listViewRefresh(jsObject);
// }
class JPopup extends JElement {
  factory JPopup.fromElement(Element element) {
    if (element == null) {
      return null;
    }
    return new JPopup(jsElement(element));
  }

  JPopup(jsObject) : super(jsObject);

  void _callPopupMethod(List<String> args) {
    callMethod('popup', args);
  }
  /**
   * refresh a button after it is modified
   */
  void open() {
    _callPopupMethod(['open']);
  }

}
