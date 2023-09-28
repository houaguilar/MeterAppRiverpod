// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'state_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$darkModeHash() => r'54d687970391283e693e0beb87bef8e54d34d8da';

/// See also [DarkMode].
@ProviderFor(DarkMode)
final darkModeProvider = AutoDisposeNotifierProvider<DarkMode, bool>.internal(
  DarkMode.new,
  name: r'darkModeProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$darkModeHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$DarkMode = AutoDisposeNotifier<bool>;
String _$usernameHash() => r'5ead9cf847e8b9f9b733fc00c2da8105dd2eb02d';

/// See also [Username].
@ProviderFor(Username)
final usernameProvider = NotifierProvider<Username, String>.internal(
  Username.new,
  name: r'usernameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$usernameHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Username = Notifier<String>;
String _$dropdownHash() => r'740a7af5c01480c84dab4c261ab95d62207389da';

/// See also [Dropdown].
@ProviderFor(Dropdown)
final dropdownProvider = AutoDisposeNotifierProvider<Dropdown, String>.internal(
  Dropdown.new,
  name: r'dropdownProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$dropdownHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$Dropdown = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
