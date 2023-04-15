import AgroLink from 0xf8d6e0586b0a20c7

transaction{
    prepare(acct: AuthAccount){
    
        acct.save(<- AgroLink.createInventory(), to: /storage/Inventory)
   
        acct.link<&AgroLink.Inventory>(/public/InventoryPublic, target: /storage/Inventory)
    }

    execute{
        log("Inventory Created!")
    }
}
