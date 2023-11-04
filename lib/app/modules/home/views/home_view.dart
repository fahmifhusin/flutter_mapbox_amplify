part of home_lib;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(F.title == stringConstant.development
            ? '${stringConstant.appName} ${stringConstant.development}'
            : stringConstant.appName),
        // backgroundColor:
        //     F.title == stringConstant.development ? Colors.amber : Colors.green,
        backgroundColor: colorConstant.splashYellow,
        centerTitle: false,
      ),
      body: Obx(
        () => Center(
          child: Text(
            controller.currentPosition,
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
    );
  }
}
