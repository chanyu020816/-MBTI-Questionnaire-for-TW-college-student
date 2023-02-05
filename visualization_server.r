rawData <-
  read_sheet(ss = "1JEpfmnb4z-KnNh90AGI8H5u256k7DGFsD53P1sKcIBc")

mbti <- c("ENTJ", "ENTP", "ENFJ","ENFP",
  "ESFJ", "ESTJ", "ESTP", "ESFP", "INTJ",
  "INTP", "INFJ", "INFP", "ISTJ", "ISFJ",
  "ISTP", "ISFP"
)
mbti_chi <- c("指揮官", "辯論家", "教育家",
  "競選者", "執政官", "總經理", "企業家",
  "表演者", "建築師", "邏輯學家", "提倡者",
  "調停者", "物流師", "守衛者", "鑑賞家",
  "探險家"
)
mbtiChi <- data.frame(mbti, mbti_chi)
data <- 
  rawData %>%
  # 篩選出未填答及不合理樣本
  filter(v1 != "NA" & v2 != "NA" & v1 != 250000 & v4 != 100) %>%
  mutate(
    # mbti 測驗結果
    mbti = paste0(IE, NS, TF, JP),
    # mbti 前測
    mbti_before = paste0(b1, b4, b2, b3),
    v4 = as.numeric(v4),
    link = paste0("https://www.16personalities.com/ch/", tolower(mbti),"-%E4%BA%BA%E6%A0%BC")
  ) %>%
  left_join(mbtiChi, mbti = mbti)
output$variable <- renderUI({
  if (input$test == "卡方檢定") {
    tagList(
      selectInput("varX", "x",
        choices = colnames(data),
        #c("sex", "變數一" = "v1"),
        selected = "sex"
      ),
      selectInput("varY", "y",
        choices = colnames(data),
        selected = "mbti")
    )
  }
})
observe({
  output$plot <- renderPlotly({
    req(input$varX)
    plot = ggplot(data, aes_string(input$varX, fill = input$varX)) +
      geom_bar() +
      geom_text(stat = 'count', aes(label = ..count..), vjust = -1, hjust = 0.5) +
      coord_cartesian(ylim = c(0, 50)) +
      facet_wrap(~ mbti)
    ggplotly(plot)
  })
})
output$test_result <- renderUI({
  req(input$alpha)
  req(input$varX)
  result <- if (input$test == "卡方檢定") {
    chisq = table(data[[input$varX]], data[[input$varY]])
    result = chisq.test(chisq)
    hyposis = ifelse(round(result$p.value, 5) < input$alpha, "拒絕虛無假設", "不拒絕虛無假設")
    var = c("X-squared:", "自由度為:", "p.value:", "檢定結果為")
    output = c(result$statistic, result$parameter, result$p.value, hyposis)
    result_table = data.frame(var, output)
    output$result_table <- renderTable({
      result_table
    })
  }
})
# output$js <- renderTrelliscope({
#   ggplot(data, aes(sex)) +
#     geom_bar() +
#     geom_text(stat = 'count', aes(label = ..count..), vjust = -1) +
#     coord_cartesian(ylim = c(0, 45)) +
#     facet_trelliscope(~ mbti, 2, 2, auto_cog = TRUE, as_plotly = TRUE, self_contained = TRUE)
# })
# data <- rawdata %>%
# 
# output$bar <- renderPlot({
#   mbti <- data %>%
#     mutate(
#       mbti_result = paste0(data$IE, data$NS, data$TF, data$JP)
#     ) %>%
#     select(mbti_result)
#   count <- table(mbti)
#   df <- mbti %>%
#     group_by(mbti_result) %>% # Variable to be transformed
#     count() %>%
#     ungroup() %>%
#     mutate(perc = `n` / sum(`n`)) %>%
#     arrange(perc) %>%
#     mutate(labels = scales::percent(perc))
#   ggplot(df, aes(x = "", y = perc, fill = mbti_result)) +
#     geom_col() +
#     geom_label(
#       aes(label = labels),
#       position = position_stack(vjust = 0.5),
#       show.legend = FALSE) +
#     coord_polar(theta = "y")
# })