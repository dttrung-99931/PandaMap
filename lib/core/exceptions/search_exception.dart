// ignore_for_file: public_member_api_docs, sort_constructors_first
class PandaMapException {
  final String message;
  PandaMapException({
    required this.message,
  });
}

class SearchException extends PandaMapException {
  SearchException({required super.message});
}
