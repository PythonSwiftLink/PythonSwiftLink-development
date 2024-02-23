
@_exported 
import PythonCore



public enum PySendResultFlag: Int32 {
	case RETURN = 0
	case ERROR = -1
	case NEXT = 1
}

public extension PySendResultFlag {
	func result() -> PySendResult {
		.init(rawValue)
	}
}
