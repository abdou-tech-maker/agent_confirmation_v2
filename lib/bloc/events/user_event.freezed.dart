// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function(int wilayaId) commune,
    required TResult Function() wilaya,
    required TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)
        status,
    required TResult Function() call,
    required TResult Function() profile,
    required TResult Function(int searchKey) search,
    required TResult Function(String? id, String? name) product,
    required TResult Function() distract,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function(int wilayaId)? commune,
    TResult? Function()? wilaya,
    TResult? Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult? Function()? call,
    TResult? Function()? profile,
    TResult? Function(int searchKey)? search,
    TResult? Function(String? id, String? name)? product,
    TResult? Function()? distract,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function(int wilayaId)? commune,
    TResult Function()? wilaya,
    TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult Function()? call,
    TResult Function()? profile,
    TResult Function(int searchKey)? search,
    TResult Function(String? id, String? name)? product,
    TResult Function()? distract,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(Commune value) commune,
    required TResult Function(Wilaya value) wilaya,
    required TResult Function(Status value) status,
    required TResult Function(Call value) call,
    required TResult Function(Profile value) profile,
    required TResult Function(Search value) search,
    required TResult Function(Product value) product,
    required TResult Function(Distract value) distract,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(Commune value)? commune,
    TResult? Function(Wilaya value)? wilaya,
    TResult? Function(Status value)? status,
    TResult? Function(Call value)? call,
    TResult? Function(Profile value)? profile,
    TResult? Function(Search value)? search,
    TResult? Function(Product value)? product,
    TResult? Function(Distract value)? distract,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(Commune value)? commune,
    TResult Function(Wilaya value)? wilaya,
    TResult Function(Status value)? status,
    TResult Function(Call value)? call,
    TResult Function(Profile value)? profile,
    TResult Function(Search value)? search,
    TResult Function(Product value)? product,
    TResult Function(Distract value)? distract,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$LoginCopyWith<$Res> {
  factory _$$LoginCopyWith(_$Login value, $Res Function(_$Login) then) =
      __$$LoginCopyWithImpl<$Res>;
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class __$$LoginCopyWithImpl<$Res> extends _$UserEventCopyWithImpl<$Res, _$Login>
    implements _$$LoginCopyWith<$Res> {
  __$$LoginCopyWithImpl(_$Login _value, $Res Function(_$Login) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$Login(
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$Login with DiagnosticableTreeMixin implements Login {
  const _$Login(this.username, this.password);

  @override
  final String username;
  @override
  final String password;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.login(username: $username, password: $password)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvent.login'))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('password', password));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Login &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginCopyWith<_$Login> get copyWith =>
      __$$LoginCopyWithImpl<_$Login>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function(int wilayaId) commune,
    required TResult Function() wilaya,
    required TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)
        status,
    required TResult Function() call,
    required TResult Function() profile,
    required TResult Function(int searchKey) search,
    required TResult Function(String? id, String? name) product,
    required TResult Function() distract,
  }) {
    return login(username, password);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function(int wilayaId)? commune,
    TResult? Function()? wilaya,
    TResult? Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult? Function()? call,
    TResult? Function()? profile,
    TResult? Function(int searchKey)? search,
    TResult? Function(String? id, String? name)? product,
    TResult? Function()? distract,
  }) {
    return login?.call(username, password);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function(int wilayaId)? commune,
    TResult Function()? wilaya,
    TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult Function()? call,
    TResult Function()? profile,
    TResult Function(int searchKey)? search,
    TResult Function(String? id, String? name)? product,
    TResult Function()? distract,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(username, password);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(Commune value) commune,
    required TResult Function(Wilaya value) wilaya,
    required TResult Function(Status value) status,
    required TResult Function(Call value) call,
    required TResult Function(Profile value) profile,
    required TResult Function(Search value) search,
    required TResult Function(Product value) product,
    required TResult Function(Distract value) distract,
  }) {
    return login(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(Commune value)? commune,
    TResult? Function(Wilaya value)? wilaya,
    TResult? Function(Status value)? status,
    TResult? Function(Call value)? call,
    TResult? Function(Profile value)? profile,
    TResult? Function(Search value)? search,
    TResult? Function(Product value)? product,
    TResult? Function(Distract value)? distract,
  }) {
    return login?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(Commune value)? commune,
    TResult Function(Wilaya value)? wilaya,
    TResult Function(Status value)? status,
    TResult Function(Call value)? call,
    TResult Function(Profile value)? profile,
    TResult Function(Search value)? search,
    TResult Function(Product value)? product,
    TResult Function(Distract value)? distract,
    required TResult orElse(),
  }) {
    if (login != null) {
      return login(this);
    }
    return orElse();
  }
}

