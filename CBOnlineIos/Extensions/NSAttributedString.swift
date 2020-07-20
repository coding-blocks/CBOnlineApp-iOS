

import Foundation

extension NSAttributedString {
    static func makeHyperLink(for path : String, in string : String, as substring : String) ->NSAttributedString {
        
        let nstring = NSString(string: string)
        let substringRange = nstring.range(of: substring)
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.link, value: path, range: substringRange)
        return attributedString
    }
}
