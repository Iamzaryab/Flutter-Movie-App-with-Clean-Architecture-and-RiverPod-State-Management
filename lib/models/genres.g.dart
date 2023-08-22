// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'genres.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetGenresCollection on Isar {
  IsarCollection<Genres> get genres => this.collection();
}

const GenresSchema = CollectionSchema(
  name: r'Genres',
  id: -2984964928641538620,
  properties: {
    r'genres': PropertySchema(
      id: 0,
      name: r'genres',
      type: IsarType.objectList,
      target: r'Genre',
    )
  },
  estimateSize: _genresEstimateSize,
  serialize: _genresSerialize,
  deserialize: _genresDeserialize,
  deserializeProp: _genresDeserializeProp,
  idName: r'id',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Genre': GenreSchema},
  getId: _genresGetId,
  getLinks: _genresGetLinks,
  attach: _genresAttach,
  version: '3.1.0+1',
);

int _genresEstimateSize(
  Genres object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.genres.length * 3;
  {
    final offsets = allOffsets[Genre]!;
    for (var i = 0; i < object.genres.length; i++) {
      final value = object.genres[i];
      bytesCount += GenreSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _genresSerialize(
  Genres object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Genre>(
    offsets[0],
    allOffsets,
    GenreSchema.serialize,
    object.genres,
  );
}

Genres _genresDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Genres(
    genres: reader.readObjectList<Genre>(
          offsets[0],
          GenreSchema.deserialize,
          allOffsets,
          Genre(),
        ) ??
        [],
    id: id,
  );
  return object;
}

P _genresDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Genre>(
            offset,
            GenreSchema.deserialize,
            allOffsets,
            Genre(),
          ) ??
          []) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _genresGetId(Genres object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _genresGetLinks(Genres object) {
  return [];
}

void _genresAttach(IsarCollection<dynamic> col, Id id, Genres object) {}

extension GenresQueryWhereSort on QueryBuilder<Genres, Genres, QWhere> {
  QueryBuilder<Genres, Genres, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension GenresQueryWhere on QueryBuilder<Genres, Genres, QWhereClause> {
  QueryBuilder<Genres, Genres, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<Genres, Genres, QAfterWhereClause> idNotEqualTo(Id id) {
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

  QueryBuilder<Genres, Genres, QAfterWhereClause> idGreaterThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<Genres, Genres, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<Genres, Genres, QAfterWhereClause> idBetween(
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

extension GenresQueryFilter on QueryBuilder<Genres, Genres, QFilterCondition> {
  QueryBuilder<Genres, Genres, QAfterFilterCondition> genresLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Genres, Genres, QAfterFilterCondition> genresIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Genres, Genres, QAfterFilterCondition> genresIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Genres, Genres, QAfterFilterCondition> genresLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Genres, Genres, QAfterFilterCondition> genresLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Genres, Genres, QAfterFilterCondition> genresLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'genres',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Genres, Genres, QAfterFilterCondition> idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Genres, Genres, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Genres, Genres, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Genres, Genres, QAfterFilterCondition> idBetween(
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
}

extension GenresQueryObject on QueryBuilder<Genres, Genres, QFilterCondition> {
  QueryBuilder<Genres, Genres, QAfterFilterCondition> genresElement(
      FilterQuery<Genre> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'genres');
    });
  }
}

extension GenresQueryLinks on QueryBuilder<Genres, Genres, QFilterCondition> {}

extension GenresQuerySortBy on QueryBuilder<Genres, Genres, QSortBy> {}

extension GenresQuerySortThenBy on QueryBuilder<Genres, Genres, QSortThenBy> {
  QueryBuilder<Genres, Genres, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Genres, Genres, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension GenresQueryWhereDistinct on QueryBuilder<Genres, Genres, QDistinct> {}

extension GenresQueryProperty on QueryBuilder<Genres, Genres, QQueryProperty> {
  QueryBuilder<Genres, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<Genres, List<Genre>, QQueryOperations> genresProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'genres');
    });
  }
}
