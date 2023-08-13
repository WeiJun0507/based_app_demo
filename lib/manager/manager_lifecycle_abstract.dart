abstract class ManagerLifecycleAbstract {
  void prepare() {}
  Future<void> init();
  Future<void> destroy();
}
