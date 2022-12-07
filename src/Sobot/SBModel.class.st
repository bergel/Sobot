Class {
	#name : #SBModel,
	#superclass : #SBObject,
	#instVars : [
		'entries',
		'users'
	],
	#category : #Sobot
}

{ #category : #building }
SBModel >> build [

	| allUsersId u |
	allUsersId := (entries collect: #user) removeDuplicates.
	users := allUsersId collect: [ :id | SBUser new id: id ].
	
	entries do: [ :e |
		u := (self getUserFromId: e user).
		u addEntry: e ]
]

{ #category : #'as yet unclassified' }
SBModel >> getUserFromId: anId [
	^ users detect: [ :u | u id = anId ]
]

{ #category : #'as yet unclassified' }
SBModel >> importContent: aString [

	| lines |
	lines := aString lines.
	lines do: [ :l | 
		entries add: (SBEntry fromLine: l) ]
]

{ #category : #initialization }
SBModel >> initialize [
	super initialize.
	entries := OrderedCollection new
]

{ #category : #'as yet unclassified' }
SBModel >> numberOfEntries [
	^ entries size
]

{ #category : #accessing }
SBModel >> users [
	^ users
]
