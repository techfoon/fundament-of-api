import 'dart:convert';

class QuoteModel {
  int id;

  String quote;

  String author;

  QuoteModel({required this.id, required this.quote, required this.author});

  factory QuoteModel.fromJson(Map<String, dynamic> json) // Map(JSON)->Model
  {
    return QuoteModel(
        id: json['id'], quote: json['quote'], author: json['author']);
  }

  /* Factory void toMap()  Model-> Map(Json)
  {


  }*/
}

class DataModel {
  int total, skip, limit;

  List<QuoteModel> quotes;

  DataModel(
      {required this.total,
      required this.skip,
      required this.limit,
      required this.quotes});

  factory DataModel.fromJson(Map<String, dynamic> DataModelJson) {
    List<QuoteModel> mQuotes=[];

    for (Map<String, dynamic> eachQyote in DataModelJson['quotes']) {
      var eachQuoteModel = QuoteModel.fromJson(eachQyote);

      mQuotes.add(eachQuoteModel);
    }

    return DataModel(
        total: DataModelJson['total'],
        skip: DataModelJson['skip'],
        limit: DataModelJson['limit'],
        quotes: mQuotes);

    ///conversion
  }
}
