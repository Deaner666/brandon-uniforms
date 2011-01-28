Factory.define :gold_blend_white, :class => :product do |f|
  f.name        "Gold Blend Coffee White"
  f.stock_code  "1320"
  f.price       "350"
end

Factory.define :order do |f|
  f.branch  "Liskeard"  
end

Factory.define :line_item do |f|
  f.association :order
  f.association :product, :factory => :gold_blend_white
  f.quantity    10
end