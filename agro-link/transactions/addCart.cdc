import AgroLink from 0xf8d6e0586b0a20c7

transaction(name: String, units: Int){
  prepare(acct: AuthAccount){
    let inventoryRef = acct.borrow<&AgroLink.Inventory>(from: /storage/Inventory)
                            ?? panic("No Groceries Available!")
    
    AgroLink.addToCart(name: name, units: units)
    // AgroLink.addToCart(name: "Orange", units: 25)

    log(AgroLink.grocery.keys)
  }
  pre{

  }  
  execute{
    log("Added to Cart!")
  }  
}