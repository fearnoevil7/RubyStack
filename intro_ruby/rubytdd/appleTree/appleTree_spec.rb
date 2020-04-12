require_relative 'appleTree'
RSpec.describe AppleTree do
    before(:each) do
        @tree = AppleTree.new
    end
    it "has a getter and setter method for age attribute" do
        @tree.age = "7"
        expect(@tree.age).to eq("7")
    end
    context "has a getter method for height" do
        it "height has a getter" do
            expect(@tree.height).to eq(10)
        end
        it "cant change height" do
            expect{@tree.height = 7}.to raise_error(NoMethodError)
        end
    end
    context "has a getter method for count" do
        it "count is set to" do
            expect(@tree.count).to eq(0)
        end
        it "cant change the count" do
            expect{@tree.count = 7}.to raise_error(NoMethodError)
        end
    end
    context 'has a method years_gone_by to increment age and count' do
        before(:each) do
            @tree.years_gone_by
        end
        it 'method adds 1 year to Age' do
            expect(@tree.age).to eq(1)
        end
        it "method increases height by 10%" do
            expect(@tree.height).to eq(11)
        end
        it 'method adds 2 to apple count' do
            @tree.years_gone_by
            @tree.years_gone_by
            @tree.years_gone_by
            expect(@tree.count).to eq(2)
        end
    end
    context 'cannot grow apples for the first 3 years of life and cannot grow applles if its older than 10' do
        it 'cannot grow apples for first 3 years' do
            @tree.age = 2
            expect(@tree.count).to eq(0)
        end
        it 'cannot grow apples if its older than 10' do
            @tree.years_gone_by
            @tree.years_gone_by
            @tree.years_gone_by
            @tree.years_gone_by
            @tree.years_gone_by
            @tree.years_gone_by
            @tree.years_gone_by
            @tree.years_gone_by
            @tree.years_gone_by
            @tree.years_gone_by
            @tree.years_gone_by
            @tree.years_gone_by
            @tree.years_gone_by
            expect(@tree.count).to eq(14)
            expect(@tree.age).to eq(13)
        end
    end
    it "has a method called picked apples" do
        @tree.pickApples
        expect(@tree.count).to eq(0)
    end
end
