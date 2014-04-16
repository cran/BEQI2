context("Compare results with those obtained by 'hand'.")

# note: working directory is: .../BEQI2/tests/testthat"

test_that("DUTCH_COAST_NOORWIJK2 test case can be reproduced.", {

    # create settings file
    settings <- list(
        "title" = "TEST_DUTCH_COAST_NOORWIJK2",
        "user" = "user",
        "date" = "today",
        "BEQI-file" = "BEQI2-FILES/INPUT-FILES/TEST_DUTCH_COAST_NOORWIJK2.csv",
    	"TWN-file" = system.file("extdata", "REF-FILES", 
            "TAXA-TWN-2013-11-27.csv", package = "BEQI2"),
    	"ITI-file" = system.file("extdata", "REF-FILES", 
            "ITI.csv", package = "BEQI2"),
    	"ER-file" = system.file("extdata", "REF-FILES", 
            "BEQI2-Ecotopes-2014-04-11.csv", package = "BEQI2"),
        "AMBI-file" = system.file("extdata", "REF-FILES", "AMBI-NL+.csv", package = "BEQI2"),
    	"months" = c(3, 3),
    	"pool" = FALSE,
    	"random seed" = 314,
        "target area" = c(0.05, 0.07),
    	"Genus to species conversion" = TRUE,
    	"report-file" = tempfile(fileext = ".html"),
    	"log-file" = tempfile(fileext = ".log"),
    	"pool-file" = tempfile(fileext = ".csv"),
    	"output-file" = tempfile(fileext = ".csv"),
        "working directory" = getwd()
    )
    filename <- tempfile(fileext = ".json")
    writeLines(text = toJSON(x = settings), con = filename)

    # run BEQI-2
    beqi2(filename = filename, browse = FALSE)

    # read results
    result <- read.csv(
        sub(
            pattern = "/file|\\\\file", 
            replacement = "/ECOTOPE_file", 
            x = settings[["output-file"]]
        ),
        check.names = FALSE
    )
        
    # compare with expected results extracted from
    # '_BEQI2-TESTSET-14jan2014-v2_dennis.xlsx'
    expect_that(result$N, equals(102))
    expect_that(result$S, equals(14))
    expect_that(result$H, equals(2.680138054))
    expect_that(result$AMBI, equals(1.4558823529))

})




test_that("DUTCH_COAST_EGMOND test case can be reproduced.", {

    # create settings file
    settings <- list(
        "title" = "TEST_DUTCH_COAST_EGMOND",
        "user" = "user",
        "date" = "today",
        "BEQI-file" = "BEQI2-FILES/INPUT-FILES/TEST_DUTCH_COAST_EGMOND.csv",
        "TWN-file" = system.file("extdata", "REF-FILES", 
            "TAXA-TWN-2013-11-27.csv", package = "BEQI2"),
    	"ITI-file" = system.file("extdata", "REF-FILES", 
            "ITI.csv", package = "BEQI2"),
    	"ER-file" = system.file("extdata", "REF-FILES", 
            "BEQI2-Ecotopes-2014-04-11.csv", package = "BEQI2"),
        "AMBI-file" = system.file("extdata", "REF-FILES", "AMBI-NL+.csv", package = "BEQI2"),
    	"months" = c(3, 3),
    	"pool" = FALSE,
    	"random seed" = 314,
        "target area" = c(0.05, 0.07),
    	"Genus to species conversion" = TRUE,
    	"report-file" = tempfile(fileext = ".html"),
    	"log-file" = tempfile(fileext = ".log"),
    	"pool-file" = tempfile(fileext = ".csv"),
    	"output-file" = tempfile(fileext = ".csv"),
        "working directory" = getwd()
    )
    filename <- tempfile(fileext = ".json")
    writeLines(text = toJSON(x = settings), con = filename)

    # run BEQI-2
    beqi2(filename = filename, browse = FALSE)

    # read results
    result <- read.csv(
        sub(
            pattern = "/file|\\\\file", 
            replacement = "/ECOTOPE_file", 
            x = settings[["output-file"]]
        ),
        check.names = FALSE
    )
        
    # compare with expected results extracted from
    # '_BEQI2-TESTSET-14jan2014-v2_dennis.xlsx'
    expect_that(result$N, equals(384))
    expect_that(result$S, equals(11))
    expect_that(result$H, equals(0.8450826676))
    expect_that(result$AMBI, equals(0.24609375))

})





