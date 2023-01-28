// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_variable

extension GetEventCollection on Isar {
  IsarCollection<Event> get events => getCollection();
}

const EventSchema = CollectionSchema(
  name: 'Event',
  schema:
      '{"name":"Event","idName":"id","properties":[{"name":"content","type":"String"},{"name":"dateTime","type":"Long"},{"name":"emoji","type":"String"},{"name":"hashCode","type":"Long"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'content': 0, 'dateTime': 1, 'emoji': 2, 'hashCode': 3},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _eventGetId,
  setId: _eventSetId,
  getLinks: _eventGetLinks,
  attachLinks: _eventAttachLinks,
  serializeNative: _eventSerializeNative,
  deserializeNative: _eventDeserializeNative,
  deserializePropNative: _eventDeserializePropNative,
  serializeWeb: _eventSerializeWeb,
  deserializeWeb: _eventDeserializeWeb,
  deserializePropWeb: _eventDeserializePropWeb,
  version: 3,
);

int? _eventGetId(Event object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _eventSetId(Event object, int id) {
  object.id = id;
}

List<IsarLinkBase> _eventGetLinks(Event object) {
  return [];
}

void _eventSerializeNative(
    IsarCollection<Event> collection,
    IsarRawObject rawObj,
    Event object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  var dynamicSize = 0;
  final value0 = object.content;
  final _content = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_content.length) as int;
  final value1 = object.dateTime;
  final _dateTime = value1;
  final value2 = object.emoji;
  final _emoji = IsarBinaryWriter.utf8Encoder.convert(value2);
  dynamicSize += (_emoji.length) as int;
  final value3 = object.hashCode;
  final _hashCode = value3;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _content);
  writer.writeDateTime(offsets[1], _dateTime);
  writer.writeBytes(offsets[2], _emoji);
  writer.writeLong(offsets[3], _hashCode);
}

Event _eventDeserializeNative(IsarCollection<Event> collection, int id,
    IsarBinaryReader reader, List<int> offsets) {
  final object = Event(
    content: reader.readString(offsets[0]),
    dateTime: reader.readDateTime(offsets[1]),
    emoji: reader.readString(offsets[2]),
  );
  object.id = id;
  return object;
}

