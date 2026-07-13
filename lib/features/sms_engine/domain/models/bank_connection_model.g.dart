// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_connection_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetBankConnectionModelCollection on Isar {
  IsarCollection<BankConnectionModel> get bankConnectionModels =>
      this.collection();
}

const BankConnectionModelSchema = CollectionSchema(
  name: r'bank_conn',
  id: -6406255074096556358,
  properties: {
    r'bankName': PropertySchema(
      id: 0,
      name: r'bankName',
      type: IsarType.string,
    ),
    r'isConnected': PropertySchema(
      id: 1,
      name: r'isConnected',
      type: IsarType.bool,
    ),
    r'lastSyncedTimestamp': PropertySchema(
      id: 2,
      name: r'lastSyncedTimestamp',
      type: IsarType.dateTime,
    ),
    r'parsedMessageCount': PropertySchema(
      id: 3,
      name: r'parsedMessageCount',
      type: IsarType.long,
    )
  },
  estimateSize: _bankConnectionModelEstimateSize,
  serialize: _bankConnectionModelSerialize,
  deserialize: _bankConnectionModelDeserialize,
  deserializeProp: _bankConnectionModelDeserializeProp,
  idName: r'id',
  indexes: {
    r'bankName': IndexSchema(
      id: -7280139059047129133,
      name: r'bankName',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'bankName',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _bankConnectionModelGetId,
  getLinks: _bankConnectionModelGetLinks,
  attach: _bankConnectionModelAttach,
  version: '3.1.0+1',
);

int _bankConnectionModelEstimateSize(
  BankConnectionModel object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.bankName.length * 3;
  return bytesCount;
}

void _bankConnectionModelSerialize(
  BankConnectionModel object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.bankName);
  writer.writeBool(offsets[1], object.isConnected);
  writer.writeDateTime(offsets[2], object.lastSyncedTimestamp);
  writer.writeLong(offsets[3], object.parsedMessageCount);
}

BankConnectionModel _bankConnectionModelDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = BankConnectionModel();
  object.bankName = reader.readString(offsets[0]);
  object.id = id;
  object.isConnected = reader.readBool(offsets[1]);
  object.lastSyncedTimestamp = reader.readDateTime(offsets[2]);
  object.parsedMessageCount = reader.readLong(offsets[3]);
  return object;
}

P _bankConnectionModelDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readBool(offset)) as P;
    case 2:
      return (reader.readDateTime(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _bankConnectionModelGetId(BankConnectionModel object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _bankConnectionModelGetLinks(
    BankConnectionModel object) {
  return [];
}

void _bankConnectionModelAttach(
    IsarCollection<dynamic> col, Id id, BankConnectionModel object) {
  object.id = id;
}

extension BankConnectionModelByIndex on IsarCollection<BankConnectionModel> {
  Future<BankConnectionModel?> getByBankName(String bankName) {
    return getByIndex(r'bankName', [bankName]);
  }

  BankConnectionModel? getByBankNameSync(String bankName) {
    return getByIndexSync(r'bankName', [bankName]);
  }

  Future<bool> deleteByBankName(String bankName) {
    return deleteByIndex(r'bankName', [bankName]);
  }

  bool deleteByBankNameSync(String bankName) {
    return deleteByIndexSync(r'bankName', [bankName]);
  }

  Future<List<BankConnectionModel?>> getAllByBankName(
      List<String> bankNameValues) {
    final values = bankNameValues.map((e) => [e]).toList();
    return getAllByIndex(r'bankName', values);
  }

  List<BankConnectionModel?> getAllByBankNameSync(List<String> bankNameValues) {
    final values = bankNameValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'bankName', values);
  }

  Future<int> deleteAllByBankName(List<String> bankNameValues) {
    final values = bankNameValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'bankName', values);
  }

  int deleteAllByBankNameSync(List<String> bankNameValues) {
    final values = bankNameValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'bankName', values);
  }

  Future<Id> putByBankName(BankConnectionModel object) {
    return putByIndex(r'bankName', object);
  }

  Id putByBankNameSync(BankConnectionModel object, {bool saveLinks = true}) {
    return putByIndexSync(r'bankName', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByBankName(List<BankConnectionModel> objects) {
    return putAllByIndex(r'bankName', objects);
  }

  List<Id> putAllByBankNameSync(List<BankConnectionModel> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'bankName', objects, saveLinks: saveLinks);
  }
}

extension BankConnectionModelQueryWhereSort
    on QueryBuilder<BankConnectionModel, BankConnectionModel, QWhere> {
  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension BankConnectionModelQueryWhere
    on QueryBuilder<BankConnectionModel, BankConnectionModel, QWhereClause> {
  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterWhereClause>
      idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterWhereClause>
      idNotEqualTo(Id id) {
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

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterWhereClause>
      idGreaterThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterWhereClause>
      idLessThan(Id id, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterWhereClause>
      idBetween(
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

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterWhereClause>
      bankNameEqualTo(String bankName) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'bankName',
        value: [bankName],
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterWhereClause>
      bankNameNotEqualTo(String bankName) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bankName',
              lower: [],
              upper: [bankName],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bankName',
              lower: [bankName],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bankName',
              lower: [bankName],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'bankName',
              lower: [],
              upper: [bankName],
              includeUpper: false,
            ));
      }
    });
  }
}