test_that("WADDEN_COAST3 test case can be reproduced.", {

    # create settings file
    settings <- list(
        "title" = "TEST_WADDEN_COAST3",
        "user" = "user",
        "date" = "today",
        "BEQI-file" = "BEQI2-FILES/INPUT-FILES/TEST_WADDEN_COAST3.csv",
        "TWN-file" = system.file("extdata", "REF-FILES", 
            "TAXA-TWN-2013-11-27.csv", package = "BEQI2"),
        "ITI-file" = system.file("extdata", "REF-FILES", 
            "ITI.csv", package = "BEQI2"),
    	"ER-file" = system.file("extdata", "REF-FILES", 
            "BEQI2-Ecotopes-2014-04-11.csv", package = "BEQI2"),
        "AMBI-file" = system.file("extdata", "REF-FILES", "AMBI-NL+.csv", package = "BEQI2"),
    	"months" = c(3, 3),
    	"pool" = FALSE,
    	"random seed" = 314,
        "target area" = c(0.05, 0.07),
    	"Genus to species conversion" = TRUE,
    	"report-file" = tempfile(fileext = ".html"),
    	"log-file" = tempfile(fileext = ".log"),
    	"pool-file" = tempfile(fileext = ".csv"),
    	"output-file" = tempfile(fileext = ".csv"),
        "working directory" = getwd()
    )
    filename <- tempfile(fileext = ".json")
    writeLines(text = toJSON(x = settings), con = filename)

    # run BEQI-2
    beqi2(filename = filename, browse = FALSE)

    # read results
    result <- read.csv(
        sub(
            pattern = "/file|\\\\file", 
            replacement = "/ECOTOPE_file", 
            x = settings[["output-file"]]
        ),
        check.names = FALSE
    )
        
    # compare with expected results extracted from
    # '_BEQI2-TESTSET-14jan2014-v2_dennis.xlsx'
    expect_that(result$N, equals(292))
    expect_that(result$S, equals(17))
    expect_that(result$H, equals(2.6037500321))
    expect_that(result$AMBI, equals(2.1267123288))
})






test_that("WADDEN_SEA_BALGZDB-P1 test case can be reproduced.", {

    # create settings file
    settings <- list(
        "title" = "TEST_WADDEN_SEA_BALGZDB-P1",
        "user" = "user",
        "date" = "today",
        "BEQI-file" = "BEQI2-FILES/INPUT-FILES/TEST_WADDEN_SEA_BALGZDB-P1.csv",
        "TWN-file" = system.file("extdata", "REF-FILES", 
            "TAXA-TWN-2013-11-27.csv", package = "BEQI2"),
        "ITI-file" = system.file("extdata", "REF-FILES", 
            "ITI.csv", package = "BEQI2"),
        "ER-file" = system.file("extdata", "REF-FILES", 
            "BEQI2-Ecotopes-2014-04-11.csv", package = "BEQI2"),
        "AMBI-file" = system.file("extdata", "REF-FILES", "AMBI-NL+.csv", package = "BEQI2"),
    	"months" = c(8, 9),
    	"pool" = FALSE,
    	"random seed" = 314,
        "target area" = c(0.05, 0.07),
    	"Genus to species conversion" = TRUE,
    	"report-file" = tempfile(fileext = ".html"),
    	"log-file" = tempfile(fileext = ".log"),
    	"pool-file" = tempfile(fileext = ".csv"),
    	"output-file" = tempfile(fileext = ".csv"),
        "working directory" = getwd()
    )
    filename <- tempfile(fileext = ".json")
    writeLines(text = toJSON(x = settings), con = filename)

    # run BEQI-2
    beqi2(filename = filename, browse = FALSE)

    # read results
    result <- read.csv(
        sub(
            pattern = "/file|\\\\file", 
            replacement = "/ECOTOPE_file", 
            x = settings[["output-file"]]
        ),
        check.names = FALSE
    )
        
    # compare with expected results extracted from
    # '_BEQI2-TESTSET-14jan2014-v2_dennis.xlsx'
    expect_that(result$N, equals(19))
    expect_that(result$S, equals(6))
    expect_that(result$H, equals(2.504800383))
    expect_that(result$AMBI, equals(3.6315789474))
})





