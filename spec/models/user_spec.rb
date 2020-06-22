require 'rails_helper'
require 'spec_helper'
describe User do
  describe '#create' do
    it "nicknameがない場合は登録できないこと" do
      user =build(:user, nickname: "")
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end
    
    it "パスワードがない場合は登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("が入力されていません。")
    end

    it "パスワードが七桁より少ないと登録できないこと" do
      user = build(:user, password: "000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上に設定して下さい。")
    end

    it "パスワードが存在しても２回目の入力がないと登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end

    it "emailがない場合は登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email]).to include("が入力されていません。")
    end
    
    it "emailに＠、ドメインがないと登録できないこと" do
      user = build(:user, email: "aaa")
      user.valid?
      expect(user.errors[:email]).to include("は有効でありません。")
    end

    it "重複したemailが存在する場合登録できないこと" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("は既に使用されています。")
    end

    it "名字がない場合は登録できないこと" do
      user = build(:user, family_name: "")
      user.valid?
      expect(user.errors[:family_name]).to include("は全角で入力してください。")
    end

    it "名字が全角以外の場合は登録できないこと" do
      user = build(:user, family_name: "aaa")
      user.valid?
      expect(user.errors[:family_name]).to include("は不正な値です")
    end

    it "名前がない場合は登録できないこと" do
      user = build(:user, given_name: "")
      user.valid?
      expect(user.errors[:given_name]).to include("は全角で入力してください。")
    end

    it "名前が全角以外の場合は登録できないこと" do
      user = build(:user, given_name: "aaa")
      user.valid?
      expect(user.errors[:given_name]).to include("は不正な値です")
    end

    it "名字カナがない場合は登録できないこと" do
      user = build(:user, family_name_kana: "")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は全角カタカナで入力してください。")
    end

    it "名字カナが全角カナ以外の場合は登録できないこと" do
      user = build(:user, family_name_kana: "aaa")
      user.valid?
      expect(user.errors[:family_name_kana]).to include("は不正な値です")
    end

    it "名前カナがない場合は登録できないこと" do
      user = build(:user, given_name_kana: "")
      user.valid?
      expect(user.errors[:given_name_kana]).to include("は全角カタカナで入力してください。")
    end

    it "名前カナが全角カナ以外の場合は登録できないこと" do
      user = build(:user, given_name_kana: "aaa")
      user.valid?
      expect(user.errors[:given_name_kana]).to include("は不正な値です")
    end

    it "生年月日がない場合は登録できないこと" do
      user = build(:user, birthday: "")
      user.valid?
      expect(user.errors[:birthday]).to include("を入力してください。")
    end
    
    it "全ての値が存在すればページ移動できること" do
      user = build(:user)
      expect(user).to be_valid
    end
  end
end