library(shinydashboard)

dashboardPage(
  dashboardHeader(title = "ThinkerTest"),
  dashboardSidebar(),
  dashboardBody(

    box(
      title = "Calculation time",
      width = 12,

      sliderInput("calcTime", "Calculation time in seconds", 3, 1200, 5),
      textOutput("calcResult")
    ),

    box(
      width = 12,
      background = "light-blue",

      actionButton("do_calc", "Run!")
    )

  )
)