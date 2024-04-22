//
//  File.swift
//  
//
//  Created by CodeBuilder on 16/11/2023.
//

import Foundation
import PySwiftCore
import PythonCore

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

extension UnsafeMutablePointer where Pointee == PyTypeObject {
	
	static let PyType: Self = .init(&PyType_Type)
	static let PyBaseObject: Self = .init(&PyBaseObject_Type)
	static let PySuper: Self = .init(&PySuper_Type)
	static let _None: Self = .init(&_PyNone_Type)
	static let PyNotImplemented: Self = .init(&_PyNotImplemented_Type)
	static let PyByteArray: Self = .init(&PyByteArray_Type)
	static let PyByteArrayIter: Self = .init(&PyByteArrayIter_Type)
	static let PyUnicode: Self = .init(&PyUnicode_Type)
	static let PyUnicodeIter: Self = .init(&PyUnicodeIter_Type)
	static let PyLong: Self = .init(&PyLong_Type)
	static let PyBool: Self = .init(&PyBool_Type)
	static let PyFloat: Self = .init(&PyFloat_Type)
	static let PyComplex: Self = .init(&PyComplex_Type)
	static let PyRange: Self = .init(&PyRange_Type)
	static let PyRangeIter: Self = .init(&PyRangeIter_Type)
	static let PyLongRangeIter: Self = .init(&PyLongRangeIter_Type)
	static let PyManagedBuffer: Self = .init(&_PyManagedBuffer_Type)
	static let PyMemoryView: Self = .init(&PyMemoryView_Type)
	static let PyTuple: Self = .init(&PyTuple_Type)
	static let PyTupleIter: Self = .init(&PyTupleIter_Type)
	static let PyList: Self = .init(&PyList_Type)
	static let PyListIter: Self = .init(&PyListIter_Type)
	static let PyListRevIter: Self = .init(&PyListRevIter_Type)
	static let PyDict: Self = .init(&PyDict_Type)
	static let PyDictKeys: Self = .init(&PyDictKeys_Type)
	static let PyDictValues: Self = .init(&PyDictValues_Type)
	static let PyDictItems: Self = .init(&PyDictItems_Type)
	static let PyDictIterKey: Self = .init(&PyDictIterKey_Type)
	static let PyDictIterValue: Self = .init(&PyDictIterValue_Type)
	static let PyDictIterItem: Self = .init(&PyDictIterItem_Type)
	static let PyDictRevIterKey: Self = .init(&PyDictRevIterKey_Type)
	static let PyDictRevIterItem: Self = .init(&PyDictRevIterItem_Type)
	static let PyDictRevIterValue: Self = .init(&PyDictRevIterValue_Type)
	static let PyODict: Self = .init(&PyODict_Type)
	static let PyODictIter: Self = .init(&PyODictIter_Type)
	static let PyODictKeys: Self = .init(&PyODictKeys_Type)
	static let PyODictItems: Self = .init(&PyODictItems_Type)
	static let PyODictValues: Self = .init(&PyODictValues_Type)
	static let PyEnum: Self = .init(&PyEnum_Type)
	static let PyReversed: Self = .init(&PyReversed_Type)
	static let PySet: Self = .init(&PySet_Type)
	static let PyFrozenSet: Self = .init(&PyFrozenSet_Type)
	static let PySetIter: Self = .init(&PySetIter_Type)
	static let PyCFunction: Self = .init(&PyCFunction_Type)
	static let PyCMethod: Self = .init(&PyCMethod_Type)
	static let PyModule: Self = .init(&PyModule_Type)
	static let PyModuleDef: Self = .init(&PyModuleDef_Type)
	static let PyFunction: Self = .init(&PyFunction_Type)
	static let PyClassMethod: Self = .init(&PyClassMethod_Type)
	static let PyStaticMethod: Self = .init(&PyStaticMethod_Type)
	static let PyMethod: Self = .init(&PyMethod_Type)
	static let PyInstanceMethod: Self = .init(&PyInstanceMethod_Type)
	static let PyStdPrinter: Self = .init(&PyStdPrinter_Type)
	static let PyCapsule: Self = .init(&PyCapsule_Type)
	static let PyCode: Self = .init(&PyCode_Type)
	static let PyFrame: Self = .init(&PyFrame_Type)
	static let PyTraceBack: Self = .init(&PyTraceBack_Type)
	static let PySlice: Self = .init(&PySlice_Type)
	static let PyEllipsis: Self = .init(&PyEllipsis_Type)
	static let PyCell: Self = .init(&PyCell_Type)
	static let PySeqIter: Self = .init(&PySeqIter_Type)
	static let PyCallIter: Self = .init(&PyCallIter_Type)
	static let PyGen: Self = .init(&PyGen_Type)
	static let PyCoro: Self = .init(&PyCoro_Type)
	static let PyCoroWrapper: Self = .init(&_PyCoroWrapper_Type)
	static let PyAsyncGen: Self = .init(&PyAsyncGen_Type)
	static let PyAsyncGenASend: Self = .init(&_PyAsyncGenASend_Type)
	static let PyAsyncGenWrappedValue: Self = .init(&_PyAsyncGenWrappedValue_Type)
	static let PyAsyncGenAThrow: Self = .init(&_PyAsyncGenAThrow_Type)
	static let PyClassMethodDescr: Self = .init(&PyClassMethodDescr_Type)
	static let PyGetSetDescr: Self = .init(&PyGetSetDescr_Type)
	static let PyMemberDescr: Self = .init(&PyMemberDescr_Type)
	static let PyMethodDescr: Self = .init(&PyMethodDescr_Type)
	static let PyWrapperDescr: Self = .init(&PyWrapperDescr_Type)
	static let PyDictProxy: Self = .init(&PyDictProxy_Type)
	static let PyProperty: Self = .init(&PyProperty_Type)
	static let PyMethodWrapper: Self = .init(&_PyMethodWrapper_Type)
	static let PyGenericAliasType: Self = .init(&Py_GenericAliasType)
	static let PyWeakrefRefType: Self = .init(&_PyWeakref_RefType)
	static let PyWeakrefProxyType: Self = .init(&_PyWeakref_ProxyType)
	static let PyWeakrefCallableProxyType: Self = .init(&_PyWeakref_CallableProxyType)
	static let PyPickleBuffer: Self = .init(&PyPickleBuffer_Type)
	static let PyContext: Self = .init(&PyContext_Type)
	static let PyContextVar: Self = .init(&PyContextVar_Type)
	static let PyFilter: Self = .init(&PyFilter_Type)
	static let PyMap: Self = .init(&PyMap_Type)
	static let PyZip: Self = .init(&PyZip_Type)
	
}