test_that("WADDEN_SEA_BALGZDB-P5 test case can be reproduced.", {

    # create settings file
    settings <- list(
        "title" = "TEST_WADDEN_SEA_BALGZDB-P5",
        "user" = "user",
        "date" = "today",
        "BEQI-file" = "BEQI2-FILES/INPUT-FILES/TEST_WADDEN_SEA_BALGZDB-P5.csv",
        "TWN-file" = system.file("extdata", "REF-FILES", 
            "TAXA-TWN-2013-11-27.csv", package = "BEQI2"),
        "ITI-file" = system.file("extdata", "REF-FILES", 
            "ITI.csv", package = "BEQI2"),
        "ER-file" = system.file("extdata", "REF-FILES", 
            "BEQI2-Ecotopes-2014-04-11.csv", package = "BEQI2"),
        "AMBI-file" = system.file("extdata", "REF-FILES", "AMBI-NL+.csv", package = "BEQI2"),
    	"months" = c(8, 9),
    	"pool" = FALSE,
    	"random seed" = 314,
        "target area" = c(0.05, 0.07),
    	"Genus to species conversion" = TRUE,
    	"report-file" = tempfile(fileext = ".html"),
    	"log-file" = tempfile(fileext = ".log"),
    	"pool-file" = tempfile(fileext = ".csv"),
    	"output-file" = tempfile(fileext = ".csv"),
        "working directory" = getwd()
    )
    filename <- tempfile(fileext = ".json")
    writeLines(text = toJSON(x = settings), con = filename)

    # run BEQI-2
    beqi2(filename = filename, browse = FALSE)

    # read results
    result <- read.csv(
        sub(
            pattern = "/file|\\\\file", 
            replacement = "/ECOTOPE_file", 
            x = settings[["output-file"]]
        ),
        check.names = FALSE
    )
        
    # compare with expected results extracted from
    # '_BEQI2-TESTSET-14jan2014-v2_dennis.xlsx'
    expect_that(result$N, equals(14))
    expect_that(result$S, equals(8))
    expect_that(result$H, equals(2.6923806025))
    expect_that(result$AMBI, equals(3))
})






