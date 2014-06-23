part of tekartik_jquerymobile;

const String ATTR_REL = r"rel";
const String ATTR_FOR = r"for";
const String ATTR_NAME = r"name";
const String ATTR_PLACEHOLDER = r"placeholder";

const String REL_EXTERNAL = r"external";

const String ATTR_DATA_ICON = r"data-icon";
const String ATTR_DATA_ICONPOS = r"data-iconpos";
const String ATTR_DATA_ROLE = r"data-role";
const String ATTR_DATA_POSITION = r"data-position";
const String ATTR_DATA_INSET = r"data-inset";
const String ATTR_DATA_THEME = r"data-theme";

// Position
const String POSITION_FIXED = "fixed";

// Page
const String ROLE_PAGE = r"page";

// Header
const String ROLE_HEADER = r"header";

// Footer
const String ROLE_FOOTER = r"footer";

// Navbar
const String ROLE_NAVBAR = r"navbar";

// List
const String ROLE_LISTVIEW = r"listview";

const String INSET_TRUE = r"true";

// Classes
const String CLASS_UI_HIDDEN_ACCESSIBLE = 'ui-hidden-accessible';

class Icon extends StringEnum {
  Icon(String name) : super.withName(name);
  static final Icon GRID = new Icon(r"grid");
  static final Icon PLUS = new Icon(r"plus");
  static final Icon DELETE = new Icon(r"delete");
  static final Icon BACK = new Icon(r"back");
  static final Icon EDIT = new Icon(r"edit");
  static final Icon BARS = new Icon(r"bars");

  static final Icon FALSE = new Icon(r"false"); // none
}

class IconPos extends StringEnum {
  IconPos(String name) : super.withName(name);
  static final IconPos BOTTOM = new IconPos(r"bottom");
  static final IconPos RIGHT = new IconPos(r"right");
  static final IconPos LEFT = new IconPos(r"left");
  static final IconPos TOP = new IconPos(r"top");
}
