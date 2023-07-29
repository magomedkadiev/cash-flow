import Foundation

class WalletPOToRealmWalletMapper {
    
    func map(_ walletPO: WalletPO) -> Wallet {
        let mappedWallet = Wallet(id: walletPO.id, name: walletPO.name, sum: walletPO.sum)
        return mappedWallet
    }
}
