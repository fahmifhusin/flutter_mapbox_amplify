/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, annotate_overrides, dead_code, dead_codepublic_member_api_docs, depend_on_referenced_packages, file_names, library_private_types_in_public_api, no_leading_underscores_for_library_prefixes, no_leading_underscores_for_local_identifiers, non_constant_identifier_names, null_check_on_nullable_type_parameter, prefer_adjacent_string_concatenation, prefer_const_constructors, prefer_if_null_operators, prefer_interpolation_to_compose_strings, slash_for_doc_comments, sort_child_properties_last, unnecessary_const, unnecessary_constructor_name, unnecessary_late, unnecessary_new, unnecessary_null_aware_assignments, unnecessary_nullable_for_final_variable_declarations, unnecessary_string_interpolations, use_build_context_synchronously

import 'ModelProvider.dart';
import 'package:amplify_core/amplify_core.dart' as amplify_core;


/** This is an auto generated class representing the LOCATIONDATA type in your schema. */
class LOCATIONDATA extends amplify_core.Model {
  static const classType = const _LOCATIONDATAModelType();
  final String id;
  final String? _userId;
  final String? _locationFrom;
  final String? _locationTo;
  final String? _distance;
  final String? _coordinates;
  final amplify_core.TemporalDateTime? _createdAt;
  final amplify_core.TemporalDateTime? _updatedAt;

  @override
  getInstanceType() => classType;
  
  @Deprecated('[getId] is being deprecated in favor of custom primary key feature. Use getter [modelIdentifier] to get model identifier.')
  @override
  String getId() => id;
  
  LOCATIONDATAModelIdentifier get modelIdentifier {
      return LOCATIONDATAModelIdentifier(
        id: id
      );
  }
  
