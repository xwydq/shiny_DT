
library(shiny)
library(shinydashboard)
library(DT)


# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    output$demo_scroll_div = renderDataTable({
        iris
    }, escape = FALSE, width = "100%", 
    rownames = FALSE,
    options = list(
        dom = 't',
        language = list(url = '//cdn.datatables.net/plug-ins/1.10.11/i18n/Chinese.json'),
        pageLength = 50
    ))
    
    output$demo_scroll_option = renderDataTable({
        iris
    }, escape = FALSE, 
    rownames = FALSE,
    options = list(
        dom = 't',
        scrollX = "300px", scrollY = "300px", 
        language = list(url = '//cdn.datatables.net/plug-ins/1.10.11/i18n/Chinese.json'),
        pageLength = 50
    ))
    
    output$demo_scroll_option_div = renderDataTable({
        iris
    }, escape = FALSE, 
    rownames = FALSE,
    options = list(
        dom = 't',
        scrollX = "300px", scrollY = "300px", 
        language = list(url = '//cdn.datatables.net/plug-ins/1.10.11/i18n/Chinese.json'),
        pageLength = 50
    ))
    
    
    output$demo_tab_header = renderDataTable({
        iris
    }, 
    options = list(
        dom = 't',
        initComplete = JS("
    function(settings, json) {
      $(this.api().table().header()).css({
        'background-color': '#000',
        'color': '#fff'
      });
    }")
    ))
    
    output$demo_dataformat1 = renderDataTable({
        df <- data.frame(
            A = rpois(100, 1e4),
            B = runif(100),
            C = rpois(100, 1e3),
            D = rnorm(100),
            E = Sys.Date() + 1:100
        )
        datatable(df) %>%
            formatCurrency(c('A', 'C'), '€') %>%
            formatPercentage('B', 2) %>%
            formatRound('D', 3) %>%
            formatDate('E', 'toDateString')
    })
    
    output$demo_dataformat2 = renderDataTable({
        datatable(iris) %>% 
            formatStyle('Sepal.Length', fontWeight = styleInterval(5, c('normal', 'bold'))) %>%
            formatStyle(
                'Sepal.Width',
                color = styleInterval(c(3.4, 3.8), c('white', 'blue', 'red')),
                backgroundColor = styleInterval(3.4, c('gray', 'yellow'))
            ) %>%
            formatStyle(
                'Petal.Length',
                background = styleColorBar(iris$Petal.Length, 'steelblue'),
                backgroundSize = '100% 90%',
                backgroundRepeat = 'no-repeat',
                backgroundPosition = 'center'
            ) %>%
            formatStyle(
                'Species',
                transform = 'rotateX(45deg) rotateY(20deg) rotateZ(30deg)',
                backgroundColor = styleEqual(
                    unique(iris$Species), c('lightblue', 'lightgreen', 'lightpink')
                )
            )
    })
    
    
    
    output$demo_select = renderDataTable({
        iris  
    }, selection = "single"
    )    
    
    output$demo_select2 = renderDataTable({
        iris  
    }, escape = FALSE, width = "100%", 
    rownames = FALSE,
    colnames = c("楼层", "用电量"),
    server = FALSE, selection = "single",
    options = list(
        dom = 't',
        language = list(url = '//cdn.datatables.net/plug-ins/1.10.11/i18n/Chinese.json'),
        pageLength = 50,
        lengthChange = TRUE,
        initComplete = JS(
            "function(settings, json) {",
            "$(this.api().table().header()).css({'background-color': '#e1e1e1', 'color': '#000'});",
            "}"
        )
    ))
})
