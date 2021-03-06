#' Data from the Card and Krueger 1994 paper *Minimum Wages and Employment: A Case Study of the Fast-Food Industry in New Jersey and Pennsylvania*
#'
#' This dataset was downloaded and distributed with the permission of David Card. The original
#' data contains 410 observations and 46 variables. The data distributed in this package is
#' exactly the same, but was changed from a wide to a long dataset, which is better suited for
#' manipulation with *tidyverse* functions.
#'
#' @format A data frame with 820 rows and 28 variables:
#' \describe{
#'   \item{\code{sheet}}{Sheet number (unique store id).}
#'   \item{\code{chain}}{The fastfood chain: bk is Burger King, kfc is Kentucky Fried Chicken, wendys is Wendy's, roys is Roy Rogers.}
#'   \item{\code{state}}{State where the restaurant is located.}
#'   \item{\code{region}}{pa1 is northeast suburbs of Phila, pa2 is Easton etc, centralj is central NJ, northj is northern NJ, southj is south NJ.}
#'   \item{\code{observation}}{Date of first (February 1992) and second (November 1992) observation.}
#'   \item{\code{co_owned}}{"Yes" if company owned.}
#'   \item{\code{ncalls}}{Number of call-backs. Is 0 if contacted on first call.}
#'   \item{\code{empft}}{Number full-time employees.}
#'   \item{\code{emppt}}{Number part-time employees.}
#'   \item{\code{nmgrs}}{Number of managers/assistant managers.}
#'   \item{\code{wage_st}}{Starting wage ($/hr).}
#'   \item{\code{inctime}}{Months to usual first raise.}
#'   \item{\code{firstinc}}{Usual amount of first raise (\$/hr).}
#'   \item{\code{bonus}}{"Yes" if cash bounty for new workers.}
#'   \item{\code{pctaff}}{\% of employees affected by new minimum.}
#'   \item{\code{meals}}{Free/reduced priced code.}
#'   \item{\code{open}}{Hour of opening.}
#'   \item{\code{hrsopen}}{Number of hours open per day.}
#'   \item{\code{psode}}{Price of medium soda, including tax.}
#'   \item{\code{pfry}}{Price of small fries, including tax.}
#'   \item{\code{pentree}}{Price of entree, including tax.}
#'   \item{\code{nregs}}{Number of cash registers in store.}
#'   \item{\code{nregs11}}{Number of registers open at 11:00 pm.}
#'   \item{\code{type}}{Type of 2nd interview.}
#'   \item{\code{status}}{Status of 2nd interview.}
#'   \item{\code{date}}{Date of 2nd interview.}
#'   \item{\code{nregs11}}{"Yes" if special program for new workers.}
#' }
#' @source \url{http://davidcard.berkeley.edu/data_sets.html}
"njmin"
