% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/editAttributes.R
\name{editAttributes}
\alias{editAttributes}
\title{Edit Feature Attributes}
\usage{
editAttributes(
  dat,
  zoomto = NULL,
  col_add = TRUE,
  reset = TRUE,
  provider = "Esri.WorldImagery",
  testing = FALSE
)
}
\arguments{
\item{dat}{input data source, can be a \code{data.frame} or an \verb{sf data.frame}, or it can be left empty.
When nothing is passed to \code{dat} a basic \code{data.frame} is generated with \code{id} and \code{comment} fields.}

\item{zoomto}{character area of interest. The area is defined using \link[tmaptools]{geocode_OSM},
which uses \href{https://nominatim.org/}{OSM Nominatim}. The area can be as ambiguous as a country, or
as specific as a street address. You can test the area of interest using the application or the example
code below.}

\item{col_add}{boolean option to enable add columns form. Set to false if you don't want to allow a user to modify
the data structure.}

\item{reset}{boolean option to reset attribute input. Set to false if you don't want the attribute input to
reset to NA after each added row. Use this option when features share common attributes}

\item{provider}{A character string indicating the provider tile of choice, e.g. 'Esri.WorldImagery' (default)}

\item{testing}{Only relevant for internal testing using shinytest.}
}
\value{
sf data.frame
}
\description{
Launches a \code{shiny} application where you can add and edit spatial geometry
and attributes. Geometry is created or edited within the interactive map, while feature attributes
can be added to and edited within the editable table.

Starting with a \code{data.frame} or an \verb{sf data.frame}, a list of \verb{sf data.frames} or nothing
at all. You can add columns, and rows and geometry for each row. Clicking on a row with geometry you can
zoom across the map between features.

When you are done, your edits are saved to an \verb{sf data.frame} for
use in R or to be saved to anyformat you wish via \link[sf]{st_write}.

The application can dynamically handle: character, numeric, integer, factor and date fields.

When the input data set is an \verb{sf data.frame} the map automatically zooms to the extent of the \code{sf} object.

When the input has no spatial data, you must tell the function where to zoom. The function uses
\link[tmaptools]{geocode_OSM} to identify the coordinates of your area of interest.
}
\note{
Editing of feature geometries does not work for multi-geometry inputs. For this use case it is advisable to
split the data set by geometry type and edit separately
}
\examples{
\dontrun{

# with no input
data_sf <- editAttributes(zoomto = 'germany')

# a data.frame input
dat <- data.frame(name = c('SiteA', 'SiteB'),
                  type = factor(
                    c('park', 'zoo')
                    , levels = c('park', 'factory', 'zoo', 'warehouse')
                  ),
                  size = c(35, 45))

data_sf <- editAttributes(dat, zoomto = 'berlin')

# an sf data.frame input
data_sf <- editAttributes(data_sf)

# test zoomto area of interest
zoomto_area <- tmaptools::geocode_OSM('paris')
mapview(st_as_sfc(zoomto_area$bbox))

}
}
