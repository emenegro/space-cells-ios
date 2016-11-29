
import Foundation

typealias PosterCellViewModelSelectionBlock = () -> Void
typealias PosterCellViewModelInfoSelectionBlock = () -> Void

struct PosterCellViewModel {
    let title: String
    let subtitle: String
    let imageName: String
    let selectionBlock: PosterCellViewModelSelectionBlock
    let infoButtonSelectionBlock: PosterCellViewModelInfoSelectionBlock
}

extension PosterCellViewModel: CollectionableViewModel {
    func onRowSelected() {
        selectionBlock()
    }
}