extension BankConnectionModelQueryFilter on QueryBuilder<BankConnectionModel,
    BankConnectionModel, QFilterCondition> {
  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      bankNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      bankNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      bankNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      bankNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'bankName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      bankNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      bankNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      bankNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'bankName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      bankNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'bankName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      bankNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'bankName',
        value: '',
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      bankNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'bankName',
        value: '',
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      idEqualTo(Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      idGreaterThan(
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

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      idLessThan(
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

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      idBetween(
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

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      isConnectedEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isConnected',
        value: value,
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      lastSyncedTimestampEqualTo(DateTime value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'lastSyncedTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      lastSyncedTimestampGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'lastSyncedTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      lastSyncedTimestampLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'lastSyncedTimestamp',
        value: value,
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      lastSyncedTimestampBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'lastSyncedTimestamp',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      parsedMessageCountEqualTo(int value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'parsedMessageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      parsedMessageCountGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'parsedMessageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      parsedMessageCountLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'parsedMessageCount',
        value: value,
      ));
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterFilterCondition>
      parsedMessageCountBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'parsedMessageCount',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
      ));
    });
  }
}

extension BankConnectionModelQueryObject on QueryBuilder<BankConnectionModel,
    BankConnectionModel, QFilterCondition> {}

extension BankConnectionModelQueryLinks on QueryBuilder<BankConnectionModel,
    BankConnectionModel, QFilterCondition> {}

extension BankConnectionModelQuerySortBy
    on QueryBuilder<BankConnectionModel, BankConnectionModel, QSortBy> {
  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterSortBy>
      sortByBankName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.asc);
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterSortBy>
      sortByBankNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.desc);
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterSortBy>
      sortByIsConnected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isConnected', Sort.asc);
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterSortBy>
      sortByIsConnectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isConnected', Sort.desc);
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterSortBy>
      sortByLastSyncedTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedTimestamp', Sort.asc);
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterSortBy>
      sortByLastSyncedTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedTimestamp', Sort.desc);
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterSortBy>
      sortByParsedMessageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parsedMessageCount', Sort.asc);
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterSortBy>
      sortByParsedMessageCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parsedMessageCount', Sort.desc);
    });
  }
}

extension BankConnectionModelQuerySortThenBy
    on QueryBuilder<BankConnectionModel, BankConnectionModel, QSortThenBy> {
  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterSortBy>
      thenByBankName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.asc);
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterSortBy>
      thenByBankNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'bankName', Sort.desc);
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterSortBy>
      thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterSortBy>
      thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterSortBy>
      thenByIsConnected() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isConnected', Sort.asc);
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterSortBy>
      thenByIsConnectedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isConnected', Sort.desc);
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterSortBy>
      thenByLastSyncedTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedTimestamp', Sort.asc);
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterSortBy>
      thenByLastSyncedTimestampDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'lastSyncedTimestamp', Sort.desc);
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterSortBy>
      thenByParsedMessageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parsedMessageCount', Sort.asc);
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QAfterSortBy>
      thenByParsedMessageCountDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'parsedMessageCount', Sort.desc);
    });
  }
}

extension BankConnectionModelQueryWhereDistinct
    on QueryBuilder<BankConnectionModel, BankConnectionModel, QDistinct> {
  QueryBuilder<BankConnectionModel, BankConnectionModel, QDistinct>
      distinctByBankName({bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'bankName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QDistinct>
      distinctByIsConnected() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isConnected');
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QDistinct>
      distinctByLastSyncedTimestamp() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'lastSyncedTimestamp');
    });
  }

  QueryBuilder<BankConnectionModel, BankConnectionModel, QDistinct>
      distinctByParsedMessageCount() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'parsedMessageCount');
    });
  }
}

extension BankConnectionModelQueryProperty
    on QueryBuilder<BankConnectionModel, BankConnectionModel, QQueryProperty> {
  QueryBuilder<BankConnectionModel, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<BankConnectionModel, String, QQueryOperations>
      bankNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'bankName');
    });
  }

  QueryBuilder<BankConnectionModel, bool, QQueryOperations>
      isConnectedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isConnected');
    });
  }

  QueryBuilder<BankConnectionModel, DateTime, QQueryOperations>
      lastSyncedTimestampProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'lastSyncedTimestamp');
    });
  }

  QueryBuilder<BankConnectionModel, int, QQueryOperations>
      parsedMessageCountProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'parsedMessageCount');
    });
  }
}