abstract class Login implements UserEvent {
  const factory Login(final String username, final String password) = _$Login;

  String get username;
  String get password;
  @JsonKey(ignore: true)
  _$$LoginCopyWith<_$Login> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CommuneCopyWith<$Res> {
  factory _$$CommuneCopyWith(_$Commune value, $Res Function(_$Commune) then) =
      __$$CommuneCopyWithImpl<$Res>;
  @useResult
  $Res call({int wilayaId});
}

/// @nodoc
class __$$CommuneCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$Commune>
    implements _$$CommuneCopyWith<$Res> {
  __$$CommuneCopyWithImpl(_$Commune _value, $Res Function(_$Commune) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? wilayaId = null,
  }) {
    return _then(_$Commune(
      null == wilayaId
          ? _value.wilayaId
          : wilayaId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Commune with DiagnosticableTreeMixin implements Commune {
  const _$Commune(this.wilayaId);

  @override
  final int wilayaId;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.commune(wilayaId: $wilayaId)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvent.commune'))
      ..add(DiagnosticsProperty('wilayaId', wilayaId));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Commune &&
            (identical(other.wilayaId, wilayaId) ||
                other.wilayaId == wilayaId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, wilayaId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CommuneCopyWith<_$Commune> get copyWith =>
      __$$CommuneCopyWithImpl<_$Commune>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function(int wilayaId) commune,
    required TResult Function() wilaya,
    required TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)
        status,
    required TResult Function() call,
    required TResult Function() profile,
    required TResult Function(int searchKey) search,
    required TResult Function(String? id, String? name) product,
    required TResult Function() distract,
  }) {
    return commune(wilayaId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function(int wilayaId)? commune,
    TResult? Function()? wilaya,
    TResult? Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult? Function()? call,
    TResult? Function()? profile,
    TResult? Function(int searchKey)? search,
    TResult? Function(String? id, String? name)? product,
    TResult? Function()? distract,
  }) {
    return commune?.call(wilayaId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function(int wilayaId)? commune,
    TResult Function()? wilaya,
    TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult Function()? call,
    TResult Function()? profile,
    TResult Function(int searchKey)? search,
    TResult Function(String? id, String? name)? product,
    TResult Function()? distract,
    required TResult orElse(),
  }) {
    if (commune != null) {
      return commune(wilayaId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(Commune value) commune,
    required TResult Function(Wilaya value) wilaya,
    required TResult Function(Status value) status,
    required TResult Function(Call value) call,
    required TResult Function(Profile value) profile,
    required TResult Function(Search value) search,
    required TResult Function(Product value) product,
    required TResult Function(Distract value) distract,
  }) {
    return commune(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(Commune value)? commune,
    TResult? Function(Wilaya value)? wilaya,
    TResult? Function(Status value)? status,
    TResult? Function(Call value)? call,
    TResult? Function(Profile value)? profile,
    TResult? Function(Search value)? search,
    TResult? Function(Product value)? product,
    TResult? Function(Distract value)? distract,
  }) {
    return commune?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(Commune value)? commune,
    TResult Function(Wilaya value)? wilaya,
    TResult Function(Status value)? status,
    TResult Function(Call value)? call,
    TResult Function(Profile value)? profile,
    TResult Function(Search value)? search,
    TResult Function(Product value)? product,
    TResult Function(Distract value)? distract,
    required TResult orElse(),
  }) {
    if (commune != null) {
      return commune(this);
    }
    return orElse();
  }
}

abstract class Commune implements UserEvent {
  const factory Commune(final int wilayaId) = _$Commune;

  int get wilayaId;
  @JsonKey(ignore: true)
  _$$CommuneCopyWith<_$Commune> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$WilayaCopyWith<$Res> {
  factory _$$WilayaCopyWith(_$Wilaya value, $Res Function(_$Wilaya) then) =
      __$$WilayaCopyWithImpl<$Res>;
}

/// @nodoc
class __$$WilayaCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$Wilaya>
    implements _$$WilayaCopyWith<$Res> {
  __$$WilayaCopyWithImpl(_$Wilaya _value, $Res Function(_$Wilaya) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Wilaya with DiagnosticableTreeMixin implements Wilaya {
  const _$Wilaya();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.wilaya()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'UserEvent.wilaya'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Wilaya);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function(int wilayaId) commune,
    required TResult Function() wilaya,
    required TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)
        status,
    required TResult Function() call,
    required TResult Function() profile,
    required TResult Function(int searchKey) search,
    required TResult Function(String? id, String? name) product,
    required TResult Function() distract,
  }) {
    return wilaya();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function(int wilayaId)? commune,
    TResult? Function()? wilaya,
    TResult? Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult? Function()? call,
    TResult? Function()? profile,
    TResult? Function(int searchKey)? search,
    TResult? Function(String? id, String? name)? product,
    TResult? Function()? distract,
  }) {
    return wilaya?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function(int wilayaId)? commune,
    TResult Function()? wilaya,
    TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult Function()? call,
    TResult Function()? profile,
    TResult Function(int searchKey)? search,
    TResult Function(String? id, String? name)? product,
    TResult Function()? distract,
    required TResult orElse(),
  }) {
    if (wilaya != null) {
      return wilaya();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(Commune value) commune,
    required TResult Function(Wilaya value) wilaya,
    required TResult Function(Status value) status,
    required TResult Function(Call value) call,
    required TResult Function(Profile value) profile,
    required TResult Function(Search value) search,
    required TResult Function(Product value) product,
    required TResult Function(Distract value) distract,
  }) {
    return wilaya(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(Commune value)? commune,
    TResult? Function(Wilaya value)? wilaya,
    TResult? Function(Status value)? status,
    TResult? Function(Call value)? call,
    TResult? Function(Profile value)? profile,
    TResult? Function(Search value)? search,
    TResult? Function(Product value)? product,
    TResult? Function(Distract value)? distract,
  }) {
    return wilaya?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(Commune value)? commune,
    TResult Function(Wilaya value)? wilaya,
    TResult Function(Status value)? status,
    TResult Function(Call value)? call,
    TResult Function(Profile value)? profile,
    TResult Function(Search value)? search,
    TResult Function(Product value)? product,
    TResult Function(Distract value)? distract,
    required TResult orElse(),
  }) {
    if (wilaya != null) {
      return wilaya(this);
    }
    return orElse();
  }
}

