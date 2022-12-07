Class {
	#name : #SBEntry,
	#superclass : #SBObject,
	#instVars : [
		'index',
		'id',
		'user',
		'commit',
		'task',
		'filePath',
		'line',
		'commonRule',
		'time',
		'clear',
		'ruleList'
	],
	#category : #Sobot
}

{ #category : #'instance creation' }
SBEntry class >> fromLine: aLine [
	| ss result |
	ss := aLine substrings: ','.
	result := self new.
	
	result index: ss first asInteger.
	result id: (ss second copyWithoutAll: '"').
	result user: ss third asInteger.
	result commit: ss fourth.
	result task: ss fifth.
	result filePath: ss sixth.
	result line: ss seventh asInteger.
	result line ifNil: [ ^ nil ].
	
	result commonRule: (ss at: 8).
	result time: (ss at: 9) asInteger.
	result clear: (ss at: 10) asInteger.
	result ruleList: (',' join: ((ss copyFrom: 11 to: ss size) collect: [ :k | k copyWithoutAll: '"'  ])).
	
	^ result
]

{ #category : #accessing }
SBEntry >> clear [

	^ clear
]

{ #category : #accessing }
SBEntry >> clear: anObject [

	clear := anObject
]

{ #category : #accessing }
SBEntry >> commit [

	^ commit
]

{ #category : #accessing }
SBEntry >> commit: anObject [

	commit := anObject
]

{ #category : #accessing }
SBEntry >> commonRule [

	^ commonRule
]

{ #category : #accessing }
SBEntry >> commonRule: anObject [

	commonRule := anObject
]

{ #category : #accessing }
SBEntry >> filePath [

	^ filePath
]

{ #category : #accessing }
SBEntry >> filePath: anObject [

	filePath := anObject
]

{ #category : #accessing }
SBEntry >> id [

	^ id
]

{ #category : #accessing }
SBEntry >> id: anObject [

	id := anObject
]

{ #category : #accessing }
SBEntry >> index [

	^ index
]

{ #category : #accessing }
SBEntry >> index: anObject [

	index := anObject
]

{ #category : #accessing }
SBEntry >> line [

	^ line
]

{ #category : #accessing }
SBEntry >> line: anObject [

	line := anObject
]

{ #category : #accessing }
SBEntry >> ruleList [

	^ ruleList
]

{ #category : #accessing }
SBEntry >> ruleList: anObject [

	ruleList := anObject
]

{ #category : #accessing }
SBEntry >> task [

	^ task
]

{ #category : #accessing }
SBEntry >> task: anObject [

	task := anObject
]

{ #category : #accessing }
SBEntry >> time [

	^ time
]

{ #category : #accessing }
SBEntry >> time: anObject [

	time := anObject
]

{ #category : #accessing }
SBEntry >> user [

	^ user
]

{ #category : #accessing }
SBEntry >> user: anObject [

	user := anObject
]
