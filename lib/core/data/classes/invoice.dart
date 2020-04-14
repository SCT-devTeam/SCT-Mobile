class Invoice {
  final int id;
  final int customer_id;
  final String qualification;
  final String edition_date;
  final String payment_date;
  final int payment_delay_in_days;
  final String payment_terms;
  final String notice;
  final String payment_method;
  final String sending_date;
  final String revived_date;
  final String last_qualification_date;
  final String chashing_date;
  final String note;
  final int original_quote;

  Invoice.fromJSON(Map<String, dynamic> jsonMap)
      : id = jsonMap['id'],
        customer_id = jsonMap['customer_id'],
        qualification = jsonMap['qualification'],
        edition_date = jsonMap['edition_date'],
        payment_date = jsonMap['payment_date'],
        payment_delay_in_days = jsonMap['payment_delay_in_days'],
        payment_terms = jsonMap['payment_terms'],
        notice = jsonMap['notice'],
        payment_method = jsonMap['payment_method'],
        sending_date = jsonMap['sending_date'],
        revived_date = jsonMap['revived_date'],
        last_qualification_date = jsonMap['last_qualification_date'],
        chashing_date = jsonMap['chashing_date'],
        note = jsonMap['note'],
        original_quote = jsonMap['original_quote'];
}
