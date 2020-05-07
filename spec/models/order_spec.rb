require 'rails_helper'

RSpec.describe Order, type: :model do
  subject { Order.new(product_name: "grape", product_count: 7, customer: FactoryBot.create(:customer))}
  
  it "is valid with valid subject" do
  	expect(subject).to be_valid
  end
  # validates_presence_of :product_name
  it "is not valid without a product_name" do
    subject.product_name=nil
    expect(subject).to_not be_valid
  end
  # validates_presence_of :product_count
  it "is not valid without a product_count" do
    subject.product_count=nil
    expect(subject).to_not be_valid
  end
  # validates_presence_of :customer
  it "is not valid without a customer" do
    subject.customer=nil
    expect(subject).to_not be_valid
  end
  # validates :product_count, numericality: { only_integer: true }
  it "is not valid if product_count is not an integer" do
    subject.product_count="b"
    expect(subject).to_not be_valid
  end 
   
end