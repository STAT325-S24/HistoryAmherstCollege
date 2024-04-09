#' History of Amherst College text
#'
#' The text of the 1873 book "A History of Amherst College" by William Seymour Tyler.
#'
#' @docType data
#' @name history_text
#' @usage data(history_text)
#'
#' @keywords datasets
#'
#' @source See https://archive.org/details/historyofamherst00tyleiala for the book in a variety of formats.
#' @format
#'   A data frame with XX observations on the following variables.
#'   \itemize{
#'     \item{\code{text}} {text of the book}
#'     \item{\code{chapter}{chapter number}
#'     \item{\code{paragraph}{paragraph in the chapter}
#'     \item{\code{page_number}{page number in the book}
#'   }
#'
"history_text"

#' History of Amherst College annotated text
#'
#' Annotated entities from the cleanNLP package.
#'
#' @docType data
#' @name history_anno
#' @usage data(history_anno)
#'
#' @keywords datasets
#'
#' @source See https://archive.org/details/historyofamherst00tyleiala for the book in a variety of formats.
#' @format
#'   A list (also cnlp_annotation class, see cleanNLP package) with 3 objects on the following variables .
#'   \itemize{
#'     \item{\code{token}} {tibble of token information}
#'     \item{\code{entity}}{tibble containing entity information}
#'     \item{\code{document}}{document information}
#'   }
#'
"history_anno"

#' History of Amherst College page sub titles
#'
#' This is a table of the headings that accompany the page number on each page.
#'
#' @docType data
#' @name history_subtitles
#' @usage data(history_subtitles)
#'
#' @keywords datasets
#'
#' @source See https://archive.org/details/historyofamherst00tyleiala for the book in a variety of formats.
#' @format
#'   A data frame with 636 observations on the following variables.
#'   \itemize{
#'     \item{\code{chapter}} {The chapter the heading is present in}
#'     \item{\code{page_number}}{The page number the heading occurs on}
#'     \item{\code{page_header}}{The actual string value of the heading}
#'   }
#'
"history_subtitles"

#' History of Amherst College tables
#'
#' This table details the page number in the book and the PDF of the 15 tables present in the book
#'
#' @docType data
#' @name history_tables
#' @usage data(history_tables)
#'
#' @keywords datasets
#'
#' @source See https://archive.org/details/historyofamherst00tyleiala for the book in a variety of formats.
#' @format
#'   A data frame with 15 observations on the following variables.
#'   \itemize{
#'     \item{\code{pdf_pg}} {The page the table starts on in the PDF}
#'     \item{\code{book_pg}}{The page of the actual book the table starts on}
#'     \item{\code{title}}{The name/description of the table}
#'   }
#'
"history_tables"

#' History of Amherst College figures
#'
#' This table details the page number in the PDF of the 20 images present in the book
#'
#' @docType data
#' @name history_figures
#' @usage data(history_figures)
#'
#' @keywords datasets
#'
#' @source See https://archive.org/details/historyofamherst00tyleiala for the book in a variety of formats.
#' @format
#'   A data frame with XX observations on the following variables.
#'   \itemize{
#'     \item{\code{pdf_pg}} {The page the figure is on in the PDF}
#'     \item{\code{caption}}{The caption of the figure}
#'   }
#'
"history_figures"

#' History of Amherst College Table of Contents
#'
#' This table contains the page number and the titles for every chapter in the book including the Appendix
#'
#' @docType data
#' @name history_toc
#' @usage data(history_toc)
#'
#' @keywords datasets
#'
#' @source See https://archive.org/details/historyofamherst00tyleiala for the book in a variety of formats.
#' @format
#'   A data frame with 29 observations on the following variables.
#'   \itemize{
#'     \item{\code{title}} {The title of the chapter}
#'     \item{\code{page_number}}{The page number where the chapter starts}
#'     \item{\code{chapter}}{The chapter number}
#'   }
#'
"history_toc"

