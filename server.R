library(shiny)

 wygrane<-function(M,ss){
   
  if(nrow(M)>0){
   v<-apply(M,1,is.element,set=ss)
   x<-apply(v,2,sum)
   data.frame(threes=length(x[x==3]),fours=length(x[x==4]),fives=length(x[x==5]),sixes=length(x[x==6]))
  }
   else
     data.frame(threes=numeric(),fours=numeric(),fives=numeric(),sixes=numeric())
   
   }


shinyServer(
  function(input,output){
       values<-reactiveValues()
       values$df<-data.frame(n1=numeric(),n2=numeric(),n3=numeric(),n4=numeric(),n5=numeric(),n6=numeric())
       values$df2<-data.frame()
       values$ss<-numeric()
       values$html<-HTML("<p></p>")
       
       newEntry1<-observe({if(input$button1!=0){
                     newLine<-isolate(c(input$input1,input$input2,input$input3,input$input4,input$input5,input$input6))
                    if(length(unique(newLine))==6)
                     values$df<-isolate(unique.data.frame(rbind(values$df,sort(newLine))))
       }})
       
       newEntry2<-observe({if(input$button2!=0){
         values$df<-isolate(unique.data.frame(rbind(values$df,sort(sample(1:49,6)))))
       }})
       newEntry3<-observe({if(input$button3!=0){
         values$df<-isolate(data.frame(n1=numeric(),n2=numeric(),n3=numeric(),n4=numeric(),n5=numeric(),n6=numeric()))
         values$df2<-data.frame()
         values$ss<-numeric()
       }})
       
       newEntry3<-observe({if(input$button4!=0){
         values$ss<-isolate(sample(1:49,size=6))
         values$df2<-isolate(wygrane(values$df,values$ss))
         }})
       newEntry5<-observe({if(input$button5!=0)
                      values$html<-isolate(HTML("<p>Welcome to the lotto simulator!</p>
<ul>
                                                <li>To add the bet manually please input six unique numbers to the fields on the left and click <strong>Add</strong> button</li>
                                                <li>You can add only unique bets to each coupon and all numbers in single bet must be unique - for example combination 1,2,2,3,4,5 cannot be added</li>
                                                <li>To add a random bet to your coupon please click on <strong>Random bet</strong> button - sample of length six from 1,…,49 will be generated for you</li>
                                                <li>The total price of your coupon will be displayed in the bottom of the page(it is assumed, that the price for single bet is 3 dollars)</li>
                                                <li>To simulate the game please click on <strong>Play!</strong> button, the sample without replacement from 1,..,49 will be generated and in the top of the page total number of your scores (it is assumed that you win some award for hitting three, four, five or six numbers) will be displayed.</li>
                                                <li>To reset your coupon please click on <strong>Clear</strong> button.</li>
                                                </ul>"))})
       newEntry6<-observe({if(input$button6!=0)
                         values$html<-isolate(HTML("<p></p>"))})
       
       output$table2<-renderTable({if(nrow(values$df)>0) values$df})
       output$table1<-renderTable({if(nrow(values$df2)>0) values$df2})
       output$text1<-renderText({sort(values$ss)})
       output$text2<-renderText({3*nrow(values$df)})
       output$html1<-renderUI({values$html})
       
       
       
    })
    
    
    