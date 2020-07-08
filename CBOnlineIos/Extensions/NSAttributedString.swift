//
//  NSAttributedString.swift
//  CBOnlineIos
//
//  Created by Vaibhav Bisht on 09/07/20.
//  Copyright © 2020 Coding Blocks. All rights reserved.
//


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
