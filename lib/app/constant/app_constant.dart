part of constants;

// Font Weight
const FontWeight fontwThin = FontWeight.w100;
const FontWeight fontwExtraLight = FontWeight.w200;
const FontWeight fontwLight = FontWeight.w300;
const FontWeight fontwRegular = FontWeight.w400;
const FontWeight fontwMedium = FontWeight.w500;
const FontWeight fontwSemiBold = FontWeight.w600;
const FontWeight fontwBold = FontWeight.w700;
const FontWeight fontwExtraBold = FontWeight.w800;
const FontWeight fontwUltraBold = FontWeight.w900;

///global keys
late String kBaseUrl;
late String kAppEnvironment;
late String kAppPlatform;
late String kWhatsAppNumberAdmin;

///global service setup
final baseAppUrl = dotenv.env['BASE_URL'];
final websiteUrl = dotenv.env['WEB_URL'];
DioSetup dioService = DioSetup();

///global constant
AssetsConstant assetsConstant = AssetsConstant();
ColorConstant colorConstant = ColorConstant();
DimensionConstant dimensionConstant = DimensionConstant();
EnvironmentPath environmentPath = EnvironmentPath();
FunctionSharing functionSharing = FunctionSharing();
GeneralButtons generalButtons = GeneralButtons();
GeneralDialog generalDialog = GeneralDialog();
GeneralKeyAndSharedPrefs generalKeys = GeneralKeyAndSharedPrefs();
ParamConstant argument = ParamConstant();
StyleConstant styleConstant = StyleConstant();
StringConstant stringConstant = StringConstant();

///global logger
var logger = Logger(
  filter: null, // Use the default LogFilter (-> only log in debug mode)
  printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
  output: null, // Use the default LogOutput (-> send everything to console)
);

