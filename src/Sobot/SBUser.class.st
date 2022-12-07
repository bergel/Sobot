Class {
	#name : #SBUser,
	#superclass : #SBObject,
	#instVars : [
		'model',
		'id',
		'entries'
	],
	#category : #Sobot
}

{ #category : #adding }
SBUser >> addEntry: anEntry [
	entries add: anEntry
]

{ #category : #enumerating }
SBUser >> allFiles [
	^ (self entries collect: #filePath) removeDuplicates sorted
]

{ #category : #accessing }
SBUser >> entries [

	^ entries
]

{ #category : #accessing }
SBUser >> entries: anObject [

	entries := anObject
]

{ #category : #'as yet unclassified' }
SBUser >> entriesForFile: aFileName [
	^ entries select: [ :e | e filePath = aFileName ]
]

{ #category : #accessing }
SBUser >> id [

	^ id
]

{ #category : #accessing }
SBUser >> id: anObject [

	id := anObject
]

{ #category : #initialization }
SBUser >> initialize [
	super initialize.
	entries := OrderedCollection new
]

{ #category : #'as yet unclassified' }
SBUser >> inspectorVisualizeFiles [
	<inspectorPresentationOrder: 90 title: 'Files'>

	^ SpRoassal3InspectorPresenter new
		canvas: self visualizeFiles;
		yourself
]

{ #category : #accessing }
SBUser >> model [

	^ model
]

{ #category : #accessing }
SBUser >> model: anObject [

	model := anObject
]

{ #category : #'as yet unclassified' }
SBUser >> numberOfEntries [
	^ entries size
]

{ #category : #printing }
SBUser >> printOn: str [
	super printOn: str.
	str nextPut: $<.
	id ifNotNil: [ str nextPutAll: id asString ].
	str nextPut: $>.
]

{ #category : #'as yet unclassified' }
SBUser >> visualizeFiles [

	| c pX line es ee label |
	"Visualize File"
	c := RSCanvas new.

	self allFiles doWithIndex: [ :fileName :index |
		pX := 50 * index.
		line := RSLine new from: pX @ 0; to: pX @ 500; model: fileName; width: 3.
		line @ RSPopup.
		c add: line.
		
		label := RSLabel new text: (fileName substrings: '/.') second.
		c add: label.
		label rotateByDegrees: -45.
		label translateTo: pX @ -30.
		
		es := (self entriesForFile: fileName).
		es do: [ :e |
			| color |
			"color := (self model colorForRule: e commonRule) alpha: 0.3."
			color := Color blue alpha: 0.3.
			
			ee := RSCircle new size: 10; color: color; model: e.
			c add: ee.
			ee translateTo: pX @ (e line * 3)
		].
	].
	^ c @ RSCanvasController
]

{ #category : #'as yet unclassified' }
SBUser >> visualizeTime [
]
