enum MapCurrentLocationStyle {
  normal,
  navigation,
  tracking;

  static List<MapCurrentLocationStyle> hereStylesGroup = [
    normal,
    navigation,
  ];
  static List<MapCurrentLocationStyle> _customStypesGroup = [tracking];
  static List<List<MapCurrentLocationStyle>> _styleGroups = [
    hereStylesGroup,
    _customStypesGroup,
  ];
  bool isDifferentStyleGroup(MapCurrentLocationStyle style) {
    return _styleGroups.indexWhere((styles) => styles.contains(this)) !=
        _styleGroups.indexWhere((styles) => styles.contains(style));
  }
}
