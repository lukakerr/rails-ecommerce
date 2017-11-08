require 'rails_helper'

RSpec.describe Product, type: :model do
  it "has a valid factory" do
    expect(FactoryBot.build(:product)).to be_valid
  end
  
  it "is invalid without a name" do
    expect(FactoryBot.build(:product, name: nil)).to be_invalid
  end
  
  it "is invalid without a description" do
    expect(FactoryBot.build(:product, description: nil)).to be_invalid
  end
  
  it "is invalid without a price" do
    expect(FactoryBot.build(:product, price: nil)).to be_invalid
  end
  
  it { should have_many(:order_items) }
  it { should have_many(:pictures).dependent(:delete_all) }
  it { should belong_to(:category) }
  it { should belong_to(:user) }
  
  context "db" do
    context "columns" do
      it { should have_db_column(:name).of_type(:string) }
      it { should have_db_column(:description).of_type(:text) }
      it { should have_db_column(:price).of_type(:decimal).with_options(precision: 8, scale: 2) }
      it { should have_db_column(:old_price).of_type(:decimal) }
      it { should have_db_column(:on_sale).of_type(:boolean) }
      it { should have_db_column(:sold_out).of_type(:boolean) }
      it { should have_db_column(:featured).of_type(:boolean) }
      it { should have_db_column(:quantity).of_type(:integer) }
      it { should have_db_column(:category_id).of_type(:integer) }
      it { should have_db_column(:user_id).of_type(:integer) }
    end
  end
  
  context "attributes" do
    it "has name" do 
      expect(FactoryBot.build(:product, name: "Product ABC123")).to have_attributes(name: "Product ABC123")
    end
  end
  
  context "validation" do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:name) }
  end
end