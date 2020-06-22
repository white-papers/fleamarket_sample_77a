require 'rails_helper'
require 'spec_helper'
describe Deliveryaddress do
  describe '#create' do
    it "名字がない場合は登録できないこと" do
      deliveryaddress = build(:deliveryaddress, family_name: "")
      deliveryaddress.valid?
      expect(deliveryaddress.errors[:family_name]).to include("は全角で入力してください。")
    end

    it "名字が全角以外の場合は登録できないこと" do
      deliveryaddress = build(:deliveryaddress, family_name: "aaa")
      deliveryaddress.valid?
      expect(deliveryaddress.errors[:family_name]).to include("は不正な値です")
    end

    it "名前がない場合は登録できないこと" do
      deliveryaddress = build(:deliveryaddress, given_name: "")
      deliveryaddress.valid?
      expect(deliveryaddress.errors[:given_name]).to include("は全角で入力してください。")
    end

    it "名前が全角以外の場合は登録できないこと" do
      deliveryaddress = build(:deliveryaddress, given_name: "aaa")
      deliveryaddress.valid?
      expect(deliveryaddress.errors[:given_name]).to include("は不正な値です")
    end

    it "名字カナがない場合は登録できないこと" do
      deliveryaddress = build(:deliveryaddress, family_name_kana: "")
      deliveryaddress.valid?
      expect(deliveryaddress.errors[:family_name_kana]).to include("は全角カタカナで入力してください。")
    end

    it "名字カナが全角カナ以外の場合は登録できないこと" do
      deliveryaddress = build(:deliveryaddress, family_name_kana: "aaa")
      deliveryaddress.valid?
      expect(deliveryaddress.errors[:family_name_kana]).to include("は不正な値です")
    end

    it "名前カナがない場合は登録できないこと" do
      deliveryaddress = build(:deliveryaddress, given_name_kana: "")
      deliveryaddress.valid?
      expect(deliveryaddress.errors[:given_name_kana]).to include("は全角カタカナで入力してください。")
    end

    it "名前カナが全角カナ以外の場合は登録できないこと" do
      deliveryaddress = build(:deliveryaddress, given_name_kana: "aaa")
      deliveryaddress.valid?
      expect(deliveryaddress.errors[:given_name_kana]).to include("は不正な値です")
    end

    it "郵便番号がない場合は登録できないこと" do
      deliveryaddress = build(:deliveryaddress, postal_code:"")
      deliveryaddress.valid?
      expect(deliveryaddress.errors[:postal_code]).to include("半角数字のみで入力してください。")
    end

    it "郵便番号に - が入った場合は登録できないこと" do
      deliveryaddress = build(:deliveryaddress, postal_code:"000-0000")
      deliveryaddress.valid?
      expect(deliveryaddress.errors[:postal_code]).to include("は不正な値です")
    end

    it "郵便番号が七桁より少ない場合は登録できないこと" do
      deliveryaddress = build(:deliveryaddress, postal_code:"000000")
      deliveryaddress.valid?
      expect(deliveryaddress.errors[:postal_code]).to include("は不正な値です")
    end

    it "郵便番号が七桁より多い場合は登録できないこと" do
      deliveryaddress = build(:deliveryaddress, postal_code:"00000000")
      deliveryaddress.valid?
      expect(deliveryaddress.errors[:postal_code]).to include("は不正な値です")
    end

    it "郵便番号が半角数字以外で入力された場合は登録できないこと" do
      deliveryaddress = build(:deliveryaddress, postal_code:"１１１１")
      deliveryaddress.valid?
      expect(deliveryaddress.errors[:postal_code]).to include("は不正な値です")
    end


    it "市町村がない場合は登録できないこと" do
      deliveryaddress = build(:deliveryaddress, city:"")
      deliveryaddress.valid?
      expect(deliveryaddress.errors[:city]).to include("を入力してください")
    end

    it "番地がない場合は登録できないこと" do
      deliveryaddress = build(:deliveryaddress, address:"")
      deliveryaddress.valid?
      expect(deliveryaddress.errors[:address]).to include("を入力してください")
    end

    it "その他の住所は入力しなくても登録できること" do
      deliveryaddress = build(:deliveryaddress, building:"")
      expect(deliveryaddress).to be_valid
    end

    it "電話番号が無くても登録できること" do
      deliveryaddress = build(:deliveryaddress, phone_number:"")
      deliveryaddress.valid?
      expect(deliveryaddress).to be_valid
    end

    it "電話番号に - が入った場合登録できないこと" do
      deliveryaddress = build(:deliveryaddress, phone_number:"000-0000-0000")
      deliveryaddress.valid?
      expect(deliveryaddress.errors[:phone_number]).to include("半角数字のみで入力してください。")
    end


    it "その他の住所,電話番号以外を入力する登録できること" do
      deliveryaddress = build(:deliveryaddress, building:"", phone_number:"")
      expect(deliveryaddress).to be_valid
    end
  end  
end  