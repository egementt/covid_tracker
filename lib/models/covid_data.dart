class CovidData {
  String activeCasesText;
  String countryText;
  String lastUpdate;
  String newCasesText;
  String newDeathsText;
  String totalCasesText;
  String totalDeathsText;
  String totalRecoveredText;

  CovidData({
    this.activeCasesText,
    this.countryText,
    this.lastUpdate,
    this.newCasesText,
    this.newDeathsText,
    this.totalCasesText,
    this.totalDeathsText,
    this.totalRecoveredText,
  });

  factory CovidData.fromJson(Map<String, dynamic> json) {
    return CovidData(
      activeCasesText: json['Active Cases_text'],
      countryText: json['Country_text'],
      lastUpdate: json['Last Update'],
      newCasesText: json['New Cases_text'],
      newDeathsText: json['New Deaths_text'],
      totalCasesText: json['Total Cases_text'],
      totalDeathsText: json['Total Deaths_text'],
      totalRecoveredText: json['Total Recovered_text'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Active Cases_text'] = activeCasesText;
    data['Country_text'] = countryText;
    data['Last Update'] = lastUpdate;
    data['New Cases_text'] = newCasesText;
    data['New Deaths_text'] = newDeathsText;
    data['Total Cases_text'] = totalCasesText;
    data['Total Deaths_text'] = totalDeathsText;
    data['Total Recovered_text'] = totalRecoveredText;
    return data;
  }
}