  String get userId {
    try {
      return _userId!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String get locationFrom {
    try {
      return _locationFrom!;
    } catch(e) {
      throw amplify_core.AmplifyCodeGenModelException(
          amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastExceptionMessage,
          recoverySuggestion:
            amplify_core.AmplifyExceptionMessages.codeGenRequiredFieldForceCastRecoverySuggestion,
          underlyingException: e.toString()
          );
    }
  }
  
  String? get locationTo {
    return _locationTo;
  }
  
  String? get distance {
    return _distance;
  }
  
  String? get coordinates {
    return _coordinates;
  }
  
  amplify_core.TemporalDateTime? get createdAt {
    return _createdAt;
  }
  
  amplify_core.TemporalDateTime? get updatedAt {
    return _updatedAt;
  }
  
  const LOCATIONDATA._internal({required this.id, required userId, required locationFrom, locationTo, distance, coordinates, createdAt, updatedAt}): _userId = userId, _locationFrom = locationFrom, _locationTo = locationTo, _distance = distance, _coordinates = coordinates, _createdAt = createdAt, _updatedAt = updatedAt;
  
  factory LOCATIONDATA({String? id, required String userId, required String locationFrom, String? locationTo, String? distance, String? coordinates}) {
    return LOCATIONDATA._internal(
      id: id == null ? amplify_core.UUID.getUUID() : id,
      userId: userId,
      locationFrom: locationFrom,
      locationTo: locationTo,
      distance: distance,
      coordinates: coordinates);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LOCATIONDATA &&
      id == other.id &&
      _userId == other._userId &&
      _locationFrom == other._locationFrom &&
      _locationTo == other._locationTo &&
      _distance == other._distance &&
      _coordinates == other._coordinates;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("LOCATIONDATA {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("userId=" + "$_userId" + ", ");
    buffer.write("locationFrom=" + "$_locationFrom" + ", ");
    buffer.write("locationTo=" + "$_locationTo" + ", ");
    buffer.write("distance=" + "$_distance" + ", ");
    buffer.write("coordinates=" + "$_coordinates" + ", ");
    buffer.write("createdAt=" + (_createdAt != null ? _createdAt!.format() : "null") + ", ");
    buffer.write("updatedAt=" + (_updatedAt != null ? _updatedAt!.format() : "null"));
    buffer.write("}");
    
    return buffer.toString();
  }
  
  LOCATIONDATA copyWith({String? userId, String? locationFrom, String? locationTo, String? distance, String? coordinates}) {
    return LOCATIONDATA._internal(
      id: id,
      userId: userId ?? this.userId,
      locationFrom: locationFrom ?? this.locationFrom,
      locationTo: locationTo ?? this.locationTo,
      distance: distance ?? this.distance,
      coordinates: coordinates ?? this.coordinates);
  }
  
  LOCATIONDATA copyWithModelFieldValues({
    ModelFieldValue<String>? userId,
    ModelFieldValue<String>? locationFrom,
    ModelFieldValue<String?>? locationTo,
    ModelFieldValue<String?>? distance,
    ModelFieldValue<String?>? coordinates
  }) {
    return LOCATIONDATA._internal(
      id: id,
      userId: userId == null ? this.userId : userId.value,
      locationFrom: locationFrom == null ? this.locationFrom : locationFrom.value,
      locationTo: locationTo == null ? this.locationTo : locationTo.value,
      distance: distance == null ? this.distance : distance.value,
      coordinates: coordinates == null ? this.coordinates : coordinates.value
    );
  }
  
  LOCATIONDATA.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _userId = json['userId'],
      _locationFrom = json['locationFrom'],
      _locationTo = json['locationTo'],
      _distance = json['distance'],
      _coordinates = json['coordinates'],
      _createdAt = json['createdAt'] != null ? amplify_core.TemporalDateTime.fromString(json['createdAt']) : null,
      _updatedAt = json['updatedAt'] != null ? amplify_core.TemporalDateTime.fromString(json['updatedAt']) : null;
  
  Map<String, dynamic> toJson() => {
    'id': id, 'userId': _userId, 'locationFrom': _locationFrom, 'locationTo': _locationTo, 'distance': _distance, 'coordinates': _coordinates, 'createdAt': _createdAt?.format(), 'updatedAt': _updatedAt?.format()
  };
  
  Map<String, Object?> toMap() => {
    'id': id,
    'userId': _userId,
    'locationFrom': _locationFrom,
    'locationTo': _locationTo,
    'distance': _distance,
    'coordinates': _coordinates,
    'createdAt': _createdAt,
    'updatedAt': _updatedAt
  };

  static final amplify_core.QueryModelIdentifier<LOCATIONDATAModelIdentifier> MODEL_IDENTIFIER = amplify_core.QueryModelIdentifier<LOCATIONDATAModelIdentifier>();
  static final ID = amplify_core.QueryField(fieldName: "id");
  static final USERID = amplify_core.QueryField(fieldName: "userId");
  static final LOCATIONFROM = amplify_core.QueryField(fieldName: "locationFrom");
  static final LOCATIONTO = amplify_core.QueryField(fieldName: "locationTo");
  static final DISTANCE = amplify_core.QueryField(fieldName: "distance");
  static final COORDINATES = amplify_core.QueryField(fieldName: "coordinates");
  static var schema = amplify_core.Model.defineSchema(define: (amplify_core.ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "LOCATIONDATA";
    modelSchemaDefinition.pluralName = "LOCATIONDATA";
    
    modelSchemaDefinition.authRules = [
      amplify_core.AuthRule(
        authStrategy: amplify_core.AuthStrategy.PUBLIC,
        operations: const [
          amplify_core.ModelOperation.CREATE,
          amplify_core.ModelOperation.UPDATE,
          amplify_core.ModelOperation.DELETE,
          amplify_core.ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LOCATIONDATA.USERID,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LOCATIONDATA.LOCATIONFROM,
      isRequired: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LOCATIONDATA.LOCATIONTO,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LOCATIONDATA.DISTANCE,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.field(
      key: LOCATIONDATA.COORDINATES,
      isRequired: false,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'createdAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
    
    modelSchemaDefinition.addField(amplify_core.ModelFieldDefinition.nonQueryField(
      fieldName: 'updatedAt',
      isRequired: false,
      isReadOnly: true,
      ofType: amplify_core.ModelFieldType(amplify_core.ModelFieldTypeEnum.dateTime)
    ));
  });
}

class _LOCATIONDATAModelType extends amplify_core.ModelType<LOCATIONDATA> {
  const _LOCATIONDATAModelType();
  
  @override
  LOCATIONDATA fromJson(Map<String, dynamic> jsonData) {
    return LOCATIONDATA.fromJson(jsonData);
  }
  
  @override
  String modelName() {
    return 'LOCATIONDATA';
  }
}

/**
 * This is an auto generated class representing the model identifier
 * of [LOCATIONDATA] in your schema.
 */
class LOCATIONDATAModelIdentifier implements amplify_core.ModelIdentifier<LOCATIONDATA> {
  final String id;

  /** Create an instance of LOCATIONDATAModelIdentifier using [id] the primary key. */
  const LOCATIONDATAModelIdentifier({
    required this.id});
  
  @override
  Map<String, dynamic> serializeAsMap() => (<String, dynamic>{
    'id': id
  });
  
  @override
  List<Map<String, dynamic>> serializeAsList() => serializeAsMap()
    .entries
    .map((entry) => (<String, dynamic>{ entry.key: entry.value }))
    .toList();
  
  @override
  String serializeAsString() => serializeAsMap().values.join('#');
  
  @override
  String toString() => 'LOCATIONDATAModelIdentifier(id: $id)';
  
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    
    return other is LOCATIONDATAModelIdentifier &&
      id == other.id;
  }
  
  @override
  int get hashCode =>
    id.hashCode;
}