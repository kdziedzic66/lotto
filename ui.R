library(shiny)

shinyUI(
  pageWithSidebar(headerPanel('Lotto simulator'),sidebarPanel(numericInput("input1","number1",value=1,min=1,max=49,step=1),
                                                              numericInput("input2","number2",value=1,min=1,max=49,step=1),
                                                              numericInput("input3","number3",value=1,min=1,max=49,step=1),
                                                              numericInput("input4","number4",value=1,min=1,max=49,step=1),
                                                              numericInput("input5","number5",value=1,min=1,max=49,step=1),
                                                              numericInput("input6","number6",value=1,min=1,max=49,step=1),
                                                              actionButton("button1","Add"),
                                                              actionButton("button2","Random bet"),
                                                              actionButton("button3","Clear"),
                                                              actionButton("button4","Play!"),
                                                              actionButton("button5","show instructions"),
                                                              actionButton("button6","hide instructions")),
                  mainPanel(p("Your wins:"),tableOutput("table1"),p("Your coupon:"),tableOutput("table2"),p("winning numbers"),textOutput("text1"),
                            p("price:"),textOutput("text2"),htmlOutput("html1"))
    
  )
)