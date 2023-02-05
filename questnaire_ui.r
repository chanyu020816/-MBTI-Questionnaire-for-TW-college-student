# 問卷分頁
tabItem(
 tabName = "questnaire",
 fluidRow(
   box(
     # 基本資料問卷部份
     title = span("基本資料", style = "font-weight: bold; font-size: 20px"),
     width = 4,
     headerBorder = FALSE,
     icon = icon("address-card"),
     # 性別
     radioGroupButtons(
       inputId = "sex",
       label = "性別",
       choices = c("女", "男", "其他"),
       justified = TRUE,
       checkIcon = list(
         yes = icon("ok", lib = "glyphicon"))
     ),
     # 學校
     radioGroupButtons(
      inputId = "tku",
      label = "是否為淡江大學",
      choices = c("是", "否"),
      justified = TRUE,
      checkIcon = list(
        yes = icon("ok", lib = "glyphicon"))
      ),
     # 學校院系
     uiOutput("school_faculty"),
     # 淡江科系選擇
     uiOutput("tku_department"),
     # 系級
     pickerInput(
       "grade", "系級",
       choices = c("一年級", "二年級", "三年級", "四年級",
                   "五年級", "六年級", "七年級", "八年級")
     ),
     textInput(
       "income", "月平均收入(含生活費、薪資、投資等)"
     ),
     uiOutput("income_warn"),
     textInput(
       "expend", "月平均支出"
     ),
     uiOutput("expend_warn"),
     radioButtons(
       "deposit", "是否有儲蓄行為",
       choices = c("是", "否")
     ),
     sliderInput(
       "deposit_percent", "儲蓄比例",
       min = 0, max = 100,
       value = 0
     ),
     radioButtons(
       "invest", "是否有投資行為",
       choices = c("是", "否"),
       selected = "是"
     ),
     uiOutput("invest_result"),
     radioButtons(
       "advice",  "假設投資時，是否會參考別人的方式進而影響自己行為",
       choices = c("是", "否"),
       selected = "是"
     ),
     sliderInput(
       "percent", "當你有個想買的商品，但在預算有限的情況下，當物品超過你總預算的百分之多少後你將不願意購買此商品？",
       min = 0, max = 100,
       value = 0
     ),
     radioButtons(
       "extravagant", "是否會購買不必要的商品(如奢侈品)",
       choices = c("是", "否"),
       selected = "是"
     ),
     radioButtons(
       "equality", "是否注重性價比",
       choices = c("是", "否"),
       selected = "是"
     ),
     "請繼續完成後續MBTI測驗"
   ),
   # MBTI 問卷部份
   box(
     width = 8,
     headerBorder = FALSE,
     icon = icon("edit"),
     title = span("MBTI 人格測驗", style = "font-weight: bold; font-size: 23px"),
     column(12, align = "right", id = "button",
            actionButton("mbtiinfo", "MBTI人格測驗簡介",
            icon = icon("question-circle"))),
     bs4Dash::tabsetPanel(
       selected = as.character(textOutput("page")),
       tabPanel("1 - 10 題",
         tagList(
           radioGroupButtons(
            inputId = "q16",
            label = "你的頭腦常塞滿未經探索的想法和計畫?:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q20",
            label = "你總是對非「常規」和「涵義不明」的東西感興趣:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
           radioGroupButtons(
             inputId = "q1",
             label = "你發現在向別人做自我介紹時會思考許久:",
             choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
             selected = "0",
             justified = TRUE,
             checkIcon = list(
               yes = icon("ok", lib = "glyphicon"))
             ),
           radioGroupButtons(
             inputId = "q2",
             label = "你通常較有活力和動力:",
             justified = TRUE,
             choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
             selected = "0",
             checkIcon = list(
               yes = icon("ok", lib = "glyphicon"))
           ),
           radioGroupButtons(
             inputId = "q6",
             label = "在社交場合，你經常是主動的那一方:",
             justified = TRUE,
             choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
             selected = "0",
             checkIcon = list(
               yes = icon("ok", lib = "glyphicon"))
           ),
           radioGroupButtons(
             inputId = "q7",
             label = "你是個在陌生地方會較為拘謹的人:",
             justified = TRUE,
             choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
             selected = "0",
             checkIcon = list(
               yes = icon("ok", lib = "glyphicon"))
           ),
           radioGroupButtons(
             inputId = "q8",
             label = "在與一群人共度時光之後，你感到更有活力:",
             justified = TRUE,
             choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
             selected = "0",
             checkIcon = list(
               yes = icon("ok", lib = "glyphicon"))
           ),
           radioGroupButtons(
             inputId = "q9",
             label = "面對很多人發言，你通常覺得難以放鬆:",
             justified = TRUE,
             choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
             selected = "0",
             checkIcon = list(
               yes = icon("ok", lib = "glyphicon"))
           ),
          radioGroupButtons(
            inputId = "q32",
            label = "對你來說，不讓別人感到不愉快比贏得辯論重要:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q12",
            label = "你很少出於純粹的好奇心做什麼事:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
           "請選擇上方題目分頁, 繼續進行11-20題的答題!"
         )
       ),
       tabPanel("11 - 20 題",
        tagList(
          radioGroupButtons(
            inputId = "q11",
            label = "你經常陷入沉思，忽視或忘記了周圍:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q17",
            label = "你經常花時間探索不現實、不可行，但會觸發靈感的想法?:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q33",
            label = "你常常很難感受到別人的心情:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q34",
            label = "在與人討論時，你更看重事實，而不是他人敏感的情緒:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
           radioGroupButtons(
             inputId = "q10",
             label = "如果房間裡很多人，會避免處於中心位置:",
             justified = TRUE,
             choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
             selected = "0",
             checkIcon = list(
               yes = icon("ok", lib = "glyphicon"))
           ),
          radioGroupButtons(
            inputId = "q15",
            label = "你的夢經常是有關真實世界和事件的:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q38",
            label = "在做重要決定時，我會更看重事情是否符合邏輯:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q23",
            label = "你計畫旅行時，是否會按照規劃的時間及行程:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q19",
            label = "一般說來，你更多依賴自己的經驗而非想像力:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
           radioGroupButtons(
             inputId = "q3",
             label = "你介意成為別人注意的中心:",
             justified = TRUE,
             choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
             selected = "0",
             checkIcon = list(
               yes = icon("ok", lib = "glyphicon"))
           ),
          "請選擇上方題目分頁, 繼續進行21-30題的答題!"
        )
       ),
       tabPanel("21 - 30 題",
        tagList(
          radioGroupButtons(
            inputId = "q21",
            label = "對你來說，有條理比能適應更重要:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q22",
            label = "你生活的地方和工作環境都很整潔:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
           radioGroupButtons(
             inputId = "q4",
             label = "在新環境中，你沒多久就開始參與社交活動:",
             justified = TRUE,
             choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
             selected = "0",
             checkIcon = list(
               yes = icon("ok", lib = "glyphicon"))
           ),
           radioGroupButtons(
             inputId = "q5",
             label = "你喜歡參加需要盛裝或化妝出席的社交活動:",
             justified = TRUE,
             choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
             selected = "0",
             checkIcon = list(
               yes = icon("ok", lib = "glyphicon"))
           ),
          radioGroupButtons(
            inputId = "q13",
            label = "你認為自己更實際，而不是更有創造力:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q14",
            label = "你很少沉溺於幻想:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q40",
            label = "你認為，自己被別人喜歡比擁有權勢更值得:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q26",
            label = "你更多是天生的即興表演者，而不是周密計畫者:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q27",
            label = "你更願意隨機應變，而不是花時間制定詳細的計畫:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q28",
            label = "在制定個人時間表並堅持執行這方面，你沒什麼困難:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
        ),
        "請選擇上方題目分頁, 繼續進行31-40題的答題!"
       ),
       tabPanel("31 - 40 題",
        tagList(
          radioGroupButtons(
            inputId = "q29",
            label = "你時常把東西放錯:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q37",
            label = "如果你是企業主，你會覺得解雇忠誠但績效不佳的員工是件難事:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q25",
            label = "每個項目最關鍵的是能夠制定和遵守計畫:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q31",
            label = "你覺得自己比別人優越:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q35",
            label = "你很少擔心你的行為對別人有影響:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q36",
            label = "為人父母，你更願意看到孩子成為善良的人，而非聰明人:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q39",
            label = "如果你的朋友為什麼事傷心，你更可能在情感上支持他，而非向他建議處理問題的方法:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q24",
            label = "你的做事風格較為隨性，而不是採用有系統有組織的方法:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q18",
            label = "你經常思考人類存在的意義?:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          ),
          radioGroupButtons(
            inputId = "q30",
            label = "你總愛拖延，直到沒有足夠的時間做每件事:",
            justified = TRUE,
            choices = c("非常同意", "同意", "不確定", "不同意", "非常不同意"),
            selected = "0",
            checkIcon = list(
              yes = icon("ok", lib = "glyphicon"))
          )
          ),
          "在查看結果前請確認是否每題都已回答！",
         ),
         tabPanel("結果",
          tagList(
             radioButtons(
               inputId = "b1",
               label = "1.你認為你是＿＿的人：",
               choices = c("外向" = "E", "內向" = "I"),
               selected = "0"
             ),
             radioButtons(
               inputId = "b2",
               label = "2.當你在做當你在做決定時，你重視：",
               choices = c("邏輯邏輯與公平" = "T", "感情與和睦" = "F"),
               selected = "0"
             ),
             radioButtons(
               inputId = "b3",
               label = "3.你在工作時比較頃向：",
               choices = c("先工作再玩樂" = "J", "先玩樂再工作" = "P"),
               selected = "0"
             ),
             radioButtons(
               inputId = "b4",
               label = "4.你在學習新事物時，你喜歡：",
               choices = c("了解其背後的理論含義" = "N", "注重在實際用途層面" = "S"),
               selected = "0"
             ),
             textInput("email", "若要參與抽獎請留下電子郵件"),
             uiOutput("test_1"),
            column(12, align = "right", id = "buttons",
             # 問卷資訊顯示
             uiOutput("Buttons"),
             uiOutput("listtest")
           )
         )
       )
     )
   )
 )
)