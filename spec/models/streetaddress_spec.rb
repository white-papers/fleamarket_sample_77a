require 'rails_helper'
require 'spec_helper'
describe Streetaddress do
  describe '#create' do

    it "郵便番号がない場合は登録できないこと" do
      streetaddress = build(:streetaddress, postal_code:"")
      streetaddress.valid?
      expect(streetaddress.errors[:postal_code]).to include("を入力してください")
    end

    it "郵便番号に - が入った場合は登録できないこと" do
      streetaddress = build(:streetaddress, postal_code:"000-0000")
      streetaddress.valid?
      expect(streetaddress.errors[:postal_code]).to include("は不正な値です")
    end

    it "郵便番号が七桁より少ない場合は登録できないこと" do
      streetaddress = build(:streetaddress, postal_code:"000000")
      streetaddress.valid?
      expect(streetaddress.errors[:postal_code]).to include("は不正な値です")
    end

    it "郵便番号が七桁より多い場合は登録できないこと" do
      streetaddress = build(:streetaddress, postal_code:"00000000")
      streetaddress.valid?
      expect(streetaddress.errors[:postal_code]).to include("は不正な値です")
    end

    it "郵便番号が半角数字以外で入力された場合は登録できないこと" do
      streetaddress = build(:streetaddress, postal_code:"１１１１")
      streetaddress.valid?
      expect(streetaddress.errors[:postal_code]).to include("は不正な値です")
    end



    it "市町村がない場合は登録できないこと" do
      streetaddress = build(:streetaddress, city:"")
      streetaddress.valid?
      expect(streetaddress.errors[:city]).to include("を入力してください")
    end

    it "番地がない場合は登録できないこと" do
      streetaddress = build(:streetaddress, address:"")
      streetaddress.valid?
      expect(streetaddress.errors[:address]).to include("を入力してください")
    end

    it "その他の住所は入力しなくてもページ移動できること" do
      streetaddress = build(:streetaddress, building:"")
      expect(streetaddress).to be_valid
    end

    it "全ての値が存在するとページ移動できること" do
      streetaddress = build(:streetaddress)
      expect(streetaddress).to be_valid
    end
  end  
end    