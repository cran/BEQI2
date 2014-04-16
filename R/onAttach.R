.onAttach <-
function(libname, pkgname) {
    packageStartupMessage(
        "\nFor more information on the usage of the BEQI2 tool, type:\n", 
        'vignette("BEQI2")'
    )
}  
