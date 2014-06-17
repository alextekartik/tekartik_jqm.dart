part of tekartik_jquerymobile;

//void refresh() {
//   listViewRefresh(jsObject);
// }
class JButton extends JElement {
  factory JButton.fromElement(Element element) {
    if (element == null) {
      return null;
    }
    return new JButton(jsElement(element));
  }

  JButton(jsObject) : super(jsObject);

  void _callButtonMethod(List<String> args) {
    callMethod('button', args);
  }
  /**
   * refresh a button after it is modified
   */
  void refresh() {
    _callButtonMethod(['refresh']);
  }

  void enable() {
    _callButtonMethod(['enable']);
  }

  void disable() {
    _callButtonMethod(['disable']);
  }

  //
  //  bool get isEnhanced {
  //    /**
  //     * before
  //     * <ul data-role="listview" data-inset="true"><li>test</li></ul></div>
  //     * after
  //     * <ul data-role="listview" data-inset="true" class="ui-listview ui-listview-inset ui-corner-all ui-shadow"><li class="ui-li-static ui-body-inherit ui-first-child ui-last-child">test</li></ul></div>
  //     */
  //
  //    return element.classes.contains("ui-listview");
  //  }
  //  // To call only once for object added dynamically
  //  void enhance() {
  //    if (isEnhanced) {
  //      devError('already enhanced ${element.outerHtml}');
  //    }
  //    // first time create the listview
  //    callMethod('listview');
  //
  //    // second refresh it
  //    refresh();
  //  }

}
