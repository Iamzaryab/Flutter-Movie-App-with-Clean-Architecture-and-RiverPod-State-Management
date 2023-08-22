// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'casts.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCastsCollection on Isar {
  IsarCollection<Casts> get casts => this.collection();
}

const CastsSchema = CollectionSchema(
  name: r'Casts',
  id: -8589319767466135828,
  properties: {
    r'casts': PropertySchema(
      id: 0,
      name: r'casts',
      type: IsarType.objectList,
      target: r'Cast',
    ),
    r'id': PropertySchema(
      id: 1,
      name: r'id',
      type: IsarType.long,
    )
  },
  estimateSize: _castsEstimateSize,
  serialize: _castsSerialize,
  deserialize: _castsDeserialize,
  deserializeProp: _castsDeserializeProp,
  idName: r'isarId',
  indexes: {},
  links: {},
  embeddedSchemas: {r'Cast': CastSchema},
  getId: _castsGetId,
  getLinks: _castsGetLinks,
  attach: _castsAttach,
  version: '3.1.0+1',
);

int _castsEstimateSize(
  Casts object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.casts.length * 3;
  {
    final offsets = allOffsets[Cast]!;
    for (var i = 0; i < object.casts.length; i++) {
      final value = object.casts[i];
      bytesCount += CastSchema.estimateSize(value, offsets, allOffsets);
    }
  }
  return bytesCount;
}

void _castsSerialize(
  Casts object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeObjectList<Cast>(
    offsets[0],
    allOffsets,
    CastSchema.serialize,
    object.casts,
  );
  writer.writeLong(offsets[1], object.id);
}

Casts _castsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = Casts(
    casts: reader.readObjectList<Cast>(
          offsets[0],
          CastSchema.deserialize,
          allOffsets,
          Cast(),
        ) ??
        [],
    id: reader.readLong(offsets[1]),
    isarId: id,
  );
  return object;
}

P _castsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readObjectList<Cast>(
            offset,
            CastSchema.deserialize,
            allOffsets,
            Cast(),
          ) ??
          []) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _castsGetId(Casts object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _castsGetLinks(Casts object) {
  return [];
}

void _castsAttach(IsarCollection<dynamic> col, Id id, Casts object) {}

extension CastsQueryWhereSort on QueryBuilder<Casts, Casts, QWhere> {
  QueryBuilder<Casts, Casts, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CastsQueryWhere on QueryBuilder<Casts, Casts, QWhereClause> {
  QueryBuilder<Casts, Casts, QAfterWhereClause> isarIdEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: isarId,
        upper: isarId,
      ));
    });
  }

  QueryBuilder<Casts, Casts, QAfterWhereClause> isarIdNotEqualTo(Id isarId) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<Casts, Casts, QAfterWhereClause> isarIdGreaterThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<Casts, Casts, QAfterWhereClause> isarIdLessThan(Id isarId,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<Casts, Casts, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: lowerIsarId,
        includeLower: includeLower,
        upper: upperIsarId,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CastsQueryFilter on QueryBuilder<Casts, Casts, QFilterCondition> {
  QueryBuilder<Casts, Casts, QAfterFilterCondition> castsLengthEqualTo(
      int length) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'casts',
        length,
        true,
        length,
        true,
      );
    });
  }

  QueryBuilder<Casts, Casts, QAfterFilterCondition> castsIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'casts',
        0,
        true,
        0,
        true,
      );
    });
  }

  QueryBuilder<Casts, Casts, QAfterFilterCondition> castsIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'casts',
        0,
        false,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Casts, Casts, QAfterFilterCondition> castsLengthLessThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'casts',
        0,
        true,
        length,
        include,
      );
    });
  }

  QueryBuilder<Casts, Casts, QAfterFilterCondition> castsLengthGreaterThan(
    int length, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'casts',
        length,
        include,
        999999,
        true,
      );
    });
  }

  QueryBuilder<Casts, Casts, QAfterFilterCondition> castsLengthBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.listLength(
        r'casts',
        lower,
        includeLower,
        upper,
        includeUpper,
      );
    });
  }

  QueryBuilder<Casts, Casts, QAfterFilterCondition> idEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<Casts, Casts, QAfterFilterCondition> idGreaterThan(
    int value, {
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

  QueryBuilder<Casts, Casts, QAfterFilterCondition> idLessThan(
    int value, {
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

  QueryBuilder<Casts, Casts, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
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

  QueryBuilder<Casts, Casts, QAfterFilterCondition> isarIdEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Casts, Casts, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Casts, Casts, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'isarId',
        value: value,
      ));
    });
  }

  QueryBuilder<Casts, Casts, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'isarId',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension CastsQueryObject on QueryBuilder<Casts, Casts, QFilterCondition> {
  QueryBuilder<Casts, Casts, QAfterFilterCondition> castsElement(
      FilterQuery<Cast> q) {
    return QueryBuilder.apply(this, (query) {
      return query.object(q, r'casts');
    });
  }
}

extension CastsQueryLinks on QueryBuilder<Casts, Casts, QFilterCondition> {}

extension CastsQuerySortBy on QueryBuilder<Casts, Casts, QSortBy> {
  QueryBuilder<Casts, Casts, QAfterSortBy> sortById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Casts, Casts, QAfterSortBy> sortByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }
}

extension CastsQuerySortThenBy on QueryBuilder<Casts, Casts, QSortThenBy> {
  QueryBuilder<Casts, Casts, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<Casts, Casts, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<Casts, Casts, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<Casts, Casts, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }
}

extension CastsQueryWhereDistinct on QueryBuilder<Casts, Casts, QDistinct> {
  QueryBuilder<Casts, Casts, QDistinct> distinctById() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'id');
    });
  }
}

extension CastsQueryProperty on QueryBuilder<Casts, Casts, QQueryProperty> {
  QueryBuilder<Casts, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<Casts, List<Cast>, QQueryOperations> castsProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'casts');
    });
  }

  QueryBuilder<Casts, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }
}
