require 'rails_helper'

RSpec.describe Transfer, type: :model do

  it { is_expected.to belong_to(:account) }
  it { is_expected.to respond_to(:amount) }
  it { is_expected.to validate_numericality_of(:amount)}
  
  before(:all) do
    @user = create(:user, email:'emailone@teste.com')
    @account = create(:account, user: @user)
    @transfer1 = create(:transfer)
  end
  
  it "is valid with valid attributes" do
    expect(@transfer1).to be_valid
  end
  
  it "has amount only integer" do
    transfer2 = build(:transfer, amount: "zxcvb", account_to: 1)
    expect(transfer2).to_not be_valid
  end

  it "has amount presence" do
    transfer2 = build(:transfer, amount: nil, account_to: 1)
    expect(transfer2).to_not be_valid
  end

end
