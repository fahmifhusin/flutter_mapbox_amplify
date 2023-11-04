part of shared_components;

class ParamConstant {
  static final ParamConstant _paramConstant = ParamConstant._internal();

  ParamConstant._internal();

  factory ParamConstant() {
    return _paramConstant;
  }

  final String accessToken = 'access_token';
  final String kelas = 'class';
  final String email = 'email';
  final String emailOrPhone = 'emailOrPhone';
  final String formPrice = 'formPrice';
  final String id = 'id';
  final String userId = 'userId';
  final String formulirId = 'formId';
  final String statusCode = 'statusCode';
  final String status = 'status';
  final String message = 'message';
  final String location = 'location';
  final String name = 'name';
  final String fullName = 'fullName';
  final String oldPassword = 'oldPassword';
  final String newPassword = 'newPassword';
  final String password = 'password';
  final String phoneNumber = 'phone';
  final String schoolYear = 'schoolYear';
  final String schoolName = 'schoolName';
  final String studentBirthDate = 'studentBirthDate';
  final String dateOfBirth = 'dateOfBirth';
  final String studentName = 'studentName';
  final String token = 'token';
  final String filePath = 'filePath';
  final String file = 'file';
  final String formPaymentStatus = 'formPaymentStatus';
  final String registrationStatus = 'registrationStatus';
  final String psbStudent = 'psbStudent';
  final String psbParent = 'psbParent';
  final String dummyStudentName = "Example Data";
  final String dummyFatherName = "Example Data";
  final String dummyMotherName = 'dummyMotherName';
  final String dummyGuardianName = 'dummyGuardianName';
  final String studentId = 'studentId';
  final String noFormulir = 'noFormulir';
  final String idStudent = 'idStudent';
  final String parentId = 'parentId';
  final String formField = 'formField';
  final String idAchievement = 'idAchievement';
  final String idPrevSchool = 'idPrevSchool';
  final String idSibling = 'idSibling';
  final String seqNumber = 'seq';
  final String fileName = 'fileName';
  final String isCompleted = "isCompleted";
  final String value = 'value';
  final String fcmToken = 'fcmToken';
  final String isInternalFormPmb = 'isInternalFormPmb';
  ///utils
  final String item = 'utils_item';
  final String assetUtils = 'utils_asset';
  final String titleUtils = 'utils_title';
  final String isActiveUtils = 'utils_is_active';
  final String customUrlUtils = 'utils_custom_url';

  ///expandable
  final String index = 'index';
  final String isExpand = 'isExpand';

  ///ktp
 final String namaKtp = 'nama';
 final String tempatLahirKtp = 'tempat_lahir';
 final String tanggalLahirKtp = 'tanggal_lahir';
 final String genderKtp = 'gender';
 final String addressKtp = 'address';
 final String houseNumberKtp = 'number_house';
 final String kelurahanKtp = 'kelurahan';
 final String kecamatanKtp = 'kecamatan';
 final String kotaKtp = 'kota';
 final String agamaKtp = 'agama';
 final String kewarganegaraanKtp = 'kewarganegaraan';
 final String provinsiKtp = 'provinsi';


}