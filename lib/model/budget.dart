class Budget {
  String name, date,type;
  String amount;

  Budget({
    required this.name,
    required this.amount,
    required this.type,
    required this.date,
  });

  String get getName {
  return name;
  }

  String get getAmount {
  return amount;
  }

  String get getDate {
  return date;
  }

  String get getType {
  return type;
  }
}


class DaftarBudget{
  static List<Budget> daftarBudget = [];
  void addBudget(Budget budget){
    daftarBudget.add(budget);
  }

  List<Budget> get getDaftarBudget {
  return daftarBudget;
  }

  }
