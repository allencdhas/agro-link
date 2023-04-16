 pub contract AgroLink{
//
//Farmer's Fucntionality
//
    pub resource Grocery{
        pub var grocery: String
        pub var units: Int
        pub var price: UFix64

        init(_grocery: String, _units: Int, _price: UFix64) {
              self.grocery = _grocery
              self.units = _units
              self.price = _price
        }
    }

    pub resource interface InventoryPublic{
        pub var items: @{UInt64: Grocery}
    }

    pub resource Inventory: InventoryPublic{
        pub var items: @{UInt64: Grocery}

        pub fun addItem(item: @Grocery) {
            var olditem <- self.items[item.uuid] <- item
            //self.items[item.uuid] <-! item
            destroy olditem
        }
        init(){
                self.items <- {}
        }

        destroy(){
            destroy self.items
        }
    }

    pub fun createInventory(): @Inventory{
            return <- create Inventory()
    }

    pub fun addItems(name: String, nos: Int, price: UFix64): @Grocery{

            return <- create Grocery(_grocery: name,_units : nos, _price: price)
    }

  
//
//Consumer Functionalities
//
    
    pub var grocery: {String: Int}
        
    init(){
        self.grocery = {}
    }

    pub fun addToCart(name: String, units: Int){
        self.grocery[name] = units
    }
}
 
