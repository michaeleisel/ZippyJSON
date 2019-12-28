///
///  EquatableType.swift
///  Sticky
///
///  Created by Tony Stone on 10/8/17.
///
///
import Swift

public protocol EquatableType: Equatable {
    
    func equals(_ other: Self) -> Bool
}
