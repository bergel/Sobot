Class {
	#name : #SBUser,
	#superclass : #SBObject,
	#instVars : [
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
	^ (self entries collect: #filePath) removeDuplicates
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

	| c pX line es |
	"Visualize File"
	c := RSCanvas new.

	self allFiles doWithIndex: [ :fileName :index |
		pX := 50 * index.
		line := RSLine new from: pX @ 0; to: pX @ 500; model: fileName; width: 3.
		line @ RSPopup.
		c add: line.
		
		es := self entriesForFile: fileName.
		self halt.
	].
	^ c @ RSCanvasController
]

{ #category : #'as yet unclassified' }
SBUser >> visualizeTime [
]
