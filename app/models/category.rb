class Category < ApplicationRecord
  has_many :products
  has_ancestry
    def set_products
      # 親カテゴリーの場合
      if self.root?
        start_id = self.indirects.first.id
        end_id = self.indirects.last.id
        products = Product.where(category_id: start_id..end_id)
        return products
    
        # 子カテゴリーの場合
      elsif self.has_children?
        start_id = self.children.first.id
        end_id = self.children.last.id
        products = Product.where(category_id: start_id..end_id)
        return products
    
        # 孫カテゴリーの場合
      else
        return self.products
      end
    end
end
