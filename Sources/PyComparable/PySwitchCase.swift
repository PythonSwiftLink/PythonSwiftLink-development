//
//  File.swift
//  
//
//  Created by CodeBuilder on 16/11/2023.
//

import Foundation
import PySwiftCore

public protocol PyTypeProtocol {
	static func ~=(l: Self, r: PyPointer) -> Bool
}


extension PyPointer {
	
	public static func ~=(l: UnsafeMutablePointer<PyTypeObject>, r: PyPointer) -> Bool  {
		return PyObject_TypeCheck(r, l) == 1
	}
	
}


extension String: PyTypeProtocol {
	public static func ~= (l: String, r: PyPointer) -> Bool {
		l.withCString { str in
			PyUnicode_CompareWithASCIIString(r, str) == 1
		}
	}
}


public extension Optional where Wrapped == UnsafeMutablePointer<PyTypeObject> {
	static func newType(_ t: PyTypeObject) -> Self {
		let new: Self = .allocate(capacity: 1)
		new?.pointee = t
		return new
	}
}


public var pyLong_Type = UnsafeMutablePointer(&PyLong_Type)//PythonType.newType(PyLong_Type)!
public let pyFloat_Type = UnsafeMutablePointer(&PyFloat_Type)
public var pyUnicode_Type = UnsafeMutablePointer(&PyUnicode_Type)
public let pyComplex_Type = UnsafeMutablePointer(&PyComplex_Type)
public let pyBool_Type = UnsafeMutablePointer(&PyBool_Type)

public let pyList_Type = UnsafeMutablePointer(&PyList_Type)
public let pyDict_Type = UnsafeMutablePointer(&PyDict_Type)
public let pyTuple_Type = UnsafeMutablePointer(&PyTuple_Type)
public let pySet_Type = UnsafeMutablePointer(&PySet_Type)

public let pyBytes_Type = UnsafeMutablePointer(&PyBytes_Type)
public let pyByteArray_Type = UnsafeMutablePointer(&PyByteArray_Type)
public let pyMemoryView_Type = UnsafeMutablePointer(&PyMemoryView_Type)


public let pySuper_Type = UnsafeMutablePointer(&PySuper_Type)
public let pyFunction_Type = UnsafeMutablePointer(&PyFunction_Type)
//public let pyCallavl = PythonType.newType(PyCallable_Check(<#T##UnsafeMutablePointer<PyObject>!#>))

public let pyEnum_Type = UnsafeMutablePointer(&PyEnum_Type)
public let pyNone_Type = UnsafeMutablePointer(&_PyNone_Type)

public let pyRange_Type = UnsafeMutablePointer(&PyRange_Type)
public let pySlice_Type = UnsafeMutablePointer(&PySlice_Type)
//private func test() {
//	let a = "a".pyPointer // PyObject
//	
//	switch a {
//		
//	case pyLong_Type: print("i am PyLong type")
//	case pyFloat_Type: print("i am PyFloat type")
//	case "a": print("i am the string \"a\"")
//	case 10: print("i am int value 10")
//	case 0.0: print("i am 0.0")
//	case [2, 1]: print("i am [2, 1]")
//	default: fatalError()
//		
//	}
//}
