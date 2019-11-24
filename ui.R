library(shiny)

shinyUI(fluidPage(

    titlePanel("Demo DT"),
    
    mainPanel(
        tabsetPanel(
            tabPanel("滚动", 
                     tags$h3("设置div style参数滚动"),
                     div( DT::dataTableOutput("demo_scroll_div"), 
                          style = "height:200px; width:300px; overflow-y: scroll;overflow-x: scroll;"),
                     
                     tags$h3("设置options scrollX,scrollY参数滚动, scrollX不起水平滚动作用"),
                     DT::dataTableOutput("demo_scroll_option"),
                     tags$blockquote("DT 自带格式参数 options:scrollY可以支持固定表头"),
                     tags$h3("组合：设置options scrollY参数垂直滚动, div style设置水平滚动"),
                     div( DT::dataTableOutput("demo_scroll_option_div"), 
                          style = "width:300px; scroll;overflow-x: scroll;"),
            ),
            tabPanel("表头样式", 
                     tags$h3("options:initComplete通过JS实现表头样式设计"),
                     DT::dataTableOutput("demo_tab_header")),
            tabPanel("数据格式", 
                     tags$a("https://rstudio.github.io/DT/functions.html"),
                     DT::dataTableOutput("demo_dataformat1"),
                     DT::dataTableOutput("demo_dataformat2")),
            tabPanel("行列选择", 
                     DT::dataTableOutput("demo_select"),
                     DT::dataTableOutput("demo_select2"))
        )
    )
))
