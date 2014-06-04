import 'package:polymer/polymer.dart';
import 'dart:html';

import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/polymer_utils.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('jqm-page')
class JqmPage extends PolymerElement  with NoShadowDom {
  JqmPage.created() : super.created() {
    print('created');
  }

  //This enables the bootstrap javascript to see the elements
  @override
  Node shadowFromTemplate(Element template) {
    var dom = instanceTemplate(template);
    append(dom);
    shadowRootReady(this, template);
    return null; // no shadow here, it's all bright and shiny
  }

  //This enables the styling via bootstrap.css
  // bool get applyAuthorStyles => true;
}
