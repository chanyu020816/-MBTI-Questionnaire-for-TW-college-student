# tab 02 - 散佈圖
tabItem(
  tabName = "visualization",
  fluidRow(
    box(
      title = span("選擇項", style = "font-weight: bold; font-size: 20px"),
      width = 4,
      headerBorder = FALSE,
      selectInput("test", "請選擇像要進行之檢定",
        choices = c("卡方檢定")),
      textInput("alpha", "alpha",
        value = "0.05"),
      uiOutput("variable"),
      span("統計結果", style = "font-weight: bold; font-size: 20px"),
      uiOutput("test_result")
    ),
    box(
      title = span("表格", style = "font-weight: bold; font-size: 20px"),
      width = 8,
      height = 800,
      headerBorder = TRUE,
      plotlyOutput("plot",
        height = "600px",
        inline = TRUE
      )
    )
  )
)
