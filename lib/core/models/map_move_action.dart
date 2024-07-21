enum MapMoveAction {
  /// Departure maneuver, such as "Head towards".
  depart,

  /// Arrival maneuver, such as "You have reached your destination/waypoint".
  arrive,

  /// Continue maneuver, such as "Continue straight ahead".
  continueOn,

  /// Left turn maneuver, such as "Turn left".
  leftTurn,

  /// Right turn maneuver, such as "Turn right".
  /// Slight left turn maneuver, such as "Turn slightly left".
  slightLeftTurn,
  rightTurn,

  /// Slight right turn maneuver, such as "Turn slightly right".
  slightRightTurn,
  none,
}
