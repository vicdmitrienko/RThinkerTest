TestApp = function() {

  appDir = system.file("TestApp", package = "ThinkerTest")
  shiny::runApp(appDir, display.mode = "normal")

}
