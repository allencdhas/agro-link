  pub contract AgroLink{

    // pub resource interface InventoryPublic {
    //     pub var gname: String
    //     pub var gnos: Int
    //     pub var gprice: UFix64
    // }

    // pub resource Inventory: InventoryPublic {
    //     pub var gname: String
    //     pub var gnos: Int
    //     pub var gprice: UFix64

    //     init(_name: String, _nos: Int, _price: UFix64){ 
    //         self.gname = _name
    //         self.gnos = _nos
    //         self.gprice = _price
    //     }
    // }
  

    // pub fun createInventory(name: String, nos: Int, price: UFix64): @Inventory{
    //     return <- create Inventory(_name: name, _nos: nos, _price: price)
    // }
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

        pub fun grocery(groceryID: UInt64): GroceryDTO {
            // We take the note out of the notes dictionary, 
            // create a NoteDTO from it, put the note Resource 
            // back into the dictionary, and return the NoteDTO:
            var grocery <- self.items.remove(key: groceryID)!
            let groceryDTO = GroceryDTO(_id: groceryID, _grocery: grocery.grocery, _units: grocery.units, _price: grocery.price)

            let oldgrocery <- self.items[groceryID] <- grocery
            destroy oldgrocery
            return groceryDTO
        }

        // Public function that returns an array of NoteDTO 
        // (see this DTO definition below). This will be 
        // useful for client queries (Scripts), which are 
        // read-only, and we cannot just return a Resource. 
        pub fun getGroceries(): [GroceryDTO] {
            // We get a NoteDTO array from the note Resources 
            // in the Notepad. 
            var allgroceries: [GroceryDTO] = []
            for key in self.items.keys {
                allgroceries.append(self.grocery(groceryID: key))
            }

            return allgroceries
        }
    }
    
    

    pub fun createInventory(): @Inventory{
            return <- create Inventory()
    }

    pub fun addItems(name: String, nos: Int, price: UFix64): @Grocery{

            return <- create Grocery(_grocery: name,_units : nos, _price: price)
    }

    pub struct GroceryDTO{
        pub var id: UInt64
        pub var grocery: String
        pub var units: Int
        pub var price: UFix64

        init(_id: UInt64, _grocery: String, _units: Int, _price: UFix64) {
            self.id = _id
            self.grocery = _grocery
            self.units = _units
            self.price = _price
        }
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
 
