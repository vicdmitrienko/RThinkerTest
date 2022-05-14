shinyServer(function(input, output, session) {

    observeEvent(input$do_calc, {

        calcTime <- input$calcTime

        withProgress(
            message = "Running calculations",
            value = 1,
            {
                # Run calculations
                rcpp_think( calcTime )
            }
        )

        output$calcResult <- renderText({ paste("Calculation has done within", calcTime, "seconds") })
    })

})