abstract class Wilaya implements UserEvent {
  const factory Wilaya() = _$Wilaya;
}

/// @nodoc
abstract class _$$StatusCopyWith<$Res> {
  factory _$$StatusCopyWith(_$Status value, $Res Function(_$Status) then) =
      __$$StatusCopyWithImpl<$Res>;
  @useResult
  $Res call(
      {String? id,
      int? status,
      int? cancellationReason,
      int? callBackReason,
      String? postponedDate,
      int? commune,
      int? totalPrice,
      String? customerName,
      String? customerPhone,
      String? customerPhone2,
      String? customerAddress,
      String? deliveryNote,
      List<ProductModel?>? details});
}

/// @nodoc
class __$$StatusCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$Status>
    implements _$$StatusCopyWith<$Res> {
  __$$StatusCopyWithImpl(_$Status _value, $Res Function(_$Status) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? status = freezed,
    Object? cancellationReason = freezed,
    Object? callBackReason = freezed,
    Object? postponedDate = freezed,
    Object? commune = freezed,
    Object? totalPrice = freezed,
    Object? customerName = freezed,
    Object? customerPhone = freezed,
    Object? customerPhone2 = freezed,
    Object? customerAddress = freezed,
    Object? deliveryNote = freezed,
    Object? details = freezed,
  }) {
    return _then(_$Status(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      cancellationReason: freezed == cancellationReason
          ? _value.cancellationReason
          : cancellationReason // ignore: cast_nullable_to_non_nullable
              as int?,
      callBackReason: freezed == callBackReason
          ? _value.callBackReason
          : callBackReason // ignore: cast_nullable_to_non_nullable
              as int?,
      postponedDate: freezed == postponedDate
          ? _value.postponedDate
          : postponedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      commune: freezed == commune
          ? _value.commune
          : commune // ignore: cast_nullable_to_non_nullable
              as int?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as int?,
      customerName: freezed == customerName
          ? _value.customerName
          : customerName // ignore: cast_nullable_to_non_nullable
              as String?,
      customerPhone: freezed == customerPhone
          ? _value.customerPhone
          : customerPhone // ignore: cast_nullable_to_non_nullable
              as String?,
      customerPhone2: freezed == customerPhone2
          ? _value.customerPhone2
          : customerPhone2 // ignore: cast_nullable_to_non_nullable
              as String?,
      customerAddress: freezed == customerAddress
          ? _value.customerAddress
          : customerAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      deliveryNote: freezed == deliveryNote
          ? _value.deliveryNote
          : deliveryNote // ignore: cast_nullable_to_non_nullable
              as String?,
      details: freezed == details
          ? _value._details
          : details // ignore: cast_nullable_to_non_nullable
              as List<ProductModel?>?,
    ));
  }
}

