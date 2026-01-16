import 'dart:async';

enum AuthSessionEvent { unauthorized }

class AuthSessionNotifier {
  final StreamController<AuthSessionEvent> _controller =
      StreamController<AuthSessionEvent>.broadcast();

  Stream<AuthSessionEvent> get stream => _controller.stream;

  void notifyUnauthorized() {
    if (_controller.isClosed) return;
    _controller.add(AuthSessionEvent.unauthorized);
  }

  Future<void> dispose() async {
    await _controller.close();
  }
}
