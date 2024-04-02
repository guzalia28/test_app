enum Periods { day, week, month, year , all}

class Period {
  final String name;
  final Periods period;
  
  const Period({required this.name, required this.period});
}