/// @nodoc

class _$Status with DiagnosticableTreeMixin implements Status {
  const _$Status(
      {required this.id,
      required this.status,
      required this.cancellationReason,
      required this.callBackReason,
      required this.postponedDate,
      required this.commune,
      required this.totalPrice,
      required this.customerName,
      required this.customerPhone,
      required this.customerPhone2,
      required this.customerAddress,
      required this.deliveryNote,
      required final List<ProductModel?>? details})
      : _details = details;

  @override
  final String? id;
  @override
  final int? status;
  @override
  final int? cancellationReason;
  @override
  final int? callBackReason;
  @override
  final String? postponedDate;
  @override
  final int? commune;
  @override
  final int? totalPrice;
  @override
  final String? customerName;
  @override
  final String? customerPhone;
  @override
  final String? customerPhone2;
  @override
  final String? customerAddress;
  @override
  final String? deliveryNote;
  final List<ProductModel?>? _details;
  @override
  List<ProductModel?>? get details {
    final value = _details;
    if (value == null) return null;
    if (_details is EqualUnmodifiableListView) return _details;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.status(id: $id, status: $status, cancellationReason: $cancellationReason, callBackReason: $callBackReason, postponedDate: $postponedDate, commune: $commune, totalPrice: $totalPrice, customerName: $customerName, customerPhone: $customerPhone, customerPhone2: $customerPhone2, customerAddress: $customerAddress, deliveryNote: $deliveryNote, details: $details)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvent.status'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('cancellationReason', cancellationReason))
      ..add(DiagnosticsProperty('callBackReason', callBackReason))
      ..add(DiagnosticsProperty('postponedDate', postponedDate))
      ..add(DiagnosticsProperty('commune', commune))
      ..add(DiagnosticsProperty('totalPrice', totalPrice))
      ..add(DiagnosticsProperty('customerName', customerName))
      ..add(DiagnosticsProperty('customerPhone', customerPhone))
      ..add(DiagnosticsProperty('customerPhone2', customerPhone2))
      ..add(DiagnosticsProperty('customerAddress', customerAddress))
      ..add(DiagnosticsProperty('deliveryNote', deliveryNote))
      ..add(DiagnosticsProperty('details', details));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Status &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.cancellationReason, cancellationReason) ||
                other.cancellationReason == cancellationReason) &&
            (identical(other.callBackReason, callBackReason) ||
                other.callBackReason == callBackReason) &&
            (identical(other.postponedDate, postponedDate) ||
                other.postponedDate == postponedDate) &&
            (identical(other.commune, commune) || other.commune == commune) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.customerName, customerName) ||
                other.customerName == customerName) &&
            (identical(other.customerPhone, customerPhone) ||
                other.customerPhone == customerPhone) &&
            (identical(other.customerPhone2, customerPhone2) ||
                other.customerPhone2 == customerPhone2) &&
            (identical(other.customerAddress, customerAddress) ||
                other.customerAddress == customerAddress) &&
            (identical(other.deliveryNote, deliveryNote) ||
                other.deliveryNote == deliveryNote) &&
            const DeepCollectionEquality().equals(other._details, _details));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      status,
      cancellationReason,
      callBackReason,
      postponedDate,
      commune,
      totalPrice,
      customerName,
      customerPhone,
      customerPhone2,
      customerAddress,
      deliveryNote,
      const DeepCollectionEquality().hash(_details));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusCopyWith<_$Status> get copyWith =>
      __$$StatusCopyWithImpl<_$Status>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function(int wilayaId) commune,
    required TResult Function() wilaya,
    required TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)
        status,
    required TResult Function() call,
    required TResult Function() profile,
    required TResult Function(int searchKey) search,
    required TResult Function(String? id, String? name) product,
    required TResult Function() distract,
  }) {
    return status(
        id,
        this.status,
        cancellationReason,
        callBackReason,
        postponedDate,
        this.commune,
        totalPrice,
        customerName,
        customerPhone,
        customerPhone2,
        customerAddress,
        deliveryNote,
        details);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function(int wilayaId)? commune,
    TResult? Function()? wilaya,
    TResult? Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult? Function()? call,
    TResult? Function()? profile,
    TResult? Function(int searchKey)? search,
    TResult? Function(String? id, String? name)? product,
    TResult? Function()? distract,
  }) {
    return status?.call(
        id,
        this.status,
        cancellationReason,
        callBackReason,
        postponedDate,
        this.commune,
        totalPrice,
        customerName,
        customerPhone,
        customerPhone2,
        customerAddress,
        deliveryNote,
        details);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function(int wilayaId)? commune,
    TResult Function()? wilaya,
    TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult Function()? call,
    TResult Function()? profile,
    TResult Function(int searchKey)? search,
    TResult Function(String? id, String? name)? product,
    TResult Function()? distract,
    required TResult orElse(),
  }) {
    if (status != null) {
      return status(
          id,
          this.status,
          cancellationReason,
          callBackReason,
          postponedDate,
          this.commune,
          totalPrice,
          customerName,
          customerPhone,
          customerPhone2,
          customerAddress,
          deliveryNote,
          details);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(Commune value) commune,
    required TResult Function(Wilaya value) wilaya,
    required TResult Function(Status value) status,
    required TResult Function(Call value) call,
    required TResult Function(Profile value) profile,
    required TResult Function(Search value) search,
    required TResult Function(Product value) product,
    required TResult Function(Distract value) distract,
  }) {
    return status(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(Commune value)? commune,
    TResult? Function(Wilaya value)? wilaya,
    TResult? Function(Status value)? status,
    TResult? Function(Call value)? call,
    TResult? Function(Profile value)? profile,
    TResult? Function(Search value)? search,
    TResult? Function(Product value)? product,
    TResult? Function(Distract value)? distract,
  }) {
    return status?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(Commune value)? commune,
    TResult Function(Wilaya value)? wilaya,
    TResult Function(Status value)? status,
    TResult Function(Call value)? call,
    TResult Function(Profile value)? profile,
    TResult Function(Search value)? search,
    TResult Function(Product value)? product,
    TResult Function(Distract value)? distract,
    required TResult orElse(),
  }) {
    if (status != null) {
      return status(this);
    }
    return orElse();
  }
}

