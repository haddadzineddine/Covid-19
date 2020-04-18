class CoronaVirus {
  String title;
  String code;
  int total_cases;
  int total_recovered;
  int total_unresolved;
  int total_deaths;
  int total_new_cases_today;
  int total_new_deaths_today;
  int total_active_cases;
  int total_serious_cases;

  CoronaVirus(
      String code,
      String title,
      int total_cases,
      int total_recovered,
      int total_unresolved,
      int total_deaths,
      int total_new_cases_today,
      int total_new_deaths_today,
      int total_active_cases,
      int total_serious_cases) {
    this.code = code;
    this.title = title;
    this.total_cases = total_cases;
    this.total_recovered = total_recovered;
    this.total_unresolved = total_unresolved;
    this.total_deaths = total_deaths;
    this.total_new_cases_today = total_new_cases_today;
    this.total_new_deaths_today = total_new_deaths_today;
    this.total_active_cases = total_active_cases;
    this.total_serious_cases = total_serious_cases;
  }
}
