import AgroLink from 0xf8d6e0586b0a20c7


pub fun main(acct: Address){
    let myitems = getAccount(acct).getCapability(/public/InventoryPublic)
                        .borrow<&AgroLink.Inventory>()
                        ?? panic("Can't get public link!")
    log(myitems.items.keys)
}
 