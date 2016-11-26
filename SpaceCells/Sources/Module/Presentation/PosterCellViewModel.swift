
import Foundation

typealias PosterCellViewModelInfoSelectionBlock = () -> Void

struct PosterCellViewModel {
    let title: String
    let subtitle: String
    let imageName: String
    let infoButtonSelectionBlock: PosterCellViewModelInfoSelectionBlock
}
