part of home_lib;

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Map Box'),
        backgroundColor:
            F.title == stringConstant.development ? Colors.amber : Colors.green,
        centerTitle: true,
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