abstract class Status implements UserEvent {
  const factory Status(
      {required final String? id,
      required final int? status,
      required final int? cancellationReason,
      required final int? callBackReason,
      required final String? postponedDate,
      required final int? commune,
      required final int? totalPrice,
      required final String? customerName,
      required final String? customerPhone,
      required final String? customerPhone2,
      required final String? customerAddress,
      required final String? deliveryNote,
      required final List<ProductModel?>? details}) = _$Status;

  String? get id;
  int? get status;
  int? get cancellationReason;
  int? get callBackReason;
  String? get postponedDate;
  int? get commune;
  int? get totalPrice;
  String? get customerName;
  String? get customerPhone;
  String? get customerPhone2;
  String? get customerAddress;
  String? get deliveryNote;
  List<ProductModel?>? get details;
  @JsonKey(ignore: true)
  _$$StatusCopyWith<_$Status> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CallCopyWith<$Res> {
  factory _$$CallCopyWith(_$Call value, $Res Function(_$Call) then) =
      __$$CallCopyWithImpl<$Res>;
}

/// @nodoc
class __$$CallCopyWithImpl<$Res> extends _$UserEventCopyWithImpl<$Res, _$Call>
    implements _$$CallCopyWith<$Res> {
  __$$CallCopyWithImpl(_$Call _value, $Res Function(_$Call) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Call with DiagnosticableTreeMixin implements Call {
  const _$Call();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.call()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'UserEvent.call'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Call);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function(int wilayaId) commune,
    required TResult Function() wilaya,
    required TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)
        status,
    required TResult Function() call,
    required TResult Function() profile,
    required TResult Function(int searchKey) search,
    required TResult Function(String? id, String? name) product,
    required TResult Function() distract,
  }) {
    return call();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function(int wilayaId)? commune,
    TResult? Function()? wilaya,
    TResult? Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult? Function()? call,
    TResult? Function()? profile,
    TResult? Function(int searchKey)? search,
    TResult? Function(String? id, String? name)? product,
    TResult? Function()? distract,
  }) {
    return call?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function(int wilayaId)? commune,
    TResult Function()? wilaya,
    TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult Function()? call,
    TResult Function()? profile,
    TResult Function(int searchKey)? search,
    TResult Function(String? id, String? name)? product,
    TResult Function()? distract,
    required TResult orElse(),
  }) {
    if (call != null) {
      return call();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(Commune value) commune,
    required TResult Function(Wilaya value) wilaya,
    required TResult Function(Status value) status,
    required TResult Function(Call value) call,
    required TResult Function(Profile value) profile,
    required TResult Function(Search value) search,
    required TResult Function(Product value) product,
    required TResult Function(Distract value) distract,
  }) {
    return call(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(Commune value)? commune,
    TResult? Function(Wilaya value)? wilaya,
    TResult? Function(Status value)? status,
    TResult? Function(Call value)? call,
    TResult? Function(Profile value)? profile,
    TResult? Function(Search value)? search,
    TResult? Function(Product value)? product,
    TResult? Function(Distract value)? distract,
  }) {
    return call?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(Commune value)? commune,
    TResult Function(Wilaya value)? wilaya,
    TResult Function(Status value)? status,
    TResult Function(Call value)? call,
    TResult Function(Profile value)? profile,
    TResult Function(Search value)? search,
    TResult Function(Product value)? product,
    TResult Function(Distract value)? distract,
    required TResult orElse(),
  }) {
    if (call != null) {
      return call(this);
    }
    return orElse();
  }
}

