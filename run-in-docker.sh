#!/bin/sh

sudo docker run -p 3838:3838 medianainc/shinyproxy-thinkertest R -e 'ThinkerTest::TestApp()' 