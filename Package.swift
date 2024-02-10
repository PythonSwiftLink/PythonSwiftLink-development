// swift-tools-version:5.9

import PackageDescription

let package = Package(
	name: "PythonSwiftLink",
	platforms: [.macOS(.v11), .iOS(.v13)],
	products: [
		.library(
			name: "PySwiftCore",
			targets: ["PySwiftCore"]
		),
		.library(
			name: "PySwiftObject",
			targets: ["PySwiftObject"]
		),
		.library(
			name: "PyCollection",
			targets: ["PyCollection"]
		),
		.library(
			name: "PyUnpack",
			targets: ["PyUnpack"]
		),
		.library(
			name: "PyExecute",
			targets: ["PyExecute"]
		),
		.library(
			name: "PyCallable",
			targets: ["PyCallable"]
		),
		.library(
			name: "PyMemoryView",
			targets: ["PyMemoryView"]
		),
		.library(
			name: "PyDictionary",
			targets: ["PyDictionary"]
		),
		.library(
			name: "PyUnicode",
			targets: ["PyUnicode"]
		),
		.library(
			name: "PyExpressible",
			targets: ["PyExpressible"]
		),
		
	],
	dependencies: [
		.package(path: "../PythonCore"),
		//		.package(url: "https://github.com/PythonSwiftLink/PythonCore", .upToNextMajor(from: .init(311, 0, 0)))
		//.package(url: "https://github.com/PythonSwiftLink/PythonTestSuite", branch: "master"),
			.package(url: "https://github.com/apple/swift-docc-plugin", from: "1.0.0"),
	],
	
	targets: [
		.target(
			name: "PyExecute",
			dependencies: [
				"PySwiftCore",
				//"PyDecode",
				//"PyEncode"
			]
		),
		.target(
			name: "PyCallable",
			dependencies: [
				"PySwiftCore",
				"PyDecode",
				"PyEncode"
			]
		),
		.target(
			name: "PyUnpack",
			dependencies: [
				"PySwiftCore",
				"PyCollection",
				"PyDecode",
				"PyEncode"
			]
		),
		.target(
			name: "PyExpressible",
			dependencies: [
				"PySwiftCore",
//				"PyDecode",
//				"PyEncode"
			]
		),
		.target(
			name: "PyCollection",
			dependencies: [
				"PySwiftCore",
				"PyDecode",
				"PyEncode"
			]
		),
		.target(
			name: "PyMemoryView",
			dependencies: [
				"PySwiftCore",
				"PyDecode",
//				"PyEncode"
			]
		),
		.target(
			name: "PyUnicode",
			dependencies: [
				"PySwiftCore",
				"PyDecode",
				//				"PyEncode"
			]
		),
		.target(
			name: "PyDictionary",
			dependencies: [
				"PySwiftCore",
				"PyDecode",
				"PyEncode"
			]
		),
		.target(
			name: "PyDecode",
			dependencies: [
				"PySwiftCore",
			]
		),
		.target(
			name: "PyEncode",
			dependencies: [
				"PySwiftCore",
			]
		),
		
		
		
		
		.target(
			name: "PySwiftObject",
			dependencies: [
				//"PythonCore",
				"PySwiftCore",
				"_PySwiftObject"
				//"PythonTypeAlias"
			],
			resources: [
				
			],
			swiftSettings: []
		),
		.target(
			name: "PySwiftCore",
			dependencies: [
				"PythonCore",
				"_PySwiftObject"
				//"PythonTypeAlias"
			],
			resources: [
				
			],
			swiftSettings: []
		),
		
			.target(
				name: "_PySwiftObject",
				dependencies: [
					"PythonCore"
				]
			)
		//			.target(
		//				name: "PythonCore",
		//				dependencies: ["Python"],
		//				path: "Sources/PythonCore",
		//				linkerSettings: [
		//					.linkedLibrary("ncurses"),
		//					.linkedLibrary("sqlite3"),
		//					.linkedLibrary("z"),
		//				]
		//			),
		//			.target(
		//				name: "PythonTypeAlias",
		//				dependencies: [
		//					"PythonCore",
		//				]
		//			),
		
		//		.binaryTarget(name: "Python", path: "Sources/PythonCore/Python.xcframework"),
		
	]
)