abstract class Call implements UserEvent {
  const factory Call() = _$Call;
}

/// @nodoc
abstract class _$$ProfileCopyWith<$Res> {
  factory _$$ProfileCopyWith(_$Profile value, $Res Function(_$Profile) then) =
      __$$ProfileCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ProfileCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$Profile>
    implements _$$ProfileCopyWith<$Res> {
  __$$ProfileCopyWithImpl(_$Profile _value, $Res Function(_$Profile) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Profile with DiagnosticableTreeMixin implements Profile {
  const _$Profile();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.profile()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'UserEvent.profile'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Profile);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function(int wilayaId) commune,
    required TResult Function() wilaya,
    required TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)
        status,
    required TResult Function() call,
    required TResult Function() profile,
    required TResult Function(int searchKey) search,
    required TResult Function(String? id, String? name) product,
    required TResult Function() distract,
  }) {
    return profile();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function(int wilayaId)? commune,
    TResult? Function()? wilaya,
    TResult? Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult? Function()? call,
    TResult? Function()? profile,
    TResult? Function(int searchKey)? search,
    TResult? Function(String? id, String? name)? product,
    TResult? Function()? distract,
  }) {
    return profile?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function(int wilayaId)? commune,
    TResult Function()? wilaya,
    TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult Function()? call,
    TResult Function()? profile,
    TResult Function(int searchKey)? search,
    TResult Function(String? id, String? name)? product,
    TResult Function()? distract,
    required TResult orElse(),
  }) {
    if (profile != null) {
      return profile();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(Commune value) commune,
    required TResult Function(Wilaya value) wilaya,
    required TResult Function(Status value) status,
    required TResult Function(Call value) call,
    required TResult Function(Profile value) profile,
    required TResult Function(Search value) search,
    required TResult Function(Product value) product,
    required TResult Function(Distract value) distract,
  }) {
    return profile(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(Commune value)? commune,
    TResult? Function(Wilaya value)? wilaya,
    TResult? Function(Status value)? status,
    TResult? Function(Call value)? call,
    TResult? Function(Profile value)? profile,
    TResult? Function(Search value)? search,
    TResult? Function(Product value)? product,
    TResult? Function(Distract value)? distract,
  }) {
    return profile?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(Commune value)? commune,
    TResult Function(Wilaya value)? wilaya,
    TResult Function(Status value)? status,
    TResult Function(Call value)? call,
    TResult Function(Profile value)? profile,
    TResult Function(Search value)? search,
    TResult Function(Product value)? product,
    TResult Function(Distract value)? distract,
    required TResult orElse(),
  }) {
    if (profile != null) {
      return profile(this);
    }
    return orElse();
  }
}

abstract class Profile implements UserEvent {
  const factory Profile() = _$Profile;
}

/// @nodoc
abstract class _$$SearchCopyWith<$Res> {
  factory _$$SearchCopyWith(_$Search value, $Res Function(_$Search) then) =
      __$$SearchCopyWithImpl<$Res>;
  @useResult
  $Res call({int searchKey});
}