test_that("WADDEN_SEA_PIETSVPT600-P10 test case can be reproduced.", {

    # create settings file
    settings <- list(
        "title" = "TEST_WADDEN_SEA_PIETSVPT600-P10",
        "user" = "user",
        "date" = "today",
        "BEQI-file" = "BEQI2-FILES/INPUT-FILES/TEST_WADDEN_SEA_PIETSVPT600-P10.csv",
        "TWN-file" = system.file("extdata", "REF-FILES", 
            "TAXA-TWN-2013-11-27.csv", package = "BEQI2"),
        "ITI-file" = system.file("extdata", "REF-FILES", 
            "ITI.csv", package = "BEQI2"),
        "ER-file" = system.file("extdata", "REF-FILES", 
            "BEQI2-Ecotopes-2014-04-11.csv", package = "BEQI2"),
        "AMBI-file" = system.file("extdata", "REF-FILES", "AMBI-NL+.csv", package = "BEQI2"),
    	"months" = c(8, 9),
    	"pool" = FALSE,
    	"random seed" = 314,
        "target area" = c(0.05, 0.07),
    	"Genus to species conversion" = TRUE,
    	"report-file" = tempfile(fileext = ".html"),
    	"log-file" = tempfile(fileext = ".log"),
    	"pool-file" = tempfile(fileext = ".csv"),
    	"output-file" = tempfile(fileext = ".csv"),
        "working directory" = getwd()
    )
    filename <- tempfile(fileext = ".json")
    writeLines(text = toJSON(x = settings), con = filename)

    # run BEQI-2
    beqi2(filename = filename, browse = FALSE)

    # read results
    result <- read.csv(
        sub(
            pattern = "/file|\\\\file", 
            replacement = "/ECOTOPE_file", 
            x = settings[["output-file"]]
        ),
        check.names = FALSE
    )
        
    # compare with expected results extracted from
    # '_BEQI2-TESTSET-14jan2014-v2_dennis.xlsx'
    expect_that(result$N, equals(123))
    expect_that(result$S, equals(13))
    expect_that(result$H, equals(1.7874029368))
    expect_that(result$AMBI, equals(4.243902439))
})



test_that("POOL_BALGZDB-P1_BALGZDB-P5 test case can be reproduced.", {

    # create settings file
    settings <- list(
        "title" = "TEST_POOL_BALGZDB-P1_BALGZDB-P5",
        "user" = "user",
        "date" = "today",
        "BEQI-file" = "BEQI2-FILES/INPUT-FILES/TEST_POOL_BALGZDB-P1_BALGZDB-P5.csv",
        "TWN-file" = system.file("extdata", "REF-FILES", 
            "TAXA-TWN-2013-11-27.csv", package = "BEQI2"),
        "ITI-file" = system.file("extdata", "REF-FILES", 
            "ITI.csv", package = "BEQI2"),
        "ER-file" = system.file("extdata", "REF-FILES", 
            "BEQI2-Ecotopes-2014-04-11.csv", package = "BEQI2"),
        "AMBI-file" = system.file("extdata", "REF-FILES", "AMBI-NL+.csv", package = "BEQI2"),
        "months" = c(3, 3),
    	"pool" = TRUE,
    	"random seed" = 314,
        "target area" = c(0.09, 0.11),
    	"Genus to species conversion" = TRUE,
    	"report-file" = tempfile(fileext = ".html"),
    	"log-file" = tempfile(fileext = ".log"),
    	"pool-file" = tempfile(fileext = ".csv"),
    	"output-file" = tempfile(fileext = ".csv"),
        "working directory" = getwd()
    )
    filename <- tempfile(fileext = ".json")
    writeLines(text = toJSON(x = settings), con = filename)

    # run BEQI-2
    beqi2(filename = filename, browse = FALSE)

    # read results
    result <- read.csv(
        sub(
            pattern = "/file|\\\\file", 
            replacement = "/ECOTOPE_file", 
            x = settings[["output-file"]]
        ),
        check.names = FALSE
    )
        
    # compare with expected results extracted from
    # '_BEQI2-TESTSET-14jan2014-v2_dennis.xlsx'
    expect_that(result$N, equals(33))
    expect_that(result$S, equals(10))
    expect_that(result$H, equals(2.9883798335))
    expect_that(result$AMBI, equals(3.3636363636))
})




