require 'rails_helper'
require 'spec_helper'
describe Product do

  describe '#update' do
    it "商品名がない場合は更新できないこと" do
      product = build(:product, name: "")
      product.valid?
      expect(product.errors[:name]).to include("入力してください。")
    end

    it "サイズがなくても更新できること" do
      product = build(:product, size: "")
      product.valid?
      expect(product.errors[:size]).to include()
    end

    it "商品の状態がない場合は更新できないこと" do
      product = build(:product, status: "")
      product.valid?
      expect(product.errors[:status]).to include("入力してください。")
    end

    it "発送日の目安がない場合は更新できないこと" do
      product = build(:product, estimated_delivery: "")
      product.valid?
      expect(product.errors[:estimated_delivery]).to include("入力してください。")
    end

    it "配送料の負担がない場合は更新できないこと" do
      product = build(:product, shipping_fee_burden: "")
      product.valid?
      expect(product.errors[:shipping_fee_burden]).to include("入力してください。")
    end

    it "発送元の地域がない場合は更新できないこと" do
      product = build(:product, prefectures: "")
      product.valid?
      expect(product.errors[:prefectures]).to include("入力してください。")
    end

    it "価格がない場合は更新できないこと" do
      product = build(:product, amount_of_money: "")
      product.valid?
      expect(product.errors[:amount_of_money]).to include("入力してください。")
    end

    it "商品説明がない場合は更新できないこと" do
      product = build(:product, product_details: "")
      product.valid?
      expect(product.errors[:product_details]).to include("入力してください。")
    end

    it "カテゴリーがない場合は更新できないこと" do
      product = build(:product, category_id: "")
      product.valid?
      expect(product.errors[:category_id]).to include("を入力してください")
    end

    it "画像がない場合は更新できないこと" do
      product = build(:image, image: "")
      product.valid?
      expect(product.errors[:image]).to include("を入力してください")
    end

    it "user_idがない場合は更新できないこと" do
      product = build(:product, user_id: "")
      product.valid?
      expect(product.errors[:user_id]).to include()
    end

    it "exhibitor_idがない場合は更新できないこと" do
      product = build(:product, exhibitor_id: "")
      product.valid?
      expect(product.errors[:exhibitor_id]).to include()
    end
  end

end