/// @nodoc
class __$$SearchCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$Search>
    implements _$$SearchCopyWith<$Res> {
  __$$SearchCopyWithImpl(_$Search _value, $Res Function(_$Search) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? searchKey = null,
  }) {
    return _then(_$Search(
      null == searchKey
          ? _value.searchKey
          : searchKey // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Search with DiagnosticableTreeMixin implements Search {
  const _$Search(this.searchKey);

  @override
  final int searchKey;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.search(searchKey: $searchKey)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvent.search'))
      ..add(DiagnosticsProperty('searchKey', searchKey));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Search &&
            (identical(other.searchKey, searchKey) ||
                other.searchKey == searchKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, searchKey);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SearchCopyWith<_$Search> get copyWith =>
      __$$SearchCopyWithImpl<_$Search>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function(int wilayaId) commune,
    required TResult Function() wilaya,
    required TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)
        status,
    required TResult Function() call,
    required TResult Function() profile,
    required TResult Function(int searchKey) search,
    required TResult Function(String? id, String? name) product,
    required TResult Function() distract,
  }) {
    return search(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function(int wilayaId)? commune,
    TResult? Function()? wilaya,
    TResult? Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult? Function()? call,
    TResult? Function()? profile,
    TResult? Function(int searchKey)? search,
    TResult? Function(String? id, String? name)? product,
    TResult? Function()? distract,
  }) {
    return search?.call(searchKey);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function(int wilayaId)? commune,
    TResult Function()? wilaya,
    TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult Function()? call,
    TResult Function()? profile,
    TResult Function(int searchKey)? search,
    TResult Function(String? id, String? name)? product,
    TResult Function()? distract,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(searchKey);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(Commune value) commune,
    required TResult Function(Wilaya value) wilaya,
    required TResult Function(Status value) status,
    required TResult Function(Call value) call,
    required TResult Function(Profile value) profile,
    required TResult Function(Search value) search,
    required TResult Function(Product value) product,
    required TResult Function(Distract value) distract,
  }) {
    return search(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(Commune value)? commune,
    TResult? Function(Wilaya value)? wilaya,
    TResult? Function(Status value)? status,
    TResult? Function(Call value)? call,
    TResult? Function(Profile value)? profile,
    TResult? Function(Search value)? search,
    TResult? Function(Product value)? product,
    TResult? Function(Distract value)? distract,
  }) {
    return search?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(Commune value)? commune,
    TResult Function(Wilaya value)? wilaya,
    TResult Function(Status value)? status,
    TResult Function(Call value)? call,
    TResult Function(Profile value)? profile,
    TResult Function(Search value)? search,
    TResult Function(Product value)? product,
    TResult Function(Distract value)? distract,
    required TResult orElse(),
  }) {
    if (search != null) {
      return search(this);
    }
    return orElse();
  }
}

abstract class Search implements UserEvent {
  const factory Search(final int searchKey) = _$Search;

  int get searchKey;
  @JsonKey(ignore: true)
  _$$SearchCopyWith<_$Search> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ProductCopyWith<$Res> {
  factory _$$ProductCopyWith(_$Product value, $Res Function(_$Product) then) =
      __$$ProductCopyWithImpl<$Res>;
  @useResult
  $Res call({String? id, String? name});
}

/// @nodoc
class __$$ProductCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$Product>
    implements _$$ProductCopyWith<$Res> {
  __$$ProductCopyWithImpl(_$Product _value, $Res Function(_$Product) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
  }) {
    return _then(_$Product(
      freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$Product with DiagnosticableTreeMixin implements Product {
  const _$Product(this.id, this.name);

  @override
  final String? id;
  @override
  final String? name;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.product(id: $id, name: $name)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserEvent.product'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('name', name));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$Product &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductCopyWith<_$Product> get copyWith =>
      __$$ProductCopyWithImpl<_$Product>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function(int wilayaId) commune,
    required TResult Function() wilaya,
    required TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)
        status,
    required TResult Function() call,
    required TResult Function() profile,
    required TResult Function(int searchKey) search,
    required TResult Function(String? id, String? name) product,
    required TResult Function() distract,
  }) {
    return product(id, name);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function(int wilayaId)? commune,
    TResult? Function()? wilaya,
    TResult? Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult? Function()? call,
    TResult? Function()? profile,
    TResult? Function(int searchKey)? search,
    TResult? Function(String? id, String? name)? product,
    TResult? Function()? distract,
  }) {
    return product?.call(id, name);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function(int wilayaId)? commune,
    TResult Function()? wilaya,
    TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult Function()? call,
    TResult Function()? profile,
    TResult Function(int searchKey)? search,
    TResult Function(String? id, String? name)? product,
    TResult Function()? distract,
    required TResult orElse(),
  }) {
    if (product != null) {
      return product(id, name);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(Commune value) commune,
    required TResult Function(Wilaya value) wilaya,
    required TResult Function(Status value) status,
    required TResult Function(Call value) call,
    required TResult Function(Profile value) profile,
    required TResult Function(Search value) search,
    required TResult Function(Product value) product,
    required TResult Function(Distract value) distract,
  }) {
    return product(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(Commune value)? commune,
    TResult? Function(Wilaya value)? wilaya,
    TResult? Function(Status value)? status,
    TResult? Function(Call value)? call,
    TResult? Function(Profile value)? profile,
    TResult? Function(Search value)? search,
    TResult? Function(Product value)? product,
    TResult? Function(Distract value)? distract,
  }) {
    return product?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(Commune value)? commune,
    TResult Function(Wilaya value)? wilaya,
    TResult Function(Status value)? status,
    TResult Function(Call value)? call,
    TResult Function(Profile value)? profile,
    TResult Function(Search value)? search,
    TResult Function(Product value)? product,
    TResult Function(Distract value)? distract,
    required TResult orElse(),
  }) {
    if (product != null) {
      return product(this);
    }
    return orElse();
  }
}

