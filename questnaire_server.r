observeEvent(input$tku == "否", {
showModal(modalDialog(
    title = "問卷資訊",
    paste("您好，我們是淡江大學統計系二年級的學生：此份問卷的目的是為了解每位受
           測者的人格特質以及透過受測者自己的個人生活習慣，來加以分析此人格測驗
           的價值及可靠度，希望您在填寫時能幫我們多留意題目敘述和依照自己第一時
           間的直覺填答，這對我們的研究會非常有幫助！此份問卷的填答時間會有點冗
           長，還請見諒，但完成MBTI測驗後即可您的查看結果，希望對您有所幫助，
           非常感謝您的協助。")
    )
   )
  },
  once = TRUE)
output$school_faculty <- renderUI({
  req(input$tku)
  if (input$tku == "否") {
    tagList(
      textInput(
        "school",
        "學校"),
      textInput(
        "otherschool_faculty",
        "系所")
      )
  } else {
    pickerInput(
      "tku_faculty",
      "學院",
      choices = c("預設", "文學院", "理學院", "工學院", "商管學院",
                  "外國語文學院", "國際事務學院", "教育學院")
    )
  }
})
output$income_warn <- renderUI({
  req(input$income)
  if (is.na(as.numeric(input$income))) {
    span("請輸入數字(例如:10000)",
      style = "font-weight: bold; color: red")
  } else if (as.numeric(input$income) %% 1 == 0) {
    ""
  }
})
output$expend_warn <- renderUI({
  req(input$expend)
  if (is.na(as.numeric(input$expend))) {
    span("請輸入數字(例如:10000)",
         style = "font-weight: bold; color: red")
  } else if (as.numeric(input$expend) %% 1 == 0) {
    ""
  }
})
output$tku_department <- renderUI({
  req(input$tku_faculty)
  if (input$tku == "是") {
    faculty <- if (input$tku_faculty == "文學院") {
      c("中國文學系", "歷史學系", "資訊與圖書館學系", "大眾傳播學系", "資訊傳播學系")
    } else if (input$tku_faculty == "理學院") {
      c("數學系", "物理學系", "化學系", "尖端材料科學學士學位學程", "理學院應用科學博士班")
    } else if (input$tku_faculty == "工學院") {
      c("建築系", "土木工程學系", "水資源及環境工程學系", "機械與機電工程學系",
        "化學工程與材料工程學系", "電機工程學系", "電機工程學系(人工智慧機器人組)",
        "資訊工程學系", "資訊工程學系(智慧計算應用組)", "資訊工程學系全英語",
        "航太工程學系", "學院機器人博士學位學程", "人工智慧學系")
    } else if (input$tku_faculty == "商管學院") {
      c("國際企業學系", "國際企業學系(國際行銷組)", "財務金融學系",
        "財務金融學系(全球財務管理全英語組)", "風險管理與保險學系",
        "產業經濟學系", "經濟學系", "企業管理學系", "會計學系", "統計學系",
        "統計學數據科學碩士班", "資訊管理學系", "運輸管理學系", "公共行政學系",
        "管理科學學系", "管理科學學系經營管理全英語碩士班")
    } else if (input$tku_faculty == "外國語文學院") {
      c("英文學系", "西班牙語學系", "法國語文學系", "德國語文學系",
        "日本語文學系", "俄國語文學系")
    } else if (input$tku_faculty == "國際事務學院") {
      c("歐洲研究所", "國際事務與戰略研究所", "中國大陸研究所", "外交與國際關係學士班",
        "拉丁美洲研究所", "日本政經研究所")
    } else if (input$tku_faculty == "教育學院") {
      c("教育科技學系", "教育心理與諮商研究所", "教育學院", "教育領到與科技管理學士班",
        "教育與未來設計學系")
    } else {
      ""
    }
    pickerInput(
      "department",
      "系所",
      choices = c("預設", faculty),
      options = list(
        `live-search` = TRUE)
    )
  }
})
output$invest_result <- renderUI({
  if (input$invest == "是") {
    pickerInput(
      inputId = "invest_choices",
      "投資",
      choices = c("股票", "資金", "定存", "期貨", "債券", "外幣", "其他"),
      multiple = TRUE,
      selected = "股票"
    )
  } else {
    ""
  }
})
output$Buttons <- renderUI({ # nolint
  if (!is.null(input$b1) & !is.null(input$b2) &
      !is.null(input$b3) & !is.null(input$b4) &
      !is.null(input$q1) & !is.null(input$q2) &
      !is.null(input$q3) & !is.null(input$q4) &
      !is.null(input$q5) & !is.null(input$q6) &
      !is.null(input$q7) & !is.null(input$q8) &
      !is.null(input$q9) & !is.null(input$q10) &
      !is.null(input$q11) & !is.null(input$q12) &
      !is.null(input$q13) & !is.null(input$q14) &
      !is.null(input$q15) & !is.null(input$q16) &
      !is.null(input$q17) & !is.null(input$q18) &
      !is.null(input$q19) & !is.null(input$q20) &
      !is.null(input$q21) & !is.null(input$q22) &
      !is.null(input$q23) & !is.null(input$q24) &
      !is.null(input$q25) & !is.null(input$q26) &
      !is.null(input$q27) & !is.null(input$q28) &
      !is.null(input$q29) & !is.null(input$q30) &
      !is.null(input$q31) & !is.null(input$q32) &
      !is.null(input$q33) & !is.null(input$q34) &
      !is.null(input$q35) & !is.null(input$q36) &
      !is.null(input$q37) & !is.null(input$q38) &
      !is.null(input$q39) & !is.null(input$q40)
      ) {
       tagList(
         actionButton(
           "SubmitCheck",
           "查看MBTI結果",
           icon = icon("info-circle")),
         # 提交
         actionButton(
          "submit",
          "提交問卷",
          icon = icon("upload")
         )
       )
     } else {
       "仍有題目未完成, 完成以上問題即可查看MBTI人格測驗結果!"
     }
    })
observeEvent(input$SubmitCheck, {
  showModal(modalDialog(
    title = "MBTI人格測驗結果",
    uiOutput("all_result")
  ))
})
observeEvent(input$mbtiinfo, {
  showModal(modalDialog(
    title = "MBTI 人格測驗",
    paste("MBTI(Myers-Briggs Type Indicators)
    是一種迫選型、自我報告式的性格評估測試，用以衡量
    和描述人們在獲取信息、作出決策、對待生活等方面的
    心理活動規律和性格類型。MBTI人格理論的基礎是著名
    心理學家卡爾·榮格關於心理類型的劃分，後由美國的
    心理學家Katharine Cook Briggs 與女兒Isabel
    Briggs Myers研究並加以發展。這種理論可以幫助
    解釋為甚麼不同人對不同事物感興趣，善長不同範疇
    的工作，並且有時不能互相理解。MBTI主要應用於職
    業發展、職業咨詢、團隊建議、婚姻教育等方面，是目
    前國際上應用較廣的人才甄選工具。")
  ))
})
I_E <- reactive({
  a1 <- if (input$q1 == "非常同意") {
        3
      } else if (input$q1 == "同意") {
        1.5
      } else if (input$q1 == "不確定") {
        0
      } else if (input$q1 == "不同意") {
        -1.5
      } else if (input$q1 == "非常不同意") {
        -3
      }
  a2 <- if (input$q2 == "非常同意") {
        -3
      } else if (input$q2 == "同意") {
        -1.5
      } else if (input$q2 == "不確定") {
        0
      } else if (input$q2 == "不同意") {
        1.5
      } else if (input$q2 == "非常不同意") {
        3
      }
  a3 <- if (input$q3 == "非常同意") {
        3
      } else if (input$q3 == "同意") {
        1.5
      } else if (input$q3 == "不確定") {
        0
      } else if (input$q3 == "不同意") {
        -1.5
      } else if (input$q3 == "非常不同意") {
        -3
      }
  a4 <- if (input$q4 == "非常同意") {
        -3
      } else if (input$q4 == "同意") {
        -1.5
      } else if (input$q4 == "不確定") {
        0
      } else if (input$q4 == "不同意") {
        1.5
      } else if (input$q4 == "非常不同意") {
        3
      }
  a5 <- if (input$q5 == "非常同意") {
        -3
      } else if (input$q5 == "同意") {
        -1.5
      } else if (input$q5 == "不確定") {
        0
      } else if (input$q5 == "不同意") {
        1.5
      } else if (input$q5 == "非常不同意") {
        3
      }
  a6 <- if (input$q6 == "非常同意") {
        -3
      } else if (input$q6 == "同意") {
        -1.5
      } else if (input$q6 == "不確定") {
        0
      } else if (input$q6 == "不同意") {
        1.5
      } else if (input$q6 == "非常不同意") {
        3
      }
  a7 <- if (input$q7 == "非常同意") {
        3
      } else if (input$q7 == "同意") {
        1.5
      } else if (input$q7 == "不確定") {
        0
      } else if (input$q7 == "不同意") {
        -1.5
      } else if (input$q7 == "非常不同意") {
        -3
      }
  a8 <- if (input$q8 == "非常同意") {
        -3
      } else if (input$q8 == "同意") {
        -1.5
      } else if (input$q8 == "不確定") {
        0
      } else if (input$q8 == "不同意") {
        -1.5
      } else if (input$q8 == "非常不同意") {
        -3
      }
  a9 <- if (input$q9 == "非常同意") {
        3
      } else if (input$q9 == "同意") {
        1.5
      } else if (input$q9 == "不確定") {
        0
      } else if (input$q9 == "不同意") {
        -1.5
      } else if (input$q9 == "非常不同意") {
        -3
      }
  a10 <- if (input$q10 == "非常同意") {
        3
      } else if (input$q10 == "同意") {
        1.5
      } else if (input$q10 == "不確定") {
        0
      } else if (input$q10 == "不同意") {
        -1.5
      } else if (input$q10 == "非常不同意") {
        -3
      }
    a1 + a2 + a3 + a4 + a5 + a6 + a7 + a8 + a9 + a10
})
N_S <- reactive({
  a11 <- if (input$q11 == "非常同意") {
        3
      } else if (input$q11 == "同意") {
        1.5
      } else if (input$q11 == "不確定") {
        0
      } else if (input$q11 == "不同意") {
        -1.5
      } else if (input$q11 == "非常不同意") {
        -3
      }
  a12 <- if (input$q12 == "非常同意") {
        -3
      } else if (input$q12 == "同意") {
        -1.5
      } else if (input$q12 == "不確定") {
        0
      } else if (input$q12 == "不同意") {
        1.5
      } else if (input$q12 == "非常不同意") {
        3
      }
  a13 <- if (input$q13 == "非常同意") {
        -3
      } else if (input$q13 == "同意") {
        -1.5
      } else if (input$q13 == "不確定") {
        0
      } else if (input$q13 == "不同意") {
        1.5
      } else if (input$q13 == "非常不同意") {
        3
      }
  a14 <- if (input$q14 == "非常同意") {
        -3
      } else if (input$q14 == "同意") {
        -1.5
      } else if (input$q14 == "不確定") {
        0
      } else if (input$q14 == "不同意") {
        1.5
      } else if (input$q14 == "非常不同意") {
        3
      }
  a15 <- if (input$q15 == "非常同意") {
        -3
      } else if (input$q15 == "同意") {
        -1.5
      } else if (input$q15 == "不確定") {
        0
      } else if (input$q15 == "不同意") {
        1.5
      } else if (input$q15 == "非常不同意") {
        3
      }
  a16 <- if (input$q16 == "非常同意") {
        3
      } else if (input$q16 == "同意") {
        1.5
      } else if (input$q16 == "不確定") {
        0
      } else if (input$q16 == "不同意") {
        -1.5
      } else if (input$q16 == "非常不同意") {
        -3
      }
  a17 <- if (input$q17 == "非常同意") {
        3
      } else if (input$q17 == "同意") {
        1.5
      } else if (input$q17 == "不確定") {
        0
      } else if (input$q17 == "不同意") {
        -1.5
      } else if (input$q17 == "非常不同意") {
        -3
      }
  a18 <- if (input$q18 == "非常同意") {
        3
      } else if (input$q18 == "同意") {
        1.5
      } else if (input$q18 == "不確定") {
        0
      } else if (input$q18 == "不同意") {
        1.5
      } else if (input$q18 == "非常不同意") {
        3
      }
  a19 <- if (input$q19 == "非常同意") {
        -3
      } else if (input$q19 == "同意") {
        -1.5
      } else if (input$q19 == "不確定") {
        0
      } else if (input$q19 == "不同意") {
        1.5
      } else if (input$q19 == "非常不同意") {
        3
      }
  a20 <- if (input$q20 == "非常同意") {
        3
      } else if (input$q20 == "同意") {
        1.5
      } else if (input$q20 == "不確定") {
        0
      } else if (input$q20 == "不同意") {
        -1.5
      } else if (input$q20 == "非常不同意") {
        -3
      }
    a11 + a12 + a13 + a14 + a15 + a16 + a17 + a18 + a19 + a20
})
J_P <- reactive({
  a21 <- if (input$q21 == "非常同意") {
        3
      } else if (input$q21 == "同意") {
        1.5
      } else if (input$q21 == "不確定") {
        0
      } else if (input$q21 == "不同意") {
        -1.5
      } else if (input$q21 == "非常不同意") {
        -3
      }
  a22 <- if (input$q22 == "非常同意") {
        3
      } else if (input$q22 == "同意") {
        1.5
      } else if (input$q22 == "不確定") {
        0
      } else if (input$q22 == "不同意") {
        -1.5
      } else if (input$q22 == "非常不同意") {
        -3
      }
  a23 <- if (input$q23 == "非常同意") {
        3
      } else if (input$q23 == "同意") {
        1.5
      } else if (input$q23 == "不確定") {
        0
      } else if (input$q23 == "不同意") {
        -1.5
      } else if (input$q23 == "非常不同意") {
        -3
      }
  a24 <- if (input$q24 == "非常同意") {
        -3
      } else if (input$q24 == "同意") {
        -1.5
      } else if (input$q24 == "不確定") {
        0
      } else if (input$q24 == "不同意") {
        1.5
      } else if (input$q24 == "非常不同意") {
        3
      }
  a25 <- if (input$q25 == "非常同意") {
        3
      } else if (input$q25 == "同意") {
        1.5
      } else if (input$q25 == "不確定") {
        0
      } else if (input$q25 == "不同意") {
        -1.5
      } else if (input$q25 == "非常不同意") {
        -3
      }
  a26 <- if (input$q26 == "非常同意") {
        -3
      } else if (input$q26 == "同意") {
        -1.5
      } else if (input$q26 == "不確定") {
        0
      } else if (input$q26 == "不同意") {
        1.5
      } else if (input$q26 == "非常不同意") {
        3
      }
  a27 <- if (input$q27 == "非常同意") {
        -3
      } else if (input$q27 == "同意") {
        -1.5
      } else if (input$q27 == "不確定") {
        0
      } else if (input$q27 == "不同意") {
        1.5
      } else if (input$q27 == "非常不同意") {
        3
      }
  a28 <- if (input$q28 == "非常同意") {
        3
      } else if (input$q28 == "同意") {
        1.5
      } else if (input$q28 == "不確定") {
        0
      } else if (input$q28 == "不同意") {
        1.5
      } else if (input$q28 == "非常不同意") {
        3
      }
  a29 <- if (input$q29 == "非常同意") {
        -3
      } else if (input$q29 == "同意") {
        -1.5
      } else if (input$q29 == "不確定") {
        0
      } else if (input$q29 == "不同意") {
        1.5
      } else if (input$q29 == "非常不同意") {
        3
      }
  a30 <- if (input$q30 == "非常同意") {
        -3
      } else if (input$q30 == "同意") {
        -1.5
      } else if (input$q30 == "不確定") {
        0
      } else if (input$q30 == "不同意") {
        1.5
      } else if (input$q30 == "非常不同意") {
        3
      }
    a21 + a22 + a23 + a24 + a25 + a26 + a27 + a28 + a29 + a30
})
T_F <- reactive({
  a31 <- if (input$q31 == "非常同意") {
        3
      } else if (input$q31 == "同意") {
        1.5
      } else if (input$q31 == "不確定") {
        0
      } else if (input$q31 == "不同意") {
        -1.5
      } else if (input$q31 == "非常不同意") {
        -3
      }
  a32 <- if (input$q32 == "非常同意") {
        -3
      } else if (input$q32 == "同意") {
        -1.5
      } else if (input$q32 == "不確定") {
        0
      } else if (input$q32 == "不同意") {
        1.5
      } else if (input$q32 == "非常不同意") {
        3
      }
  a33 <- if (input$q33 == "非常同意") {
        3
      } else if (input$q33 == "同意") {
        1.5
      } else if (input$q33 == "不確定") {
        0
      } else if (input$q33 == "不同意") {
        -1.5
      } else if (input$q33 == "非常不同意") {
        -3
      }
  a34 <- if (input$q34 == "非常同意") {
        3
      } else if (input$q34 == "同意") {
        1.5
      } else if (input$q34 == "不確定") {
        0
      } else if (input$q34 == "不同意") {
        -1.5
      } else if (input$q34 == "非常不同意") {
        -3
      }
  a35 <- if (input$q35 == "非常同意") {
        3
      } else if (input$q35 == "同意") {
        1.5
      } else if (input$q35 == "不確定") {
        0
      } else if (input$q35 == "不同意") {
        -1.5
      } else if (input$q35 == "非常不同意") {
        -3
      }
  a36 <- if (input$q36 == "非常同意") {
        -3
      } else if (input$q36 == "同意") {
        -1.5
      } else if (input$q36 == "不確定") {
        0
      } else if (input$q36 == "不同意") {
        1.5
      } else if (input$q36 == "非常不同意") {
        3
      }
  a37 <- if (input$q37 == "非常同意") {
        -3
      } else if (input$q37 == "同意") {
        -1.5
      } else if (input$q37 == "不確定") {
        0
      } else if (input$q37 == "不同意") {
        1.5
      } else if (input$q37 == "非常不同意") {
        3
      }
  a38 <- if (input$q38 == "非常同意") {
        3
      } else if (input$q38 == "同意") {
        1.5
      } else if (input$q38 == "不確定") {
        0
      } else if (input$q38 == "不同意") {
        1.5
      } else if (input$q38 == "非常不同意") {
        3
      }
  a39 <- if (input$q39 == "非常同意") {
        -3
      } else if (input$q39 == "同意") {
        -1.5
      } else if (input$q39 == "不確定") {
        0
      } else if (input$q39 == "不同意") {
        1.5
      } else if (input$q39 == "非常不同意") {
        3
      }
  a40 <- if (input$q40 == "非常同意") {
        -3
      } else if (input$q40 == "同意") {
        -1.5
      } else if (input$q40 == "不確定") {
        0
      } else if (input$q40 == "不同意") {
        1.5
      } else if (input$q40 == "非常不同意") {
        3
      }
    a31 + a32 + a33 + a34 + a35 + a36 + a37 + a38 + a39 + a40
})
output$all_result <- renderUI({
  IE <- ifelse(I_E() < 0, "E", "I")
  NS <- ifelse(N_S() < 0, "S", "N")
  JP <- ifelse(J_P() < 0, "P", "J")
  TF <- ifelse(T_F() < 0, "F", "T")
  if (IE == "I") {
    if (NS == "N") {
      if (TF == "T") {
        if (JP == "J") {
          "INTJ:你是屬於「建築師」人格，
          擅長思考和推理的你，總是能夠站在不同的視角觀
          察事物，也有自己獨特的見解，但是很常圍繞於自
          己的世界，而忽略了他人的情緒，因此經常給別人
          疏遠的感覺。"
        } else {
          "INTP:你是屬於「邏輯學家」人格，
          你擁有強大的邏輯組織能力，非常擅長思考和推理
          ，INTP的人非常理性，會依靠邏輯和客觀事實來做
          判斷，容易讓身邊的人認為你不懂的人情世故，自
          己也鮮少為了情感問題而煩惱。"
        }
      } else {
        if (JP == "J") {
          "INFJ:你是屬於「提倡者」人格，
          你心思細膩懂得察言觀色，能包容別人的壞情緒，
          也擁有敏銳的直覺，容易看破別人的謊言，但又十
          分在意別人對自己的看法，所以時常以別人為先，
          而忽略自己的感受。"
        } else {
          "INFP:你是屬於「調停者」人格，
          這類的人性格溫柔貼心，做事的原則並非根據邏輯
          ，而是以情感、道德及善良為準則，所以容易讓別
          人產生好感，可是你的思路卻過於理想、不切實際
          ，而容易忽略現實面。"
        }
      }
    } else {
      if (TF == "T") {
        if (JP == "J") {
          "ISTJ:你是屬於「物流師」人格，
          你們理性、正直、成熟且務實，非常受到紀律團隊
          及組織的青睞，不喜歡做無謂的假設，但冷漠人格
          的你，會讓人覺得你十分有距離感、不近人情，且
          過於保守，不怎麼懂得變通。"
        } else {
          "ISFP:你是屬於「探險家」人格，
          ISFP的人總覺得自己是活在一個感性的世界，音樂
          、電影、書籍等，都容易引起你們的共鳴，是個活
          在當下的人，喜歡即時行樂，但你們總對未來缺乏
          規劃，難以用客觀理性的方式來處理問題。"
        }
      } else {
        if (JP == "J") {
          "ISFJ:你是屬於「守衛者」人格，
          你們善良、樂善好施、喜歡無私奉獻及保護家人，
          是很好的傾訴對象；而生活方面，會堅持遵守自己
          的規則，維持自己的傳統，但時常讓身邊的人認為
          你們守舊，不怎麼懂得變通。"
        } else {
          "ISTP:你是屬於「鑑賞家」人格，
          你們非常喜歡好動又充滿好奇心，愛好自己動手解
          決問題，看似內向的你們，內心卻充滿了許多想法
          ，凡事都要親自體驗實踐，但是做事時常偏向「三
          分鐘熱度」，容易分心，不能專注於同一件事上。"
        }
      }
    }
  } else {
    if (NS == "N") {
      if (TF == "T") {
        if (JP == "J") {
          "ENTJ:你是屬於「指揮官」型人格，天生的領導
          者，散發魅力與自信。你的幸福來自成功時的喜悅
          ，也很善於發現別人的才能。有效率、充滿活力、
          自信、意志堅定又充滿魅力是你的優點，不過你固
          執、傲慢又沒有耐心，有時候會讓共事的人覺得很
          累。"
        } else {
          "ENTP:你是屬於「辯論家 」型人格，
          知識豐富的你，擁有敏銳的幽默感，喜歡腦內瘋狂
          的想事情，且充滿野心。總是能創造新穎的想法，
          對別人來說極具魅力，不過因為太過直接，很容易
          觸碰到別人的底線。此外，你厭惡重複且乏味的工
          作，更不喜歡別人拐彎抹角。
"
        }
      } else {
        if (JP == "J") {
          "ENFJ:你是屬於「教育家」型人格，
          你是天生的領導者，充滿激情，適合從事政客、教
          練或是老師，善於幫助或啟發他人取得成就造福世
          界。為人善良、懂得體諒他人的你，因為太無私常
          吃虧，有時搖擺不定，不安全感很重。"
        } else {
          "ENFP:你是屬於「競選者」人格，
          在聚會場合，你常常會成為焦點，觀察力強、善於
          溝通，因此非常受到歡迎，是真正富有自由精神的
          人。不過，思慮過度，又太太情緒化，常注意力無
          法集中。"
        }
      }
    } else {
      if (TF == "T") {
        if (JP == "J") {
          "ENFP:你是屬於「競選者」人格，
          在聚會場合，你常常會成為焦點，觀察力強、善於
          溝通，因此非常受到歡迎，是真正富有自由精神的
          人。不過，思慮過度，又太太情緒化，常注意力無
          法集中。"
        } else {
          "ESTP: 你是屬於「企業家」型人格，
          愛冒險、說走就走，有著超強的實踐力！不過，這
          使你時常難以適應團體生活中井然有序的組織，洞
          察力超強，再細小的變化都逃不過你的法眼。叛逆
          、沒耐心、少了大局觀則是你的劣勢。"
        }
      } else {
        if (JP == "J") {
          "ESFJ:你是屬於「執政官」型人格，
          責任感強、對朋友忠誠且時刻了解朋友的動向，你
          很受到大家的歡迎，且熱愛在鎂光燈焦點下帶領大
          家走向勝利。在求學過程中常常是重要的領導者。
          不過，你太在意社會地位、過度在意批評，且不善
          於臨場發揮。"
        } else {
          "ESFP: 你是屬於「表演者」型人格，
          熱愛表演，喜歡沈醉在興奮的狀態！沒錯，你就是
          表演者型的人！你會毫不吝惜自己的時間與精力為
          別人打氣，大膽、有原創性，實踐能力強、觀察力
          也強。不過，你無法制定長期計畫，更容易感到無
          聊，常常無法集中注意力。"
        }
      }
    }
  }
})