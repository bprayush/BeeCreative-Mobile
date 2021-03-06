library user_events;

import 'package:built_value/built_value.dart';

part 'user_events.g.dart';

abstract class UserEvent {}

abstract class EmailLoginRequested extends UserEvent
    implements Built<EmailLoginRequested, EmailLoginRequestedBuilder> {
  String get email;
  String get password;

  EmailLoginRequested._();

  factory EmailLoginRequested([updates(EmailLoginRequestedBuilder b)]) =
      _$EmailLoginRequested;
}

abstract class UserLoginRequested extends UserEvent
    implements Built<UserLoginRequested, UserLoginRequestedBuilder> {
  String get token;

  UserLoginRequested._();

  factory UserLoginRequested([updates(UserLoginRequestedBuilder b)]) =
      _$UserLoginRequested;
}

abstract class GoogleUserLoginRequest extends UserEvent
    implements Built<GoogleUserLoginRequest, GoogleUserLoginRequestBuilder> {
  GoogleUserLoginRequest._();

  factory GoogleUserLoginRequest([updates(GoogleUserLoginRequestBuilder b)]) =
      _$GoogleUserLoginRequest;
}

abstract class StoreUserToSharedPreferences extends UserEvent
    implements
        Built<StoreUserToSharedPreferences,
            StoreUserToSharedPreferencesBuilder> {
  StoreUserToSharedPreferences._();

  factory StoreUserToSharedPreferences(
          [updates(StoreUserToSharedPreferencesBuilder b)]) =
      _$StoreUserToSharedPreferences;
}

abstract class UserLogoutRequested extends UserEvent
    implements Built<UserLogoutRequested, UserLogoutRequestedBuilder> {
  UserLogoutRequested._();

  factory UserLogoutRequested([updates(UserLogoutRequestedBuilder b)]) =
      _$UserLogoutRequested;
}

abstract class UserStoredSuccessfully extends UserEvent
    implements Built<UserStoredSuccessfully, UserStoredSuccessfullyBuilder> {
  // fields go here

  UserStoredSuccessfully._();

  factory UserStoredSuccessfully([updates(UserStoredSuccessfullyBuilder b)]) =
      _$UserStoredSuccessfully;
}

abstract class UserErrorEvent extends UserEvent
    implements Built<UserErrorEvent, UserErrorEventBuilder> {
  String get message;

  UserErrorEvent._();

  factory UserErrorEvent([updates(UserErrorEventBuilder b)]) = _$UserErrorEvent;
}

abstract class UserLoginSuccess extends UserEvent
    implements Built<UserLoginSuccess, UserLoginSuccessBuilder> {
  UserLoginSuccess._();

  factory UserLoginSuccess([updates(UserLoginSuccessBuilder b)]) =
      _$UserLoginSuccess;
}

abstract class UserLoggedOut extends UserEvent
    implements Built<UserLoggedOut, UserLoggedOutBuilder> {
  UserLoggedOut._();

  factory UserLoggedOut([updates(UserLoggedOutBuilder b)]) = _$UserLoggedOut;
}
