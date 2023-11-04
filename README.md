# Flutter Code Base

### This is an example of code structure I use when working on a project from scratch using Flutter. The structure may vary slightly depending on the state management and project scope.

### How to run the project:
#### Development Flavor:
flutter run --flavor development -t lib/main_development.dart

#### Production Flavor:
flutter run --flavor production -t lib/main_production.dart

#### In this project, there are several files and folders to pay attention to:

* Constants: A folder for configuring assets, colors, and other constant values.

* Constants - app_constant.dart:
  File containing basic application configurations at the time of project compilation.

* Constants - assets_constant.dart:
  File containing basic configurations for using assets in the application.

* Constants - color_constant.dart:
  File containing basic configurations for using colors in the application.

* Constants - dimension_constant.dart:
  File containing basic configurations for using dimensions (layout) in the application.

* Constants - string_constant.dart:
  File containing basic configurations for using text content in the application.

* Constants - style_constant.dart:
  File containing basic configurations for using styles in the application.

* Utils: A folder for project configurations.

* Utils - Shared Component: A folder for configurations used across the project, such as components, functions, and more.

* Shared Component - custom_field.dart:
  File containing configured fields that can be shared.

* Shared Component - function_sharing.dart:
  File containing logical functions used on different pages, such as field validation, token retrieval, and more.

* Shared Component - general_app_bar.dart:
  File containing app bar configurations that can be shared.

* Shared Component - general_buttons.dart:
  File containing button configurations that can be shared.

* Shared Component - general_dialog.dart:
  File containing dialog configurations that can be shared.

* Shared Component - general_key_and_shared_prefs.dart:
  File containing configurations for using variable keys and other keys, shareable across the project.

* Shared Component - param_constant.dart:
  File containing configurations for using parameters in API calls, shareable across the project.

* Shared Component - general_app_bar.dart:
  File containing app bar configurations that can be shared.
