part of tekartik_jquerymobile;

class JTransition extends StringEnum {
  static final String NONE_NAME = "none";
  JTransition(String name) : super.withName(name);
  static final JTransition FADE = new JTransition("fade");
  static final JTransition SLIDE = new JTransition("slide");
  static final JTransition NONE = new JTransition("none");
}