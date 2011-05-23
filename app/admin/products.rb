ActiveAdmin.register Product do
  
  form do |f|
    f.inputs "Product Details" do
      f.input :name
      f.input :stock_code
      f.input :price, :hint => "In pence. ie. 795 = &pound;7.95"
      f.input :sizes, :as => :select, :hint => "You can select multiple sizes"
    end
    f.buttons
  end
  
  show do
    # title product.name
    # div do
    #   p product.stock_code
    #   p product.price
    # end
    
    # ul do
    #       for size in product.sizes do
    #         li size.name
    #       end
    #     end
    
    # main_content
    
    attributes_table do
      rows :name, :stock_code, :price
      row("Sizes") do
        ul do
          for size in product.sizes do
            li size.name
          end
        end
      end
    end
  end
  
end
