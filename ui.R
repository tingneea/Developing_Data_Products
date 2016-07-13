library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Personal Loan Repayment Calculator"),
  sidebarPanel(
    numericInput('LoanAmount', 'Loan Amount (MYR)', 15000, min=1000, step=10000),
    numericInput('InterestRate', 'Interest Rate Per Annum', 3.89, min=0, step =1),
    numericInput('Tenure', 'Loan Tenure (years)', 5, min=3)
    
  ),
  mainPanel(
    h3('Loan Amount (MYR)'),
    strong(h4(textOutput("LoanAmount"))),
    h3('Monthly Repayment (MYR)'),
    strong(h4(textOutput("MonthlyRepayment"))),
    h3('Total Payment (MYR)'),
    strong(h4(textOutput("TotalPayment"))),
    h3('Total Interest To Pay (MYR)'),
    strong(h4(textOutput("TotalInterestPay"))),
    
    br(),
    code("Instructions"),
    helpText("This application is a personal loan calculator to calculate monthly repayment base on bank given interest rate")
    
  )
))