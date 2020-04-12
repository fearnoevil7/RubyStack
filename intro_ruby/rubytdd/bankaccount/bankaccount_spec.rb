require_relative 'bankAccount'
RSpec.describe BankAccount do
    before(:each) do
        @account = BankAccount.new
    end
    it "it has a checking account balance" do
        @account.display_checking
        expect(@account.display_checking).to eq(@account.checking)
    end
    it "it can retrieve total account balance" do
        @account.total
        expect(@account.total).to eq(@account.checking + @account.savings)
    end
    context "it can withdraw" do
        it "was successful" do
            @account.deposit_checking(100)
            expect(@account.withdraw_checking(10)).to eq(90)
        end
    end
    context "not enough" do
        it "is unable to withdraw" do
            # expect(@account.withdraw_checking(10)).to be_false
            expect{@account.withdraw_checking(10)}.to raise_error("Insufficient funds")
        end
    end
    it "cant change interest rate" do
        expect{@account.int(10)}.to raise_error(NoMethodError)
    end
    it "cant retrieve total number of bank accounts" do
        expect{@account.quantity}.to raise_error(NoMethodError)
    end
end
