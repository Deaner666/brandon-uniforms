# == Schema Information
# Schema version: 20110601171954
#
# Table name: orders
#
#  id         :integer         not null, primary key
#  branch     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  contact    :string(255)
#  job_title  :string(255)
#

class Order < ActiveRecord::Base
  
  has_many :line_items
  has_many :products, :through => :line_items
  
  accepts_nested_attributes_for :line_items,
    :reject_if => lambda { |a| a[:quantity].blank? }
  
  validates :branch, :presence => true
  validates :contact, :presence => true
  validates :job_title, :presence => true
  
  BRANCHES = [
    "002 - BRISTOL MAIN",
    "006 - CHELTENHAM",
    "009 - BRISTOL",
    "010 - SWINDON",
    "011 - BRISTOL",
    "012 - BATH",
    "013 - BRISTOL",
    "014 - WESTON-S-MARE",
    "015 - PORTSMOUTH",
    "017 - READING",
    "018 - SOUTHAMPTON",
    "019 - WINCHESTER",
    "020 - NARBERTH",
    "021 - NEWPORT",
    "022 - CARDIFF",
    "023 - CARDIFF",
    "025 - CARDIFF MAIN",
    "026 - BRIDGEND",
    "027 - MERTHYR",
    "028 - PORT TALBOT",
    "030 - SWANSEA",
    "031 - HEREFORD",
    "032 - CAERPHILLY",
    "033 - CARMARTHEN",
    "035 - TAUNTON",
    "036 - BRIDGWATER",
    "037 - HIGHBRIDGE",
    "038 - WORCESTER",
    "039 - MALVERN",
    "040 - EVESHAM",
    "043 - GILLINGHAM",
    "044 - TONBRIDGE",
    "045 - RUGBY",
    "047 - KINGS CROSS",
    "048 - RAINHAM",
    "049 - CHELMSFORD",
    "050 - WEST HAMPSTEAD",
    "052 - LEEDS",
    "053 - BISHOP AUCK",
    "055 - GLASGOW",
    "056 - CHANDLERS FORD",
    "057 - MIDDLESBROUGH",
    "058 - NEWCASTLE",
    "060 - WORTHING",
    "061 - GLOUCESTER",
    "062 - TROWBRIDGE",
    "063 - LEDBURY",
    "064 - ROSS-ON-WYE",
    "065 - SALISBURY",
    "066 - BARNSTAPLE",
    "068 - BOURNEMOUTH",
    "069 - CHRISTCHURCH",
    "070 - POOLE",
    "071 - WIMBORNE",
    "072 - HEATHROW",
    "073 - BLANDFORD FORUM",
    "074 - WEYMOUTH",
    "075 - ANDOVER",
    "076 - BASINGSTOKE",
    "080 - OXFORD",
    "081 - EXETER",
    "082 - PLYMPTON",
    "083 - GUILDFORD",
    "085 - ALDERSHOT",
    "087 - BOGNOR REGIS",
    "088 - TRURO",
    "089 - YEOVIL",
    "090 - PLYMOUTH",
    "092 - WALLINGTON",
    "094 - CANNING TOWN",
    "095 - WANDSWORTH",
    "096 - TORQUAY",
    "097 - BURTON",
    "098 - SURBITON",
    "099 - MAIDA VALE",
    "100 - BODMIN",
    "101 - REDRUTH",
    "102 - ST AUSTELL",
    "103 - TAVISTOCK",
    "105 - SALTASH",
    "106 - DOVER",
    "107 - MAIDSTONE",
    "108 - SITTINGBOURNE",
    "109 - RAMSGATE",
    "110 - TOTNES",
    "112 - WOLVERHAMPTON",
    "113 - WILLESDEN",
    "114 - NORTHAMPTON",
    "115 - WALLASEY",
    "116 - ELLESMERE PORT",
    "119 - BURY ST EDMUDS",
    "120 - MINEHEAD",
    "121 - LUTON",
    "122 - MARKET HARB",
    "126 - IPSWICH",
    "127 - NORWICH",
    "128 - CAMBRIDGE",
    "129 - KINGS LYNN",
    "132 - SHEFFIELD",
    "133 - SOWTON",
    "134 - EXMOUTH",
    "136 - LIVERPOOL",
    "137 - EDINBURGH",
    "138 - HULL",
    "140 - GRIMSBY",
    "141 - CHESTER",
    "143 - MACCLESFIELD",
    "144 - BOLTON",
    "145 - STRATFORD",
    "148 - BOOTLE",
    "149 - GREENOCK",
    "150 - COATBRIDGE",
    "151 - PAISLEY",
    "152 - EDINBURGH",
    "155 - PENZANCE",
    "156 - BIRMINGHAM",
    "157 - REDDITCH",
    "158 - GUERNSEY",
    "161 - DONCASTER",
    "164 - SALFORD",
    "210 - ALTRINCHAM",
    "214 - LEICESTER",
    "218 - CHRISTCHURCH",
    "223 - TELFORD",
    "231 - YORK",
    "236 - BURGESS HILL",
    "237 - WEST WICKHAM",
    "240 - DORCHESTER",
    "243 - WEST BROMWICH",
    "248 - BEDFORD",
    "253 - LLANGEFNI",
    "254 - HOVE",
    "256 - HASTINGS",
    "258 - HAYWARDS HEATH",
    "259 - HORSHAM",
    "261 - ASHFORD",
    "262 - EAST GRINDSTEAD",
    "264 - DUMFRIES",
    "266 - INVERNESS",
    "268 - GRANGEMOUTH",
    "269 - HIGHGATE",
    "272 - BODMIN",
    "273 - BRACKNELL",
    "276 - STOKE ON TRENT",
    "277 - EASTBOURNE",
    "278 - FOLKESTONE",
    "279 - HINCHLEY WOOD",
    "280 - LEATHERHEAD",
    "281 - PRESTON",
    "284 - PORTSMOUTH",
    "285 - REDHILL",
    "286 - RETFORD",
    "288 - ROTHERHAM",
    "298 - NEWPORT",
    "299 - HARTLEPOOL",
    "304 - NEWCASTLE",
    "306 - SUNDERLAND",
    "308 - ABERDEEN",
    "313 - LLANDUDNO",
    "314 - GLASGOW",
    "316 - DARLINGTON",
    "321 - HAILSHAM",
    "331 - DEVIZES",
    "401 - COULSDON lIFTING",
    "402 - CAMBERLEY",
    "421 - BRISTOL LFTG",
    "426 - HEATHROW",
    "428 - RAINHAM LIFTG",
    "455 - GLASGOW",
    "456 - CHANDLERS FORD",
    "482 - PLYMOUTH LIFT",
    "504 - GREENFORD PIPE",
    "510 - BRISTOL PIPE",
    "512 - GLOS/PIPE",
    "903 - MANSFIELD",
    "904 - NOTTINGHAM",
    "905 - COVENTRY",
    "908 - ALFRETON"
  ]
  
  # Find the total cost of an order by summing the cost of its line_items
  def total
    self.line_items.inject(0) {|x, li| x + li.total }
  end
  
  # If a combination of product and size already exists amongst an order's line_items, return true,
  # else return false
  def has_line_item?(product_id, size)
    bool = false
    for li in self.line_items
      if li.product_id == product_id && li.size == size
        bool = true
      end
    end
    return bool
  end
  
  # Return an array with similar line_items (same product and same size) merged
  def line_items_crunched
    # lis_crunched = []
    # for li in self.line_items
    #   lis_crunched.find(lis_crunched << li){ |lic| lic.product_id == li.product_id && lic.size == li.size }.quantity += li.quantity if li.quantity
    # end
    
    # new_array = array.map {|v,w| [v,w, array.select {|b,c|
    #    b == v && c == w }.inject(0){|m,b| m + b.last}]}.uniq
    
    self.line_items.group(["product_id", "size"])
    
  end
  
end
