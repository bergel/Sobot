Class {
	#name : #SBFile,
	#superclass : #SBObject,
	#instVars : [
		'model',
		'entries',
		'user'
	],
	#category : #Sobot
}

{ #category : #accessing }
SBFile >> entries [

	^ entries
]

{ #category : #accessing }
SBFile >> entries: anObject [

	entries := anObject
]

{ #category : #accessing }
SBFile >> model [

	^ model
]

{ #category : #accessing }
SBFile >> model: anObject [

	model := anObject
]

{ #category : #accessing }
SBFile >> user [

	^ user
]

{ #category : #accessing }
SBFile >> user: anObject [

	user := anObject
]
