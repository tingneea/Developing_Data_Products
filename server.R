library(shiny)
shinyServer(
  function(input, output){
    output$LoanAmount <- renderText({input$LoanAmount})
    output$MonthlyRepayment <- renderText({ CalculateMonthlyRepayment(input$LoanAmount, input$InterestRate, input$Tenure) })
    output$TotalPayment <- renderText({ CalculateTotalPayment(input$LoanAmount, input$InterestRate, input$Tenure) })
    output$TotalInterestPay <- renderText({ CalculateInterest(input$LoanAmount, input$InterestRate, input$Tenure) })
  }
)

CalculateMonthlyRepayment <- function (LoanAmount, InterestRate, Tenure)
{
  IR <- InterestRate/100
  TenureInMonth <- Tenure * 12 
  result <- (LoanAmount*(IR/12))/(1 - ( 1 + IR / 12 )^-TenureInMonth)
  return(round(result, digits = 2))
}

CalculateTotalPayment <- function (LoanAmount, InterestRate, Tenure)
{
  IR <- InterestRate/100
  TenureInMonth <- Tenure * 12 
  MonthlyPayment <- (LoanAmount*(IR/12))/(1 - ( 1 + IR / 12 )^-TenureInMonth)
  result <- MonthlyPayment * TenureInMonth
  return(round(result, digits = 0))
}

CalculateInterest <- function (LoanAmount, InterestRate, Tenure)
{
  IR <- InterestRate/100
  TenureInMonth <- Tenure * 12 
  MonthlyPayment <- (LoanAmount*(IR/12))/(1 - ( 1 + IR / 12 )^-TenureInMonth)
  TotalPayment <- MonthlyPayment * TenureInMonth
  result <- TotalPayment - LoanAmount
  return(round(result, digits = 0))
}
