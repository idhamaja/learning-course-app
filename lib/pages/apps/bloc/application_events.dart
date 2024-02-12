abstract class ApplicationEvents {
  const ApplicationEvents();
}

class TriggerApplicationEvents extends ApplicationEvents {
  final int index;
  const TriggerApplicationEvents(this.index) : super();
}
