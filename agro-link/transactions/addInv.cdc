import AgroLink from 0xf8d6e0586b0a20c7

transaction(name: String, nos: Int, price: UFix64){
    prepare(acct: AuthAccount){
        
        let inventoryRef = acct.borrow<&AgroLink.Inventory>(from: /storage/Inventory)
                            ?? panic("No Items found!")
        
        inventoryRef.addItem(item: <- AgroLink.addItems(name: name, nos: nos, price: price))    
    }

    execute{
        log("Item Added!")
    }
}
