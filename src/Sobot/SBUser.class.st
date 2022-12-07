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

{ #category : #accessing }
SBUser >> entries [

	^ entries
]

{ #category : #accessing }
SBUser >> entries: anObject [

	entries := anObject
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
