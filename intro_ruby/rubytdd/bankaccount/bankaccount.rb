class BankAccount
    # attr_accessor :quantity
    attr_reader :checking, :savings, :account_num
    @@quantity = 0
    def initialize
        @checking = 0
        @savings = 0
        @account_num = generate_account_number
        @interest_rate = generate_int
        @@quantity=+1
    end
    def display_bankaccount
        puts @@quantity
        self
    end
    def display_checking
        puts "Checking Account Balance:" 
        puts @checking
        @checking
    end
    def display_savings
        puts "Savings Account Balance: "
        puts @savings.to_s
        @savings
    end
    def deposit_checking amount
        @checking += amount
        self
    end
    def deposit_savings amount
        @savings += amount
        self
    end
    def withdraw_checking amount
        if @checking > amount
            @checking -= amount
        else
            raise "Insufficient funds"
        end
        @checking
    end
    def withdraw_savings amount
        @savings -= amount
        self
    end
    def total
        puts "total money in the bank:" 
        puts @checking + @savings
        @checking + @savings
    end
    def account_information
        puts "Account number: #{@account_num}"
        puts "Total Money: #{@checking + @savings}"
        puts "Checking Account Balance: #{@checking}"
        puts "Savings Account Balance: #{@savings}"
        puts "Interest Rate: #{@interest_rate}"
        self
    end
    def generate_account_number
        account_number
    end
    def generate_int
        int
    end
    private
    def account_number
        @id = 7
    end
    private
    def int
        @int_rate = 0.01
    end
end
account = BankAccount.new
account2 = BankAccount.new
account.deposit_checking(16).deposit_savings(34).withdraw_checking(9)
account2.deposit_checking(70).deposit_savings(52).withdraw_checking(9)
account.account_information
account2.account_information
account2.display_bankaccount



