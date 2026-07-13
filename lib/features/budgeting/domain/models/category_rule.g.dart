// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_rule.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetCategoryRuleCollection on Isar {
  IsarCollection<CategoryRule> get categoryRules => this.collection();
}

const CategoryRuleSchema = CollectionSchema(
  name: r'CategoryRule',
  id: 4255622899410938401,
  properties: {
    r'categoryName': PropertySchema(
      id: 0,
      name: r'categoryName',
      type: IsarType.string,
    ),
    r'identifier': PropertySchema(
      id: 1,
      name: r'identifier',
      type: IsarType.string,
    ),
    r'isIncome': PropertySchema(
      id: 2,
      name: r'isIncome',
      type: IsarType.bool,
    )
  },
  estimateSize: _categoryRuleEstimateSize,
  serialize: _categoryRuleSerialize,
  deserialize: _categoryRuleDeserialize,
  deserializeProp: _categoryRuleDeserializeProp,
  idName: r'id',
  indexes: {
    r'identifier': IndexSchema(
      id: -1091831983288130400,
      name: r'identifier',
      unique: true,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'identifier',
          type: IndexType.hash,
          caseSensitive: true,
        )
      ],
    )
  },
  links: {},
  embeddedSchemas: {},
  getId: _categoryRuleGetId,
  getLinks: _categoryRuleGetLinks,
  attach: _categoryRuleAttach,
  version: '3.1.0+1',
);

int _categoryRuleEstimateSize(
  CategoryRule object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.categoryName.length * 3;
  bytesCount += 3 + object.identifier.length * 3;
  return bytesCount;
}

void _categoryRuleSerialize(
  CategoryRule object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.categoryName);
  writer.writeString(offsets[1], object.identifier);
  writer.writeBool(offsets[2], object.isIncome);
}

CategoryRule _categoryRuleDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = CategoryRule();
  object.categoryName = reader.readString(offsets[0]);
  object.id = id;
  object.identifier = reader.readString(offsets[1]);
  object.isIncome = reader.readBool(offsets[2]);
  return object;
}

P _categoryRuleDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readBool(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _categoryRuleGetId(CategoryRule object) {
  return object.id;
}

List<IsarLinkBase<dynamic>> _categoryRuleGetLinks(CategoryRule object) {
  return [];
}

void _categoryRuleAttach(
    IsarCollection<dynamic> col, Id id, CategoryRule object) {
  object.id = id;
}

extension CategoryRuleByIndex on IsarCollection<CategoryRule> {
  Future<CategoryRule?> getByIdentifier(String identifier) {
    return getByIndex(r'identifier', [identifier]);
  }

  CategoryRule? getByIdentifierSync(String identifier) {
    return getByIndexSync(r'identifier', [identifier]);
  }

  Future<bool> deleteByIdentifier(String identifier) {
    return deleteByIndex(r'identifier', [identifier]);
  }

  bool deleteByIdentifierSync(String identifier) {
    return deleteByIndexSync(r'identifier', [identifier]);
  }

  Future<List<CategoryRule?>> getAllByIdentifier(
      List<String> identifierValues) {
    final values = identifierValues.map((e) => [e]).toList();
    return getAllByIndex(r'identifier', values);
  }

  List<CategoryRule?> getAllByIdentifierSync(List<String> identifierValues) {
    final values = identifierValues.map((e) => [e]).toList();
    return getAllByIndexSync(r'identifier', values);
  }

  Future<int> deleteAllByIdentifier(List<String> identifierValues) {
    final values = identifierValues.map((e) => [e]).toList();
    return deleteAllByIndex(r'identifier', values);
  }

  int deleteAllByIdentifierSync(List<String> identifierValues) {
    final values = identifierValues.map((e) => [e]).toList();
    return deleteAllByIndexSync(r'identifier', values);
  }

  Future<Id> putByIdentifier(CategoryRule object) {
    return putByIndex(r'identifier', object);
  }

  Id putByIdentifierSync(CategoryRule object, {bool saveLinks = true}) {
    return putByIndexSync(r'identifier', object, saveLinks: saveLinks);
  }

  Future<List<Id>> putAllByIdentifier(List<CategoryRule> objects) {
    return putAllByIndex(r'identifier', objects);
  }

  List<Id> putAllByIdentifierSync(List<CategoryRule> objects,
      {bool saveLinks = true}) {
    return putAllByIndexSync(r'identifier', objects, saveLinks: saveLinks);
  }
}

extension CategoryRuleQueryWhereSort
    on QueryBuilder<CategoryRule, CategoryRule, QWhere> {
  QueryBuilder<CategoryRule, CategoryRule, QAfterWhere> anyId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension CategoryRuleQueryWhere
    on QueryBuilder<CategoryRule, CategoryRule, QWhereClause> {
  QueryBuilder<CategoryRule, CategoryRule, QAfterWhereClause> idEqualTo(Id id) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IdWhereClause.between(
        lower: id,
        upper: id,
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterWhereClause> idNotEqualTo(
      Id id) {
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

  QueryBuilder<CategoryRule, CategoryRule, QAfterWhereClause> idGreaterThan(
      Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: id, includeLower: include),
      );
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterWhereClause> idLessThan(Id id,
      {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: id, includeUpper: include),
      );
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterWhereClause> idBetween(
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

  QueryBuilder<CategoryRule, CategoryRule, QAfterWhereClause> identifierEqualTo(
      String identifier) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(IndexWhereClause.equalTo(
        indexName: r'identifier',
        value: [identifier],
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterWhereClause>
      identifierNotEqualTo(String identifier) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'identifier',
              lower: [],
              upper: [identifier],
              includeUpper: false,
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'identifier',
              lower: [identifier],
              includeLower: false,
              upper: [],
            ));
      } else {
        return query
            .addWhereClause(IndexWhereClause.between(
              indexName: r'identifier',
              lower: [identifier],
              includeLower: false,
              upper: [],
            ))
            .addWhereClause(IndexWhereClause.between(
              indexName: r'identifier',
              lower: [],
              upper: [identifier],
              includeUpper: false,
            ));
      }
    });
  }
}