//public var pyLong_Type = UnsafeMutablePointer(&PyLong_Type)//PythonType.newType(PyLong_Type)!
//public let pyFloat_Type = UnsafeMutablePointer(&PyFloat_Type)
//public var pyUnicode_Type = UnsafeMutablePointer(&PyUnicode_Type)
//public let pyComplex_Type = UnsafeMutablePointer(&PyComplex_Type)
//public let pyBool_Type = UnsafeMutablePointer(&PyBool_Type)
//
//public let pyList_Type = UnsafeMutablePointer(&PyList_Type)
//public let pyDict_Type = UnsafeMutablePointer(&PyDict_Type)
//public let pyTuple_Type = UnsafeMutablePointer(&PyTuple_Type)
//public let pySet_Type = UnsafeMutablePointer(&PySet_Type)
//
//public let pyBytes_Type = UnsafeMutablePointer(&PyBytes_Type)
//public let pyByteArray_Type = UnsafeMutablePointer(&PyByteArray_Type)
//public let pyMemoryView_Type = UnsafeMutablePointer(&PyMemoryView_Type)
//
//
//public let pySuper_Type = UnsafeMutablePointer(&PySuper_Type)
//public let pyFunction_Type = UnsafeMutablePointer(&PyFunction_Type)
////public let pyCallavl = PythonType.newType(PyCallable_Check(<#T##UnsafeMutablePointer<PyObject>!#>))
//
//public let pyEnum_Type = UnsafeMutablePointer(&PyEnum_Type)
//public let pyNone_Type = UnsafeMutablePointer(&_PyNone_Type)
//
//public let pyRange_Type = UnsafeMutablePointer(&PyRange_Type)
//public let pySlice_Type = UnsafeMutablePointer(&PySlice_Type)
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
