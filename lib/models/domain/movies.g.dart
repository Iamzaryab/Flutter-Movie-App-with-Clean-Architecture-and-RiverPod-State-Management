// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movies.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetMoviesCollection on Isar {
  IsarCollection<Movies> get movies => this.collection();
}

const MoviesSchema = CollectionSchema(
  name: r'Movies',
  id: 4160322617893273227,
  properties: {
    r'cached': PropertySchema(
      id: 0,
      name: r'cached',
      type: IsarType.bool,
    ),
    r'movies': PropertySchema(
      id: 1,
      name: r'movies',
      type: IsarType.objectList,
      target: r'Movie',
    ),
    r'page': PropertySchema(
      id: 2,
      name: r'page',
      type: IsarType.long,
    ),
    r'totalPages': PropertySchema(
      id: 3,
      name: r'totalPages',
      type: IsarType.long,
    ),
    r'totalResults': PropertySchema(
      id: 4,
      name: r'totalResults',
      type: IsarType.long,
    ),
    r'type': PropertySchema(
      id: 5,
      name: r'type',
      type: IsarType.string,
    )
  },
  estimateSize: _moviesEstimateSize,
  serialize: _moviesSerialize,
  deserialize: _moviesDeserialize,
  deserializeProp: _moviesDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Movie': MovieSchema},
  getId: _moviesGetId,
  getLinks: _moviesGetLinks,
  attach: _moviesAttach,
  version: '3.1.0+1',
);

int _moviesEstimateSize(
  Movies object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.movies.length * 3;
  {
    final offsets = allOffsets[Movie]!;
    for (var i = 0; i < object.movies.length; i++) {
      final value = object.movies[i];
      bytesCount += MovieSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  bytesCount += 3 + object.type.length * 3;
  return bytesCount;
}

void _moviesSerialize(
  Movies object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeBool(offsets[0], object.cached);
  writer.writeObjectList<Movie>(
    offsets[1],
    allOffsets,
    MovieSchema.serialize,
    object.movies,
  );
  writer.writeLong(offsets[2], object.page);
  writer.writeLong(offsets[3], object.totalPages);
  writer.writeLong(offsets[4], object.totalResults);
  writer.writeString(offsets[5], object.type);
}

Movies _moviesDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Movies(
    cached: reader.readBool(offsets[0]),
    id: id,
    movies: reader.readObjectList<Movie>(
          offsets[1],
          MovieSchema.deserialize,
          allOffsets,
          Movie(),
        ) ??
        [],
    page: reader.readLong(offsets[2]),
    totalPages: reader.readLong(offsets[3]),
    totalResults: reader.readLong(offsets[4]),
    type: reader.readString(offsets[5]),
  );
  return object;
}

P _moviesDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readBool(offset)) as P;
    case 1:
      return (reader.readObjectList<Movie>(
            offset,
            MovieSchema.deserialize,
            allOffsets,
            Movie(),
          ) ??
          []) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readLong(offset)) as P;
    case 5:
      return (reader.readString(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _moviesGetId(Movies object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _moviesGetLinks(Movies object) {
  return [];
}

void _moviesAttach(IsarCollection<dynamic> col, Id id, Movies object) {}

extension MoviesQueryWhereSort on QueryBuilder<Movies, Movies, QWhere> {
  QueryBuilder<Movies, Movies, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension MoviesQueryWhere on QueryBuilder<Movies, Movies, QWhereClause> {
  QueryBuilder<Movies, Movies, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterWhereClause> idNotEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: id, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: id, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Movies, Movies, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Movies, Movies, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Movies, Movies, QAfterWhereClause> idBetween(
    Id lowerId,
    Id upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerId,
        includeLower: includeLower,
        upper: upperId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension MoviesQueryFilter on QueryBuilder<Movies, Movies, QFilterCondition> {
  QueryBuilder<Movies, Movies, QAfterFilterCondition> cachedEqualTo(
      bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'cached',
        value: value,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> idGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> idLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> idBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'id',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> moviesLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'movies',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> moviesIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'movies',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> moviesIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'movies',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> moviesLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'movies',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> moviesLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'movies',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> moviesLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'movies',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> pageEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'page',
        value: value,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> pageGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'page',
        value: value,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> pageLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'page',
        value: value,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> pageBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'page',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> totalPagesEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalPages',
        value: value,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> totalPagesGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalPages',
        value: value,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> totalPagesLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalPages',
        value: value,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> totalPagesBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalPages',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> totalResultsEqualTo(
      int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'totalResults',
        value: value,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> totalResultsGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'totalResults',
        value: value,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> totalResultsLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'totalResults',
        value: value,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> totalResultsBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'totalResults',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> typeEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> typeGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> typeLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> typeBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'type',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> typeStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> typeEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> typeContains(String value,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'type',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> typeMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'type',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> typeIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'type',
        value: '',
      ));
    });
  }

  QueryBuilder<Movies, Movies, QAfterFilterCondition> typeIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'type',
        value: '',
      ));
    });
  }
}

