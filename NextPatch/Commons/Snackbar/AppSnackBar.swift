//
//  AppSnackBar.swift
//  NextPatch
//
//  Created by Irfanul Arifa on 11/08/25.
//

import SnackBar

class SuccessSnackBar: SnackBar {
    
    override var style: SnackBarStyle {
        var style = SnackBarStyle()
        style.background = .blue
        style.textColor = .white
        return style
    }
}

class FailedSnackBar: SnackBar {
    override var style: SnackBarStyle {
        var style = SnackBarStyle()
        style.background = .red
        style.textColor = .white
        return style
    }
}