extension CategoryRuleQueryFilter
    on QueryBuilder<CategoryRule, CategoryRule, QFilterCondition> {
  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      categoryNameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      categoryNameGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      categoryNameLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      categoryNameBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'categoryName',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      categoryNameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      categoryNameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      categoryNameContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'categoryName',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      categoryNameMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'categoryName',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      categoryNameIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'categoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      categoryNameIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'categoryName',
        value: '',
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition> idEqualTo(
      Id value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'id',
        value: value,
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition> idBetween(
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

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      identifierEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'identifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      identifierGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        include: include,
        property: r'identifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      identifierLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.lessThan(
        include: include,
        property: r'identifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      identifierBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.between(
        property: r'identifier',
        lower: lower,
        includeLower: includeLower,
        upper: upper,
        includeUpper: includeUpper,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      identifierStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.startsWith(
        property: r'identifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      identifierEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.endsWith(
        property: r'identifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      identifierContains(String value, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.contains(
        property: r'identifier',
        value: value,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      identifierMatches(String pattern, {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.matches(
        property: r'identifier',
        wildcard: pattern,
        caseSensitive: caseSensitive,
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      identifierIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'identifier',
        value: '',
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      identifierIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.greaterThan(
        property: r'identifier',
        value: '',
      ));
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterFilterCondition>
      isIncomeEqualTo(bool value) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(FilterCondition.equalTo(
        property: r'isIncome',
        value: value,
      ));
    });
  }
}

extension CategoryRuleQueryObject
    on QueryBuilder<CategoryRule, CategoryRule, QFilterCondition> {}

extension CategoryRuleQueryLinks
    on QueryBuilder<CategoryRule, CategoryRule, QFilterCondition> {}

extension CategoryRuleQuerySortBy
    on QueryBuilder<CategoryRule, CategoryRule, QSortBy> {
  QueryBuilder<CategoryRule, CategoryRule, QAfterSortBy> sortByCategoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryName', Sort.asc);
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterSortBy>
      sortByCategoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryName', Sort.desc);
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterSortBy> sortByIdentifier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identifier', Sort.asc);
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterSortBy>
      sortByIdentifierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identifier', Sort.desc);
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterSortBy> sortByIsIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIncome', Sort.asc);
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterSortBy> sortByIsIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIncome', Sort.desc);
    });
  }
}

extension CategoryRuleQuerySortThenBy
    on QueryBuilder<CategoryRule, CategoryRule, QSortThenBy> {
  QueryBuilder<CategoryRule, CategoryRule, QAfterSortBy> thenByCategoryName() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryName', Sort.asc);
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterSortBy>
      thenByCategoryNameDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'categoryName', Sort.desc);
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterSortBy> thenById() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.asc);
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterSortBy> thenByIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'id', Sort.desc);
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterSortBy> thenByIdentifier() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identifier', Sort.asc);
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterSortBy>
      thenByIdentifierDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'identifier', Sort.desc);
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterSortBy> thenByIsIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIncome', Sort.asc);
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QAfterSortBy> thenByIsIncomeDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isIncome', Sort.desc);
    });
  }
}

extension CategoryRuleQueryWhereDistinct
    on QueryBuilder<CategoryRule, CategoryRule, QDistinct> {
  QueryBuilder<CategoryRule, CategoryRule, QDistinct> distinctByCategoryName(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'categoryName', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QDistinct> distinctByIdentifier(
      {bool caseSensitive = true}) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'identifier', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<CategoryRule, CategoryRule, QDistinct> distinctByIsIncome() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'isIncome');
    });
  }
}

extension CategoryRuleQueryProperty
    on QueryBuilder<CategoryRule, CategoryRule, QQueryProperty> {
  QueryBuilder<CategoryRule, int, QQueryOperations> idProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'id');
    });
  }

  QueryBuilder<CategoryRule, String, QQueryOperations> categoryNameProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'categoryName');
    });
  }

  QueryBuilder<CategoryRule, String, QQueryOperations> identifierProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'identifier');
    });
  }

  QueryBuilder<CategoryRule, bool, QQueryOperations> isIncomeProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isIncome');
    });
  }
}
