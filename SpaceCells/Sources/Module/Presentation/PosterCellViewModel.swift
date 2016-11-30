
import Foundation

struct PosterCellViewModel {
    let title: String
    let subtitle: String
    let imageName: String
    let selectionBlock: () -> Void
    let infoButtonSelectionBlock: () -> Void
}

extension PosterCellViewModel: CollectionableViewModel {
    func onRowSelected() {
        selectionBlock()
    }
}