abstract class Product implements UserEvent {
  const factory Product(final String? id, final String? name) = _$Product;

  String? get id;
  String? get name;
  @JsonKey(ignore: true)
  _$$ProductCopyWith<_$Product> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DistractCopyWith<$Res> {
  factory _$$DistractCopyWith(
          _$Distract value, $Res Function(_$Distract) then) =
      __$$DistractCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DistractCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$Distract>
    implements _$$DistractCopyWith<$Res> {
  __$$DistractCopyWithImpl(_$Distract _value, $Res Function(_$Distract) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Distract with DiagnosticableTreeMixin implements Distract {
  const _$Distract();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserEvent.distract()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty('type', 'UserEvent.distract'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Distract);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String username, String password) login,
    required TResult Function(int wilayaId) commune,
    required TResult Function() wilaya,
    required TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)
        status,
    required TResult Function() call,
    required TResult Function() profile,
    required TResult Function(int searchKey) search,
    required TResult Function(String? id, String? name) product,
    required TResult Function() distract,
  }) {
    return distract();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String username, String password)? login,
    TResult? Function(int wilayaId)? commune,
    TResult? Function()? wilaya,
    TResult? Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult? Function()? call,
    TResult? Function()? profile,
    TResult? Function(int searchKey)? search,
    TResult? Function(String? id, String? name)? product,
    TResult? Function()? distract,
  }) {
    return distract?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String username, String password)? login,
    TResult Function(int wilayaId)? commune,
    TResult Function()? wilaya,
    TResult Function(
            String? id,
            int? status,
            int? cancellationReason,
            int? callBackReason,
            String? postponedDate,
            int? commune,
            int? totalPrice,
            String? customerName,
            String? customerPhone,
            String? customerPhone2,
            String? customerAddress,
            String? deliveryNote,
            List<ProductModel?>? details)?
        status,
    TResult Function()? call,
    TResult Function()? profile,
    TResult Function(int searchKey)? search,
    TResult Function(String? id, String? name)? product,
    TResult Function()? distract,
    required TResult orElse(),
  }) {
    if (distract != null) {
      return distract();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Login value) login,
    required TResult Function(Commune value) commune,
    required TResult Function(Wilaya value) wilaya,
    required TResult Function(Status value) status,
    required TResult Function(Call value) call,
    required TResult Function(Profile value) profile,
    required TResult Function(Search value) search,
    required TResult Function(Product value) product,
    required TResult Function(Distract value) distract,
  }) {
    return distract(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Login value)? login,
    TResult? Function(Commune value)? commune,
    TResult? Function(Wilaya value)? wilaya,
    TResult? Function(Status value)? status,
    TResult? Function(Call value)? call,
    TResult? Function(Profile value)? profile,
    TResult? Function(Search value)? search,
    TResult? Function(Product value)? product,
    TResult? Function(Distract value)? distract,
  }) {
    return distract?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Login value)? login,
    TResult Function(Commune value)? commune,
    TResult Function(Wilaya value)? wilaya,
    TResult Function(Status value)? status,
    TResult Function(Call value)? call,
    TResult Function(Profile value)? profile,
    TResult Function(Search value)? search,
    TResult Function(Product value)? product,
    TResult Function(Distract value)? distract,
    required TResult orElse(),
  }) {
    if (distract != null) {
      return distract(this);
    }
    return orElse();
  }
}

abstract class Distract implements UserEvent {
  const factory Distract() = _$Distract;
}
