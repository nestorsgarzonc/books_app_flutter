// Mocks generated by Mockito 5.0.16 from annotations
// in flutter_books/test/features/favourites/bloc/favorites_bloc_testing.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i3;
import 'package:flutter_books/core/failure/failure.dart' as _i6;
import 'package:flutter_books/features/favorites/datasources/favorites_datasource.dart'
    as _i2;
import 'package:flutter_books/features/favorites/repository/favorites_repository.dart'
    as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeIFavoriteDatasource_0 extends _i1.Fake
    implements _i2.IFavoriteDatasource {}

class _FakeEither_1<L, R> extends _i1.Fake implements _i3.Either<L, R> {}

/// A class which mocks [FavoriteRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFavoriteRepository extends _i1.Mock
    implements _i4.FavoriteRepository {
  MockFavoriteRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IFavoriteDatasource get favoriteDatasource => (super.noSuchMethod(
      Invocation.getter(#favoriteDatasource),
      returnValue: _FakeIFavoriteDatasource_0()) as _i2.IFavoriteDatasource);
  @override
  _i5.Future<_i6.Failure?> addToFavorites(String? id) => (super.noSuchMethod(
      Invocation.method(#addToFavorites, [id]),
      returnValue: Future<_i6.Failure?>.value()) as _i5.Future<_i6.Failure?>);
  @override
  _i5.Future<_i3.Either<_i6.Failure, List<String>>> fetchFavorites() =>
      (super.noSuchMethod(Invocation.method(#fetchFavorites, []),
              returnValue: Future<_i3.Either<_i6.Failure, List<String>>>.value(
                  _FakeEither_1<_i6.Failure, List<String>>()))
          as _i5.Future<_i3.Either<_i6.Failure, List<String>>>);
  @override
  _i5.Future<_i6.Failure?> removeFromFavorites(String? id) =>
      (super.noSuchMethod(Invocation.method(#removeFromFavorites, [id]),
              returnValue: Future<_i6.Failure?>.value())
          as _i5.Future<_i6.Failure?>);
  @override
  String toString() => super.toString();
}