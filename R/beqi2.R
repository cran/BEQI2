#' 	Perform BEQI-2 Analysis
#'
#' 	This function performs a complete BEQI-2 analysis following the
#'	settings provided in \code{filename}.
#'
#' 	@param filename name of the JSON file defining all analysis steps.
#'	@param tmpdir directory to store temporary files (for debugging only)
#'  @param browse load resulting report in a browser? \code{TRUE} or \code{FALSE}
#'
#' 	@export
beqi2 <-
function(filename = NULL, tmpdir = tempfile(pattern = "BEQI2"), browse = TRUE) {

    # prevent potential problems wit dates in other locales
    oldLocale <- Sys.getlocale("LC_TIME")
    on.exit(Sys.setlocale("LC_TIME", oldLocale))
    Sys.setlocale("LC_TIME", "C")
    
    # interactive selection of filename
    if (is.null(filename)) {
        filename <- tk_choose.files(
            default = "", 
            caption = "Select file with BEQI2 settings",
            multi = FALSE, 
            filters = matrix(data = c("BEQI2 settings", ".json"), nrow = 1)
        )
    }
    
    # check if filename exists
    if (length(filename) == 0L || !file.exists(filename)) {
        stop(
            sprintf("JSON-file %s does not exist", sQuote(filename)), 
            call. = FALSE
        )
    }

    # initialization message
    message("The BEQI-2 tool is running...")

    # read settings
	settings <- readSettings(filename)
    
    # start log-file
    toLog <- function(level = c("INFO", "WARNING", "ERROR"), message) {
        level <- match.arg(level)
        cat(
            format(Sys.time()), " [", level, "] ", message, "\n", 
            sep = "",
            file = settings[["log-file"]], 
            append = TRUE
        )
        if (level != "INFO") {
            message <- paste(message, "(see log-file)")
            switch(level,
               "ERROR"   = stop(message, call. = FALSE),
               "WARNING" = warning(message, call. = FALSE)
            )
        }
    }
    toLog("INFO", "Starting new BEQI-2 session")
    on.exit(toLog("INFO", "Stopping BEQI-2 session"), add = TRUE)

    # initialize random number generator
    toLog("INFO", "Initializing pseudo random number generator...")
    if (is.null(settings[["random seed"]])) {
        toLog("INFO", "No seed has been specified.")
        toLog("INFO", "The default initialization process will be followed.")
    } else {
        set.seed(seed = settings[["random seed"]])
        toLog("INFO", "Done.")
    }
    
    
    # check existence of BEQI-2 file
    toLog("INFO", "Checking existence of BEQI-2 file...")
    if (!file.exists(settings[["BEQI-file"]])) {
        toLog("ERROR", "BEQI-2 file not found")
        return()
    }
    toLog("INFO", "BEQI-2 file found")
    
    # check existence of TWN-file file
    toLog("INFO", "Checking existence of TWN-file...")
    if (!file.exists(settings[["TWN-file"]])) {
        toLog("ERROR", "TWN-file not found")
        return()
    }
    toLog("INFO", "TWN-file found")

	# create temporary directory
	if (!file.exists(tmpdir)) {
        toLog("INFO", "Creating temporary directory...")
		dir.create(tmpdir)
	}
    toLog("INFO", "Temporary directory created.")

	# copy template of report to temporary directory
    toLog("INFO", "Populating temporary directory...")
	templates <- list.files(
		path = system.file("Rmd", package = "BEQI2"),
		pattern = "\\.Rmd$", full.names = TRUE)
	file.copy(from = templates, to = tmpdir)
    toLog("INFO", "Temporary directory populated.")

    # create Markdown document 
    # (code below works better than knit2html)
    toLog("INFO", "Checking existence of directory to store report-file...")
    if (!file.exists(dirname(settings[["report-file"]]))) {
        toLog("ERROR", "directory not found.")
        return()
    }
    toLog("INFO", "directory found.")

    toLog("INFO", "Starting to create a report...")
    owd <- setwd(tmpdir)
    on.exit(setwd(owd), add = TRUE)
	suppressMessages(
        res <- try(knit(input = "beqi2.Rmd", quiet = TRUE), silent = TRUE)
    )
    if (inherits(res, "try-error")) {
        toLog(
            level = "ERROR", 
            message = toString(attr(res, "condition")$message)
        )
        return()
    }
    toLog("INFO", "Report created.")
    toLog("INFO", "Converting report to HTML...")
	markdownToHTML(
		file  = "beqi2.md", 
		output = settings[["report-file"]],
        options = getOption("markdown.HTML.options"),
        extensions = getOption("markdown.extensions"),
    	title = "Benthic Ecosystem Quality Index 2 Report",
        stylesheet = system.file("css", "beqi2.css", package = "BEQI2")
	)
    toLog("INFO", "Report converted to HTML.")

	# view result
	if (browse) {
		browseURL(settings[["report-file"]])
	}
    
    # finalization
    message("The BEQI-2 run has been completed successfully.")
}



#'  Perform BEQI-2 Analysis
#'
#'  @inheritParams beqi2
#'  
#'  @rdname beqi2
#'  
#' 	@export
BEQI2 <- 
function(filename = NULL, tmpdir = tempdir(), browse = TRUE) {
    beqi2(filename = filename, tmpdir = tmpdir, browse = browse)
}
