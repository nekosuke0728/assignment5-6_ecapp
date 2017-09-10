require 'rails_helper'

RSpec.describe "user#create", type: :model do

  # 正常系 ====================================================

  it "データの保存に成功する" do
    expect(build(:user)).to be_valid
  end

  # 異常系 ====================================================
  
  context "メールアドレスが空欄の場合は" do
    it "作成できない" do
      expect(build(:user,:email_is_nil)).to be_invalid
    end
  end

  context "パスワードが空欄の場合は" do
    it "作成できない" do
      expect(build(:user,:password_is_nil)).to be_invalid
    end
  end

  context "ニックネームが空欄の場合は" do
    it "作成できない" do
      expect(build(:user,:nickname_is_nil)).to be_invalid
    end
  end

end


