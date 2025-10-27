abstract class ParamBaseUseCase<Output> {
  Future<Output> call({required Map<String, dynamic> data});
}