extension MoviesQueryObject on QueryBuilder<Movies, Movies, QFilterCondition> {
  QueryBuilder<Movies, Movies, QAfterFilterCondition> moviesElement(
      FilterQuery<Movie> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'movies');
    });
  }
}

extension MoviesQueryLinks on QueryBuilder<Movies, Movies, QFilterCondition> {}

extension MoviesQuerySortBy on QueryBuilder<Movies, Movies, QSortBy> {
  QueryBuilder<Movies, Movies, QAfterSortBy> sortByCached() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cached', Sort.asc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> sortByCachedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cached', Sort.desc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> sortByPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'page', Sort.asc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> sortByPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'page', Sort.desc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> sortByTotalPages() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPages', Sort.asc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> sortByTotalPagesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPages', Sort.desc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> sortByTotalResults() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalResults', Sort.asc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> sortByTotalResultsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalResults', Sort.desc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> sortByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> sortByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension MoviesQuerySortThenBy on QueryBuilder<Movies, Movies, QSortThenBy> {
  QueryBuilder<Movies, Movies, QAfterSortBy> thenByCached() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cached', Sort.asc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> thenByCachedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'cached', Sort.desc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> thenByPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'page', Sort.asc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> thenByPageDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'page', Sort.desc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> thenByTotalPages() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPages', Sort.asc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> thenByTotalPagesDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalPages', Sort.desc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> thenByTotalResults() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalResults', Sort.asc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> thenByTotalResultsDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalResults', Sort.desc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> thenByType() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.asc);
    });
  }

  QueryBuilder<Movies, Movies, QAfterSortBy> thenByTypeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'type', Sort.desc);
    });
  }
}

extension MoviesQueryWhereDistinct on QueryBuilder<Movies, Movies, QDistinct> {
  QueryBuilder<Movies, Movies, QDistinct> distinctByCached() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'cached');
    });
  }

  QueryBuilder<Movies, Movies, QDistinct> distinctByPage() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'page');
    });
  }

  QueryBuilder<Movies, Movies, QDistinct> distinctByTotalPages() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalPages');
    });
  }

  QueryBuilder<Movies, Movies, QDistinct> distinctByTotalResults() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalResults');
    });
  }

  QueryBuilder<Movies, Movies, QDistinct> distinctByType(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'type', caseSensitive: caseSensitive);
    });
  }
}

extension MoviesQueryProperty on QueryBuilder<Movies, Movies, QQueryProperty> {
  QueryBuilder<Movies, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Movies, bool, QQueryOperations> cachedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'cached');
    });
  }

  QueryBuilder<Movies, List<Movie>, QQueryOperations> moviesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'movies');
    });
  }

  QueryBuilder<Movies, int, QQueryOperations> pageProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'page');
    });
  }

  QueryBuilder<Movies, int, QQueryOperations> totalPagesProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalPages');
    });
  }

  QueryBuilder<Movies, int, QQueryOperations> totalResultsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalResults');
    });
  }

  QueryBuilder<Movies, String, QQueryOperations> typeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'type');
    });
  }
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Movies _$$_MoviesFromJson(Map<String, dynamic> json) => _$_Movies(
      id: json['id'] as int? ?? Isar.autoIncrement,
      movies: (json['movies'] as List<dynamic>?)
              ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      type: json['type'] as String? ?? '',
      page: json['page'] as int? ?? 0,
      totalPages: json['totalPages'] as int? ?? 0,
      totalResults: json['totalResults'] as int? ?? 0,
      cached: json['cached'] as bool? ?? false,
    );

Map<String, dynamic> _$$_MoviesToJson(_$_Movies instance) => <String, dynamic>{
      'id': instance.id,
      'movies': instance.movies.map((e) => e.toJson()).toList(),
      'type': instance.type,
      'page': instance.page,
      'totalPages': instance.totalPages,
      'totalResults': instance.totalResults,
      'cached': instance.cached,
    };
