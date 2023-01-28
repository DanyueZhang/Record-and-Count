// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Counter.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetCounterCollection on Isar {
  IsarCollection<Counter> get counters => getCollection();
}

const CounterSchema = CollectionSchema(
  name: 'Counter',
  schema:
      '{"name":"Counter","idName":"id","properties":[{"name":"count","type":"Long"},{"name":"emoji","type":"String"},{"name":"hashCode","type":"Long"},{"name":"name","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'count': 0, 'emoji': 1, 'hashCode': 2, 'name': 3},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _counterGetId,
  setId: _counterSetId,
  getLinks: _counterGetLinks,
  attachLinks: _counterAttachLinks,
  serializeNative: _counterSerializeNative,
  deserializeNative: _counterDeserializeNative,
  deserializePropNative: _counterDeserializePropNative,
  serializeWeb: _counterSerializeWeb,
  deserializeWeb: _counterDeserializeWeb,
  deserializePropWeb: _counterDeserializePropWeb,
  version: 3,
);

int? _counterGetId(Counter object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _counterSetId(Counter object, int id) {
  object.id = id;
}

List<IsarLinkBase> _counterGetLinks(Counter object) {
  return [];
}

void _counterSerializeNative(
    IsarCollection<Counter> collection,
    IsarRawObject rawObj,
    Counter object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.count;
  final _count = value0;
  final value1 = object.emoji;
  final _emoji = IsarBinaryWriter.utf8Encoder.convert(value1);
  dynamicSize += (_emoji.length) as int;
  final value2 = object.hashCode;
  final _hashCode = value2;
  final value3 = object.name;
  final _name = IsarBinaryWriter.utf8Encoder.convert(value3);
  dynamicSize += (_name.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeLong(offsets[0], _count);
  writer.writeBytes(offsets[1], _emoji);
  writer.writeLong(offsets[2], _hashCode);
  writer.writeBytes(offsets[3], _name);
}

Counter _counterDeserializeNative(IsarCollection<Counter> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Counter(
    count: reader.readLong(offsets[0]),
    emoji: reader.readString(offsets[1]),
    name: reader.readString(offsets[3]),
  );
  object.id = id;
  return object;
}

P _counterDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readLong(offset)) as P;
    case 1:
      return (reader.readString(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _counterSerializeWeb(
    IsarCollection<Counter> collection, Counter object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'count', object.count);
  IsarNative.jsObjectSet(jsObj, 'emoji', object.emoji);
  IsarNative.jsObjectSet(jsObj, 'hashCode', object.hashCode);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'name', object.name);
  return jsObj;
}

Counter _counterDeserializeWeb(
    IsarCollection<Counter> collection, dynamic jsObj) {
  final object = Counter(
    count: IsarNative.jsObjectGet(jsObj, 'count') ?? double.negativeInfinity,
    emoji: IsarNative.jsObjectGet(jsObj, 'emoji') ?? '',
    name: IsarNative.jsObjectGet(jsObj, 'name') ?? '',
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  return object;
}

P _counterDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'count':
      return (IsarNative.jsObjectGet(jsObj, 'count') ?? double.negativeInfinity)
          as P;
    case 'emoji':
      return (IsarNative.jsObjectGet(jsObj, 'emoji') ?? '') as P;
    case 'hashCode':
      return (IsarNative.jsObjectGet(jsObj, 'hashCode') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    case 'name':
      return (IsarNative.jsObjectGet(jsObj, 'name') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _counterAttachLinks(IsarCollection col, int id, Counter object) {}

extension CounterQueryWhereSort on QueryBuilder<Counter, Counter, QWhere> {
  QueryBuilder<Counter, Counter, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension CounterQueryWhere on QueryBuilder<Counter, Counter, QWhereClause> {
  QueryBuilder<Counter, Counter, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterWhereClause> idNotEqualTo(int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<Counter, Counter, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Counter, Counter, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Counter, Counter, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension CounterQueryFilter
    on QueryBuilder<Counter, Counter, QFilterCondition> {
  QueryBuilder<Counter, Counter, QAfterFilterCondition> countEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'count',
      value: value,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> countGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'count',
      value: value,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> countLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'count',
      value: value,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> countBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'count',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> emojiEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'emoji',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> emojiGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'emoji',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> emojiLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'emoji',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> emojiBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'emoji',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> emojiStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'emoji',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> emojiEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'emoji',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> emojiContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'emoji',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> emojiMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'emoji',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> hashCodeEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> hashCodeGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> hashCodeLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> hashCodeBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'hashCode',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> nameEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> nameGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> nameLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> nameBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'name',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> nameStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> nameEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> nameContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'name',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Counter, Counter, QAfterFilterCondition> nameMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'name',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension CounterQueryLinks
    on QueryBuilder<Counter, Counter, QFilterCondition> {}

extension CounterQueryWhereSortBy on QueryBuilder<Counter, Counter, QSortBy> {
  QueryBuilder<Counter, Counter, QAfterSortBy> sortByCount() {
    return addSortByInternal('count', Sort.asc);
  }

  QueryBuilder<Counter, Counter, QAfterSortBy> sortByCountDesc() {
    return addSortByInternal('count', Sort.desc);
  }

  QueryBuilder<Counter, Counter, QAfterSortBy> sortByEmoji() {
    return addSortByInternal('emoji', Sort.asc);
  }

  QueryBuilder<Counter, Counter, QAfterSortBy> sortByEmojiDesc() {
    return addSortByInternal('emoji', Sort.desc);
  }

  QueryBuilder<Counter, Counter, QAfterSortBy> sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<Counter, Counter, QAfterSortBy> sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<Counter, Counter, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Counter, Counter, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Counter, Counter, QAfterSortBy> sortByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Counter, Counter, QAfterSortBy> sortByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension CounterQueryWhereSortThenBy
    on QueryBuilder<Counter, Counter, QSortThenBy> {
  QueryBuilder<Counter, Counter, QAfterSortBy> thenByCount() {
    return addSortByInternal('count', Sort.asc);
  }

  QueryBuilder<Counter, Counter, QAfterSortBy> thenByCountDesc() {
    return addSortByInternal('count', Sort.desc);
  }

  QueryBuilder<Counter, Counter, QAfterSortBy> thenByEmoji() {
    return addSortByInternal('emoji', Sort.asc);
  }

  QueryBuilder<Counter, Counter, QAfterSortBy> thenByEmojiDesc() {
    return addSortByInternal('emoji', Sort.desc);
  }

  QueryBuilder<Counter, Counter, QAfterSortBy> thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<Counter, Counter, QAfterSortBy> thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<Counter, Counter, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Counter, Counter, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<Counter, Counter, QAfterSortBy> thenByName() {
    return addSortByInternal('name', Sort.asc);
  }

  QueryBuilder<Counter, Counter, QAfterSortBy> thenByNameDesc() {
    return addSortByInternal('name', Sort.desc);
  }
}

extension CounterQueryWhereDistinct
    on QueryBuilder<Counter, Counter, QDistinct> {
  QueryBuilder<Counter, Counter, QDistinct> distinctByCount() {
    return addDistinctByInternal('count');
  }

  QueryBuilder<Counter, Counter, QDistinct> distinctByEmoji(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('emoji', caseSensitive: caseSensitive);
  }

  QueryBuilder<Counter, Counter, QDistinct> distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<Counter, Counter, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<Counter, Counter, QDistinct> distinctByName(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('name', caseSensitive: caseSensitive);
  }
}

extension CounterQueryProperty
    on QueryBuilder<Counter, Counter, QQueryProperty> {
  QueryBuilder<Counter, int, QQueryOperations> countProperty() {
    return addPropertyNameInternal('count');
  }

  QueryBuilder<Counter, String, QQueryOperations> emojiProperty() {
    return addPropertyNameInternal('emoji');
  }

  QueryBuilder<Counter, int, QQueryOperations> hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<Counter, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<Counter, String, QQueryOperations> nameProperty() {
    return addPropertyNameInternal('name');
  }
}
