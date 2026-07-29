# Deliverable 2: Mock bank application
require 'time'

def check_balance(pin, balance, history)
  attemps = 3
  
  while attemps > 0
    print "PIN: "
    input_pin = gets.chomp.to_i

    if input_pin == pin
      puts "\n///////////////////////////////"
      puts "//////  Balance Check  ////////"
      puts "///////////////////////////////\n"
      puts "Current Balance: P#{ balance }"
      print "[Enter] - exit"
      action = gets.chomp.downcase
      track_history(history, "User - Checked balance")
      break
    end

    puts "Wrong PIN. Try again attemps: #{ attemps }"
    track_history(history, "User - attempted to check balance. Failed wrong pin")
    attemps -= 1
  end
end

def withdraw (pin, balance, history)
  puts "\n///////////////////////////////"
  puts "/////////  Withdraw  //////////"
  puts "///////////////////////////////\n"
  print "Enter Amount: "
  amount = gets.chomp.to_f

  print "PIN: "
  input_pin = gets.chomp.to_i

  if input_pin == pin

    if amount > balance
      print "[Enter] - Insufficient Balance"
      action = gets.chomp.downcase
      track_history(history, "User - attempted to withdraw. Insufficient balance")
      return balance
    end


    print "[Enter] - Transaction success."
    action = gets.chomp.downcase
    track_history(history, "User - Cashed out(Withdraw) #{ amount }")
    balance - amount
  else 
    print "[Enter] - Transaction failed. wrong pin"
    action = gets.chomp.downcase
    track_history(history, "User - attempted to withdraw. Failed wrong pin")
    balance
  end
end

def deposit (pin, balance, history)
  puts "\n///////////////////////////////"
  puts "/////////  Deposit  ///////////"
  puts "///////////////////////////////\n"
  print "Enter Amount: "
  amount = gets.chomp.to_f

  print "PIN: "
  input_pin = gets.chomp.to_i

  if input_pin == pin
    print "[Enter] - Transaction success."
    action = gets.chomp.downcase
    track_history(history, "User - Cashed in(Deposit) #{ amount }")
    balance + amount
  else 
    print "[Enter] - Transaction failed. wrong pin"
    action = gets.chomp.downcase
    track_history(history, "User - attempted to deposit. Failed wrong pin")
    balance
  end
end

def track_history(history, action)
  history.push(Time.now.to_s + " " + action)
end

def view_history(history)
  puts "\n///////////////////////////////"
  puts "/////////  History  ///////////"
  puts "///////////////////////////////\n"
  history.each do |action|
    puts action
  end
end

balance = 0.00
PIN = 1234
history = []

loop do
  puts "\n///////////////////////////////"
  puts "/////  Mock ATM Machine  //////"
  puts "///////////////////////////////\n"

  puts "[Check] - Check your balance"
  puts "[Withdraw] - Withdraw cash"
  puts "[Deposit] - Deposit cash"
  puts "[History] - View History"
  puts "[exit] - End Transaction"

  print "action: "
  action = gets.chomp.downcase

  case action
    when "check" then check_balance(PIN, balance, history)
    when "withdraw" then balance = withdraw(PIN, balance, history)
    when "deposit" then balance = deposit(PIN, balance, history)
    when "history" then view_history(history)
    when "exit" then exit
  end
end

