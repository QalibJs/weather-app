
class Endpoints {
  Endpoints._();

  static String weatherUrl(String city) => "https://api.openweathermap.org/data/2.5/weather?q=$city&appid=c614b757f9ea2648f6995a75d1e4dba1";

}