Factory.define :gold_blend_white, :class => :product do |f|
  f.name        "Gold Blend Coffee White"
  f.stock_code  "1320"
  f.price       "350"
end

Factory.define :liskeard, :class => :order do |f|
  f.branch  "Liskeard"  
end