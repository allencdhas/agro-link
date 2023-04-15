import AgroLink from 0xf8d6e0586b0a20c7

transaction{
    prepare(acct: AuthAccount){
        let myitem = acct.borrow<&AgroLink.Inventory>(from: /storage/Inventory)
                    ??panic("Could not borrow item!")

        log(myitem.items.keys)
    }

    execute{
        log("Checked for item!")
    }
}
