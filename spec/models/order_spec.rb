require 'rails_helper'

RSpec.describe Order, type: :model do
  let!(:user) { create(:user) }

  # 正常系 ====================================================

  it "データの保存に成功する" do
    expect(build(:order)).to be_valid
  end

  # 異常系 ====================================================
  
  context "支払方法が空欄の場合は" do
    it "作成できない" do
      expect(build(:order,:payment_method_is_nil)).to be_invalid
    end
  end

  context "性が空欄の場合は" do
    it "作成できない" do
      expect(build(:order,:firstname_is_nil)).to be_invalid
    end
  end

  context "名が空欄の場合は" do
    it "作成できない" do
      expect(build(:order,:lastname_is_nil)).to be_invalid
    end
  end

  context "郵便番号が空欄の場合は" do
    it "作成できない" do
      expect(build(:order,:zipcode_is_nil)).to be_invalid
    end
  end

  context "都道府県が空欄の場合は" do
    it "作成できない" do
      expect(build(:order,:prefecture_is_nil)).to be_invalid
    end
  end

  context "市区町村が空欄の場合は" do
    it "作成できない" do  
      expect(build(:order,:city_is_nil)).to be_invalid
    end
  end

  context "番地が空欄の場合は" do
    it "作成できない" do   
      expect(build(:order,:block_is_nil)).to be_invalid
    end
  end

  context "電話番号が空欄の場合は" do
    it "作成できない" do  
      expect(build(:order,:phone_is_nil)).to be_invalid
    end
  end

end

