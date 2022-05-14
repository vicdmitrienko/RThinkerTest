#include <Rcpp.h>
#include <ctime>
using namespace Rcpp;

// Learn more about how to use Rcpp at:
//
//   http://www.rcpp.org/
//   http://adv-r.had.co.nz/Rcpp.html
//
// and browse examples of code using Rcpp at:
// 
//   http://gallery.rcpp.org/
//

// [[Rcpp::export]]
List rcpp_think(int seconds) {
  // Emulate long calculations
  // - fix start moment
  time_t start_moment = time(nullptr);
  int diff_sec = 0;
  do {
    // - get current moment
    time_t now = time(nullptr);
    // - calculate duration in sec
    diff_sec = (int) difftime(now, start_moment);
  } while (diff_sec < seconds);

  // Some code..
  CharacterVector x = CharacterVector::create("foo", "bar");
  NumericVector y   = NumericVector::create(0.0, 1.0);
  List z            = List::create(x, y);
  return z;
}
