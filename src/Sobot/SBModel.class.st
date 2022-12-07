Class {
	#name : #SBModel,
	#superclass : #SBObject,
	#instVars : [
		'entries',
		'users',
		'allRules'
	],
	#category : #Sobot
}

{ #category : #accessing }
SBModel >> allRules [
	^ (entries collect: #commonRule) asSet asSortedCollection
]

{ #category : #building }
SBModel >> build [

	| allUsersId u |
	allUsersId := (entries collect: #user) removeDuplicates.
	users := allUsersId collect: [ :id | SBUser new id: id ].
	
	entries do: [ :e |
		u := (self getUserFromId: e user).
		u model: self.
		u addEntry: e ]
]

{ #category : #accessing }
SBModel >> colorForRule: r [

	| ar colors |
	ar := self allRules.

	colors := NSScale ordinalColored: 3.	
	^ colors scale: r
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
		(l beginsWith: ',id,user,commit,task,f') not ifTrue: [ 
			| e |
			e := SBEntry fromLine: l.
			e ifNotNil: [ entries add: e ] ] ]
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
