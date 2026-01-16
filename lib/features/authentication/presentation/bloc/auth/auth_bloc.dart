import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ecommerce_app/core/services/auth/auth_session_notifier.dart';
import 'package:furniture_ecommerce_app/features/authentication/domain/repositories/auth_repository.dart';
import 'package:furniture_ecommerce_app/features/authentication/presentation/bloc/auth/auth_event.dart';
import 'package:furniture_ecommerce_app/features/authentication/presentation/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  final AuthSessionNotifier _sessionNotifier;
  late final StreamSubscription<AuthSessionEvent> _sessionSubscription;

  AuthBloc(
    this.authRepository,
    this._sessionNotifier, {
    AuthState? initialState,
  }) : super(initialState ?? AuthState.unknown()) {
    if (kDebugMode) debugPrint('AuthBloc constructed');
    on<AppStarted>(_onAppStarted);
    on<LoggedIn>(_onLoggedIn);
    on<LoggedOut>(_onLoggedOut);
    on<SessionExpired>(_onSessionExpired);

    _sessionSubscription = _sessionNotifier.stream.listen((event) {
      if (event == AuthSessionEvent.unauthorized) {
        add(const SessionExpired());
      }
    });
  }

  Future<void> _onAppStarted(AppStarted event, Emitter<AuthState> emit) async {
    if (kDebugMode) debugPrint('onAppStarted');

    final user = await authRepository.getUser();

    if (kDebugMode) debugPrint('user: $user');

    if (user != null) {
      emit(AuthState.authenticated(user));
    } else {
      emit(AuthState.unauthenticated());
    }
  }

  void _onLoggedIn(LoggedIn event, Emitter<AuthState> emit) {
    emit(AuthState.authenticated(event.user));
  }

  Future<void> _onLoggedOut(LoggedOut event, Emitter<AuthState> emit) async {
    await authRepository.logout();
    emit(AuthState.unauthenticated());
  }

  Future<void> _onSessionExpired(
    SessionExpired event,
    Emitter<AuthState> emit,
  ) async {
    await authRepository.clearSession();
    emit(AuthState.unauthenticated());
  }

  @override
  Future<void> close() {
    _sessionSubscription.cancel();
    return super.close();
  }
}
