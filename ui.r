# UI
 
dashboardPage(
  # 標題
  dashboardHeader(
    title = span("MBTI 問卷調查", style = "font-weight: bold; font-size: 35px")
  ),
  # 側邊選單
  dashboardSidebar(
    sidebarMenu(
      menuItem(
        "問卷調查",
        tabName = "questnaire",
        icon = icon(name = "user-edit", lib = "font-awesome")
      ),
      menuItem(
        "統計結果",
        tabName = "visualization",
        icon = icon("chart-pie", lib = "font-awesome", verify_fa = TRUE)
      )
    ),
    skin = "light",
    minified = FALSE
  ),
  # 主要頁面
  dashboardBody(
    tabItems(
      source("./questnaire_ui.r", encoding = "utf-8", local = T)$value,
      source("./visualization_ui.r", encoding = "utf-8", local = T)$value
    )
  )
)