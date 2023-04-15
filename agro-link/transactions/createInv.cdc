import AgroLink from 0xf8d6e0586b0a20c7

transaction{
    prepare(acct: AuthAccount){
        acct.save(<- AgroLink.createInventory(), to: /storage/Inventory)
        //acct.save(<- Crash.addItems(_name: "Apple", nos: 23, price: 0.10), to: /storage/InventoryItems1)
        //acct.link<&Crash.Inventory{Crash.InventoryPublic}>(/public/InventoryItemPublic, target:/storage/InventoryItem1)
        //acct.save(<- Crash.createInventory(name: "Orange", nos: 23, price: 0.15), to: /storage/InventoryItems1)
       // acct.save(<-Crash.addItems(name: "Apple", nos: 5, price: 0.5), to: /storage/Inv1)
        acct.link<&AgroLink.Inventory>(/public/InventoryPublic, target: /storage/Inventory)
    }

    execute{
        log("Inventory Created!")
    }
}