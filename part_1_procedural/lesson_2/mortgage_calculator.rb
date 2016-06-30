def prompt(message)
  puts "=> " + message
end

def valid?(num)
  num.to_f != 0.0
end

prompt("Hello and welcome to the mortgage calculator.")
prompt("We'll need some information from you to make the calculation:")

loop do
  prompt("What is the loan amount you require?")
  loan_amount = ''
  loop do
    loan_amount = gets.chomp.to_f
    if valid?(loan_amount)
      break
    else
      prompt("Something looks wrong, please try again.")
    end
  end

  prompt("Thank you. What is the APR you will be paying during this loan?")
  loan_apr = ''
  loop do
    loan_apr = gets.chomp.to_f
    if valid?(loan_apr)
      break
    else
      prompt("Something looks wrong, please try again.")
    end
  end

  prompt("Great! Now just one last thing. What is the duration of the loan?")
  loan_duration_years = ''
  loop do
    loan_duration_years = gets.chomp.to_f
    if valid?(loan_duration_years)
      break
    else
      prompt("Something looks wrong, please try again.")
    end
  end

  monthly_interest_rate = loan_apr / 12 / 100
  loan_duration_months = loan_duration_years * 12

  monthly_payment = loan_amount * (monthly_interest_rate * (1 + monthly_interest_rate)**loan_duration_months) / ((1 + monthly_interest_rate)**loan_duration_months - 1)

  loan_total_cost = monthly_payment * loan_duration_months
  total_interest = loan_total_cost - loan_amount

  prompt("Thank you, we have all the information we need. Please see the calculation below...")
  puts("--------------------------------------------------------------------")
  prompt("You will pay £#{monthly_payment.round(2)} per month")
  prompt("You will pay a total of £#{loan_total_cost.round(2)} for the duration of the loan")
  prompt("The total interest paid over the duration of the loan is £#{total_interest.round(2)}")
  puts("--------------------------------------------------------------------")
  prompt("Do you need to make additional calculations? If so type 'yes' and hit enter, if not simply press enter to end the session")

  continue = gets.chomp
  if continue.downcase != 'yes'
    break
  end
end
puts("--------------------------------------------------------------------")
prompt("Thank you for using the mortgage calculator, goodbye.")
