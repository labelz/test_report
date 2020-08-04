class SummaryTierModel {
  final totalMembers;
  final totalAmount;
  final tierName;

  SummaryTierModel.fromJson(Map<String, dynamic> json)
      : totalMembers = json['total_members'] ?? 0,
        totalAmount = json['total_amount'] ?? 0,
        tierName = json['tier_name'] ?? '';
}

class SummaryModel {
  final totaltransaction;
  final totalpoint;
  final remainingpoint;
  final lifetimevalue;
  SummaryModel.fromJson(Map<String, dynamic> json)
      : totaltransaction = json['totaltransaction'] ?? 0,
        totalpoint = json['totalpoint'] ?? 0,
        remainingpoint = json['remainingpoint'] ?? 0,
        lifetimevalue = json['lifetimevalue'] ?? 0;
}

class ItemModel {
  final customername;
  final customertier;
  final customerphone;
  final totaltransaction;
  final totalamount;
  final totalreward;
  final remainingpoint;
  ItemModel.fromJson(Map<String, dynamic> json)
      : customername = json['customername'] ?? '',
        customertier = json['customertier'] ?? '',
        customerphone = json['customerphone'] ?? '',
        totaltransaction = json['totaltransaction'] ?? 0,
        totalamount = json['totalamount'] ?? 0,
        totalreward = json['totalreward'] ?? 0,
        remainingpoint = json['remainingpoint'] ?? 0;
}

class ResultModel {
  final List<ItemModel> items;
  final List<SummaryTierModel> summaryTier;
  final SummaryModel summary;
  final int total;

  ResultModel.fromJson(Map<String, dynamic> json)
      : items = json['list'].length > 0
            ? List.from(json['list'].map((model) {
                // print(model);
                return ItemModel.fromJson(model);
              }))
            : [],
        summaryTier = json['summarytier'].length > 0
            ? List.from(json['summarytier'].map((model) {
                // print(model);
                return SummaryTierModel.fromJson(model);
              }))
            : [],
        summary = SummaryModel.fromJson(json['summary']),
        total = json['total'];
}
