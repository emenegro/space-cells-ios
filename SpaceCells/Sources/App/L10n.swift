
import Foundation

enum L10n: String {
    case appName = "txt_app_name"
    case accept = "txt_accept"
    case showInfo = "txt_show_info"
}

extension L10n: Localizable {
    var localized: String {
        return rawValue.localized
    }
}