P _eventDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readDateTime(offset)) as P;
    case 2:
      return (reader.readString(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _eventSerializeWeb(IsarCollection<Event> collection, Event object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'content', object.content);
  IsarNative.jsObjectSet(
      jsObj, 'dateTime', object.dateTime.toUtc().millisecondsSinceEpoch);
  IsarNative.jsObjectSet(jsObj, 'emoji', object.emoji);
  IsarNative.jsObjectSet(jsObj, 'hashCode', object.hashCode);
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  return jsObj;
}

Event _eventDeserializeWeb(IsarCollection<Event> collection, dynamic jsObj) {
  final object = Event(
    content: IsarNative.jsObjectGet(jsObj, 'content') ?? '',
    dateTime: IsarNative.jsObjectGet(jsObj, 'dateTime') != null
        ? DateTime.fromMillisecondsSinceEpoch(
                IsarNative.jsObjectGet(jsObj, 'dateTime'),
                isUtc: true)
            .toLocal()
        : DateTime.fromMillisecondsSinceEpoch(0),
    emoji: IsarNative.jsObjectGet(jsObj, 'emoji') ?? '',
  );
  object.id = IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity;
  return object;
}

P _eventDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'content':
      return (IsarNative.jsObjectGet(jsObj, 'content') ?? '') as P;
    case 'dateTime':
      return (IsarNative.jsObjectGet(jsObj, 'dateTime') != null
          ? DateTime.fromMillisecondsSinceEpoch(
                  IsarNative.jsObjectGet(jsObj, 'dateTime'),
                  isUtc: true)
              .toLocal()
          : DateTime.fromMillisecondsSinceEpoch(0)) as P;
    case 'emoji':
      return (IsarNative.jsObjectGet(jsObj, 'emoji') ?? '') as P;
    case 'hashCode':
      return (IsarNative.jsObjectGet(jsObj, 'hashCode') ??
          double.negativeInfinity) as P;
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id') ?? double.negativeInfinity)
          as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _eventAttachLinks(IsarCollection col, int id, Event object) {}

extension EventQueryWhereSort on QueryBuilder<Event, Event, QWhere> {
  QueryBuilder<Event, Event, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension EventQueryWhere on QueryBuilder<Event, Event, QWhereClause> {
  QueryBuilder<Event, Event, QAfterWhereClause> idEqualTo(int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<Event, Event, QAfterWhereClause> idNotEqualTo(int id) {
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

  QueryBuilder<Event, Event, QAfterWhereClause> idGreaterThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<Event, Event, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<Event, Event, QAfterWhereClause> idBetween(
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

extension EventQueryFilter on QueryBuilder<Event, Event, QFilterCondition> {
  QueryBuilder<Event, Event, QAfterFilterCondition> contentEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> contentGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> contentLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> contentBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'content',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> contentStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> contentEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> contentContains(
      String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'content',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> contentMatches(
      String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'content',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> dateTimeEqualTo(
      DateTime value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'dateTime',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> dateTimeGreaterThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'dateTime',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> dateTimeLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'dateTime',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> dateTimeBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'dateTime',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> emojiEqualTo(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> emojiGreaterThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> emojiLessThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> emojiBetween(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> emojiStartsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> emojiEndsWith(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> emojiContains(String value,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'emoji',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> emojiMatches(String pattern,
      {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'emoji',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> hashCodeEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'hashCode',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> hashCodeGreaterThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> hashCodeLessThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> hashCodeBetween(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> idEqualTo(int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<Event, Event, QAfterFilterCondition> idGreaterThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> idLessThan(
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

  QueryBuilder<Event, Event, QAfterFilterCondition> idBetween(
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
}

extension EventQueryLinks on QueryBuilder<Event, Event, QFilterCondition> {}

extension EventQueryWhereSortBy on QueryBuilder<Event, Event, QSortBy> {
  QueryBuilder<Event, Event, QAfterSortBy> sortByContent() {
    return addSortByInternal('content', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByContentDesc() {
    return addSortByInternal('content', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByDateTime() {
    return addSortByInternal('dateTime', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByDateTimeDesc() {
    return addSortByInternal('dateTime', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByEmoji() {
    return addSortByInternal('emoji', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByEmojiDesc() {
    return addSortByInternal('emoji', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }
}

extension EventQueryWhereSortThenBy on QueryBuilder<Event, Event, QSortThenBy> {
  QueryBuilder<Event, Event, QAfterSortBy> thenByContent() {
    return addSortByInternal('content', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByContentDesc() {
    return addSortByInternal('content', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByDateTime() {
    return addSortByInternal('dateTime', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByDateTimeDesc() {
    return addSortByInternal('dateTime', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByEmoji() {
    return addSortByInternal('emoji', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByEmojiDesc() {
    return addSortByInternal('emoji', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByHashCode() {
    return addSortByInternal('hashCode', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByHashCodeDesc() {
    return addSortByInternal('hashCode', Sort.desc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<Event, Event, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }
}

extension EventQueryWhereDistinct on QueryBuilder<Event, Event, QDistinct> {
  QueryBuilder<Event, Event, QDistinct> distinctByContent(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('content', caseSensitive: caseSensitive);
  }

  QueryBuilder<Event, Event, QDistinct> distinctByDateTime() {
    return addDistinctByInternal('dateTime');
  }

  QueryBuilder<Event, Event, QDistinct> distinctByEmoji(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('emoji', caseSensitive: caseSensitive);
  }

  QueryBuilder<Event, Event, QDistinct> distinctByHashCode() {
    return addDistinctByInternal('hashCode');
  }

  QueryBuilder<Event, Event, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }
}

extension EventQueryProperty on QueryBuilder<Event, Event, QQueryProperty> {
  QueryBuilder<Event, String, QQueryOperations> contentProperty() {
    return addPropertyNameInternal('content');
  }

  QueryBuilder<Event, DateTime, QQueryOperations> dateTimeProperty() {
    return addPropertyNameInternal('dateTime');
  }

  QueryBuilder<Event, String, QQueryOperations> emojiProperty() {
    return addPropertyNameInternal('emoji');
  }

  QueryBuilder<Event, int, QQueryOperations> hashCodeProperty() {
    return addPropertyNameInternal('hashCode');
  }

  QueryBuilder<Event, int, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }
}
