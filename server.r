# Server

function(input, output) {

  # page 01
  source(
    "./questnaire_server.r",
    encoding = "utf-8",
    local = T)
  # page 02
  source(
    "./visualization_server.r",
    encoding = "utf-8",
    local = T)
  save_data_gsheets <- function(data) {
    sheet_append(
      data = as.data.frame(t(data)),
      ss = "1JEpfmnb4z-KnNh90AGI8H5u256k7DGFsD53P1sKcIBc",
      sheet = "Sheet1")
  }
  result <- reactive({
    IE <- ifelse(I_E() < 0, "E", "I")
    NS <- ifelse(N_S() < 0, "S", "N")
    JP <- ifelse(J_P() < 0, "P", "J")
    TF <- ifelse(T_F() < 0, "F", "T")
    paste0(c(IE, NS, TF, JP))
  })
  invest_result <- reactive({
    if (input$invest == "否") {
      "無"
    } else {
      r1 <- input$invest_choices[1]
      r2 <- input$invest_choices[2]
      r3 <- input$invest_choices[3]
      r4 <- input$invest_choices[4]
      r5 <- input$invest_choices[5]
      r6 <- input$invest_choices[6]
      r7 <- input$invest_choices[7]
      r8 <- input$invest_choices[8]
      result <- paste(r1, r2, r3, r4, r5, r6, r7, r8, sep = " ")
      gsub("NA", replacement = "", x = result)
    }
  })
  otherschool <- reactive({
    if (is.null(input$school)) {
      "本校"
    } else {
      input$school
    }
  })
  income <- reactive({
    if (is.null(input$income) | is.na(as.numeric(input$income))) {
      'NA'
    } else {
      input$income
    }
  })
  expend <- reactive({
    if (is.null(input$expend) | is.na(as.numeric(input$expend))) {
      'NA'
    } else {
      input$expend
    }
  })
  otherschoolfaculty <- reactive({
    if (is.null(input$otherschool_faculty)) {
      "本校系"
    } else {
      input$otherschool_faculty
    }
  })
  email <- reactive({
    if (!is.null(input$email)) {
      input$email
    } else {
      "無"
    }
  })
  formData <- reactive({
    data <- data.frame(
      c(as.character(Sys.time()),
      input$q1, input$q2, input$q3, input$q4, input$q5,
      input$q6, input$q7, input$q8, input$q9, input$q10,
      input$q11, input$q12, input$q13, input$q14, input$q15,
      input$q16, input$q17, input$q18, input$q19, input$q20,
      input$q21, input$q22, input$q23, input$q24, input$q25,
      input$q26, input$q27, input$q28, input$q29, input$q30,
      input$q31, input$q32, input$q33, input$q34, input$q35,
      input$q36, input$q37, input$q38, input$q39, input$q40,
      result(), input$b1, input$b2, input$b3, input$b4,
      income(), expend(), input$deposit, input$deposit_percent,
      input$invest, invest_result(), input$advice, input$percent,
      input$extravagant, input$equality,
      input$sex, input$grade, input$tku, input$tku_faculty,
      input$department, otherschool(), otherschoolfaculty(),
      email()
      )
    )
  })
  # When the Submit button is clicked, save the form data
  observeEvent(input$SubmitCheck, {
    save_data_gsheets(formData())
  })
  load_data_gsheets <- function() {
    read_sheet(ss = "1JEpfmnb4z-KnNh90AGI8H5u256k7DGFsD53P1sKcIBc")
  }
  # action to take when submit button is pressed
  observeEvent(input$submit, {
    showModal(modalDialog(
      title = "感謝填答",
      paste("謝謝您的回答，已可關閉網站")
      )
    )
  })
  observeEvent(input$submit, {
    refresh()
  })
}