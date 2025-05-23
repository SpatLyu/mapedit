% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/edit.R
\name{editMap}
\alias{editMap}
\alias{editMap.leaflet}
\alias{editMap.mapview}
\alias{editMap.NULL}
\title{Interactively Edit a Map}
\usage{
editMap(x, ...)

\method{editMap}{leaflet}(
  x = NULL,
  targetLayerId = NULL,
  sf = TRUE,
  ns = "mapedit-edit",
  record = FALSE,
  viewer = shiny::paneViewer(),
  crs = 4326,
  title = "Edit Map",
  editor = c("leaflet.extras", "leafpm"),
  editorOptions = list(),
  ...
)

\method{editMap}{mapview}(
  x = NULL,
  targetLayerId = NULL,
  sf = TRUE,
  ns = "mapedit-edit",
  record = FALSE,
  viewer = shiny::paneViewer(),
  crs = 4326,
  title = "Edit Map",
  editor = c("leaflet.extras", "leafpm"),
  editorOptions = list(),
  ...
)

\method{editMap}{`NULL`}(x, editor = c("leaflet.extras", "leafpm"), editorOptions = list(), ...)
}
\arguments{
\item{x}{\code{leaflet} or \code{mapview} map to edit}

\item{...}{other arguments for \code{leafem::addFeatures()} when
using \code{editMap.NULL} or \code{selectFeatures}}

\item{targetLayerId}{\code{string} name of the map layer group to use with edit}

\item{sf}{\code{logical} return simple features.  The default is \code{TRUE}.
If \code{sf = FALSE}, \code{GeoJSON} will be returned.}

\item{ns}{\code{string} name for the Shiny \code{namespace} to use.  The \code{ns}
is unlikely to require a change.}

\item{record}{\code{logical} to record all edits for future playback.}

\item{viewer}{\code{function} for the viewer.  See Shiny \code{\link[shiny]{viewer}}.
NOTE: when using \code{browserViewer(browser = getOption("browser"))} to
open the app in the default browser, the browser window will automatically
close when closing the app (by pressing "done" or "cancel") in most browsers.
Firefox is an exception. See Details for instructions on how to enable this
behaviour in Firefox.}

\item{crs}{see \code{\link[sf]{st_crs}}.}

\item{title}{\code{string} to customize the title of the UI window.  The default
is "Edit Map".}

\item{editor}{\code{character} either "leaflet.extras" or "leafpm"}

\item{editorOptions}{\code{list} of options suitable for passing to
either \code{leaflet.extras::addDrawToolbar} or
\code{leafpm::addPmToolbar}.}
}
\value{
\code{sf} simple features or \code{GeoJSON}
}
\description{
Interactively Edit a Map
}
\details{
When setting \code{viewer = browserViewer(browser = getOption("browser"))} and
the systems default browser is Firefox, the browser window will likely not
automatically close when the app is closed (by pressing "done" or "cancel").
To enable automatic closing of tabs/windows in Firefox try the following:
\itemize{
\item{input "about:config " to your firefox address bar and hit enter}
\item{make sure your "dom.allow_scripts_to_close_windows" is true}
}
}
\examples{
\dontrun{
library(leaflet)
library(mapedit)
editMap(leaflet() \%>\% addTiles())
}
\dontrun{
  # demonstrate Leaflet.Draw on a layer
  library(sf)
  library(mapview)
  library(leaflet.extras)
  library(mapedit)

  # ?sf::sf
  pol = st_sfc(
    st_polygon(list(cbind(c(0,3,3,0,0),c(0,0,3,3,0)))),
    crs = 4326
  )
  mapview(pol) \%>\%
    editMap(targetLayerId = "pol")

  mapview(franconia[1:2,]) \%>\%
    editMap(targetLayerId = "franconia[1:2, ]")
}
}
