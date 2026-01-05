import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:furniture_ecommerce_app/core/routing/go_router_refresh_stream.dart';
import 'package:furniture_ecommerce_app/core/common/screens/splash_screen.dart';
import 'package:furniture_ecommerce_app/core/common/screens/not_found_screen.dart';
import 'package:furniture_ecommerce_app/core/services/dependency_injection/injection_container.dart';
import 'package:furniture_ecommerce_app/features/authentication/presentation/bloc/auth/auth_bloc.dart';
import 'package:furniture_ecommerce_app/features/authentication/presentation/bloc/auth/auth_state.dart';
import 'package:furniture_ecommerce_app/features/authentication/presentation/bloc/signin/signin_bloc.dart';
import 'package:furniture_ecommerce_app/features/authentication/presentation/bloc/signup/signup_bloc.dart';
import 'package:furniture_ecommerce_app/features/authentication/presentation/pages/signup_page.dart';
import 'package:furniture_ecommerce_app/features/authentication/presentation/screens/signin_screen.dart';
import 'package:furniture_ecommerce_app/features/authentication/presentation/screens/signup_screen.dart';
import 'package:furniture_ecommerce_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:furniture_ecommerce_app/features/home/presentation/screens/home_screen.dart';
import 'package:furniture_ecommerce_app/features/products/presentation/screens/products_screen.dart';
import 'package:furniture_ecommerce_app/features/profile/presentation/screens/profile_screen.dart';
import 'package:furniture_ecommerce_app/features/settings/presentation/screens/settings_screen.dart';
import 'package:go_router/go_router.dart';

// Define public routes (routes that don't require authentication)
const _publicRoutes = ['/splash', '/signin', '/signup'];

GoRouter createRouter({required AuthBloc authBloc}) {
  return GoRouter(
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    initialLocation: '/splash',
    debugLogDiagnostics: kDebugMode,
    errorBuilder: (context, state) => NotFoundScreen(
      error: state.error,
      location: state.uri.toString(),
    ),
    redirect: (context, state) {
      final authStatus = authBloc.state.status;
      // Use the actual URL path (no query params) instead of matchedLocation,
      // which becomes tricky once you add path params/nesting.
      final currentLocation = state.uri.path;

      final isPublicRoute = _publicRoutes.contains(currentLocation);

      // While app is determining auth state
      if (authStatus == AuthStatus.unknown) {
        return currentLocation == '/splash' ? null : '/splash';
      }

      // Not authenticated → block protected routes
      if (authStatus == AuthStatus.unauthenticated) {
        // After auth check finishes, don't stay on splash.
        if (currentLocation == '/splash') return '/signin';
        // Block protected routes
        if (!isPublicRoute) return '/signin';
      }

      // Authenticated → block auth pages
      if (authStatus == AuthStatus.authenticated && isPublicRoute) {
        return '/';
      }

      return null;
    },
    routes: [
      // Public Routes (No authentication required)
      GoRoute(
        path: '/splash',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/signin',
        name: 'signin',
        builder: (context, state) => BlocProvider(
          create: (context) => sl<SigninBloc>(),
          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        path: '/signup',
        name: 'signup',
        builder: (context, state) => BlocProvider(
          create: (context) => sl<SignupBloc>(),
          child: const SignupScreen(),
        ),
      ),

      // Protected Routes (Authentication required)
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/products',
        name: 'products',
        builder: (context, state) => const ProductsScreen(),
      ),
      GoRoute(
        path: '/cart',
        name: 'cart',
        builder: (context, state) => const CartScreen(),
      ),
      GoRoute(
        path: '/profile',
        name: 'profile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
