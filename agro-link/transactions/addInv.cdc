import AgroLink from 0xf8d6e0586b0a20c7

transaction(name: String, nos: Int, price: UFix64){
    prepare(acct: AuthAccount){
        
        let inventoryRef = acct.borrow<&AgroLink.Inventory>(from: /storage/Inventory)
                            ?? panic("No Items found!")
        //let item <- Crash.addItems(name: "Apple", nos: 20, price: 0.10)
        inventoryRef.addItem(item: <- AgroLink.addItems(name: name, nos: nos, price: price))
        // inventoryRef.addItem(item: <- AgroLink.addItems(name: "Orange", nos: 10, price: 0.15))

        
    }

    execute{
        log("Item Added!")
    }
}