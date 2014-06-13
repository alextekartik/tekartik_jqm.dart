library tekartik_jqm_page;

import 'package:polymer/polymer.dart';
import 'dart:html';
import 'package:tekartik_utils/dev_utils.dart';
import 'package:tekartik_utils/polymer_utils.dart';
import 'package:tekartik_jqm/jquerymobile.dart';
import 'package:tekartik_jqm/jquerymobile.dart';
import 'package:tekartik_jqm/jqm_page.dart';

/**
 * A Polymer click counter element.
 */
@CustomTag('test-pagewithlistview')
class TestPageWithListView extends JqmPage with PageHandleOnShow {

  
  TestPageWithListView.created() : super.created() {
    print('TestPageWithListView.created');
  }

  @override
  attached() {
    print('TestPageWithListView.attached');
    super.attached();

  }

  @override
  detached() {
    print('TestPageWithListView.detached');
    super.detached();

  }

  @override
  void onShow() {
    JListView listView = getListView('my_ul');
    $['my_ul'].children.add(new LIElement()..innerHtml = 'dynamic');
    $['my_ul'].children.add(new LIElement()..innerHtml = '<a href="#">with href</a>');
    listView.element.children.clear();
    listView.element.children.add(jListNewItem(title: 'second list', href: '#listview2'));
    listView.element.children.add(jListNewItem(title: 'first list', href: '#listview1'));
        
    listView.refresh();
        //jsElement($['my_ul']).callMethod('listview', ['refresh']);
        
  }
}
