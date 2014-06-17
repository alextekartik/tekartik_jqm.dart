part of tekartik_jquerymobile;

//
class JSlider extends JElement {
  factory JSlider.fromElement(Element element) {
    if (element == null) {
      return null;
    }
    return new JSlider(jsElement(element));
  }

  JSlider(jsObject) : super(jsObject);

  void _callSliderMethod([List<String> args]) {
    callMethod('slider', args);
  }
  /**
   * refresh a button after it is modified
   */
  void refresh() {
    _callSliderMethod(['refresh']);
  }
  
  set value(int value_) {
    callMethod('val', [value_]);
    
  }

  void enable() {
    _callSliderMethod(['enable']);
  }

  void disable() {
    _callSliderMethod(['disable']);
  }
  
  
  bool get isEnhanced {
     /**
      * before
      * <ul data-role="listview" data-inset="true"><li>test</li></ul></div>
      * after
      * <ul data-role="listview" data-inset="true" class="ui-listview ui-listview-inset ui-corner-all ui-shadow"><li class="ui-li-static ui-body-inherit ui-first-child ui-last-child">test</li></ul></div>
      */

     return element.classes.contains("ui-slider-input");
   }
  
// To call only once for object added dynamically
void enhance() {
 if (isEnhanced) {
   devError('already enhanced ${element.outerHtml}');
 }
 devPrint(element.outerHtml);
 // first time create the listview
 _callSliderMethod();
 devPrint(element.outerHtml);

 // second refresh it
 refresh();
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
