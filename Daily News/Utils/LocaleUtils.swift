//
//  LocaleUtils.swift
//  Daily News
//
//  Created by Daniel Frimpong on 04/11/2023.
//

import Foundation
func countryName() -> String{
    let locale = Locale.current
    let name = locale.localizedString(forRegionCode: locale.regionCode ?? "en-US")
    return name!   
}