test_that("POOL_BALGZDB-P1_PIETSVPT600-P10 test case can be reproduced.", {

    # create settings file
    settings <- list(
        "title" = "TEST_POOL_BALGZDB-P1_PIETSVPT600-P10",
        "user" = "user",
        "date" = "today",
        "BEQI-file" = "BEQI2-FILES/INPUT-FILES/TEST_POOL_BALGZDB-P1_PIETSVPT600-P10.csv",
        "TWN-file" = system.file("extdata", "REF-FILES", 
            "TAXA-TWN-2013-11-27.csv", package = "BEQI2"),
        "ITI-file" = system.file("extdata", "REF-FILES", 
            "ITI.csv", package = "BEQI2"),
        "ER-file" = system.file("extdata", "REF-FILES", 
            "BEQI2-Ecotopes-2014-04-11.csv", package = "BEQI2"),
        "AMBI-file" = system.file("extdata", "REF-FILES", "AMBI-NL+.csv", package = "BEQI2"),
        "months" = c(3, 3),
        "pool" = TRUE,
    	"random seed" = 314,
        "target area" =  c(0.05, 0.07),
    	"Genus to species conversion" = TRUE,
    	"report-file" = tempfile(fileext = ".html"),
    	"log-file" = tempfile(fileext = ".log"),
    	"pool-file" = tempfile(fileext = ".csv"),
    	"output-file" = tempfile(fileext = ".csv"),
        "working directory" = getwd()
    )
    filename <- tempfile(fileext = ".json")
    writeLines(text = toJSON(x = settings), con = filename)

    # run BEQI-2
    beqi2(filename = filename, browse = FALSE)

    # read results
    result <- read.csv(
        sub(
            pattern = "/file|\\\\file", 
            replacement = "/ECOTOPE_file", 
            x = settings[["output-file"]]
        ),
        check.names = FALSE
    )
        
    # compare with expected results extracted from
    # '_BEQI2-TESTSET-14jan2014-v2_dennis.xlsx'
    expect_that(result$N, equals(142))
    expect_that(result$S, equals(13))
    expect_that(result$H, equals(2.0584343225))
    expect_that(result$AMBI, equals(4.161971831))
})




test_that("POOL_BALGZD-P5_PIETSVPT600-P10 test case can be reproduced.", {

    # create settings file
    settings <- list(
        "title" = "TEST_POOL_BALGZD-P5_PIETSVPT600-P10",
        "user" = "user",
        "date" = "today",
        "BEQI-file" = "BEQI2-FILES/INPUT-FILES/TEST_POOL_BALGZD-P5_PIETSVPT600-P10.csv",
        "TWN-file" = system.file("extdata", "REF-FILES", 
            "TAXA-TWN-2013-11-27.csv", package = "BEQI2"),
        "ITI-file" = system.file("extdata", "REF-FILES", 
            "ITI.csv", package = "BEQI2"),
        "ER-file" = system.file("extdata", "REF-FILES", 
            "BEQI2-Ecotopes-2014-04-11.csv", package = "BEQI2"),
        "AMBI-file" = system.file("extdata", "REF-FILES", "AMBI-NL+.csv", package = "BEQI2"),
        "months" = c(3, 3),
        "pool" = TRUE,
        "random seed" = 314,
        "target area" =  c(0.05, 0.07),
    	"Genus to species conversion" = TRUE,
    	"report-file" = tempfile(fileext = ".html"),
    	"log-file" = tempfile(fileext = ".log"),
    	"pool-file" = tempfile(fileext = ".csv"),
    	"output-file" = tempfile(fileext = ".csv"),
        "working directory" = getwd()
    )
    filename <- tempfile(fileext = ".json")
    writeLines(text = toJSON(x = settings), con = filename)

    # run BEQI-2
    beqi2(filename = filename, browse = FALSE)

    # read results
    result <- read.csv(
        sub(
            pattern = "/file|\\\\file", 
            replacement = "/ECOTOPE_file", 
            x = settings[["output-file"]]
        ),
        check.names = FALSE
    )
        
    # compare with expected results extracted from
    # '_BEQI2-TESTSET-14jan2014-v2_dennis.xlsx'
    expect_that(result$N, equals(137))
    expect_that(result$S, equals(14))
    expect_that(result$H, equals(2.012301219))
    expect_that(result$AMBI, equals(4.1167883212))
})
