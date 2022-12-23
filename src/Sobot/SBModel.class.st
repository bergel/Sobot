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

{ #category : #accessing }
SBModel >> entries [
	^ entries
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
SBModel >> inspectorVisualizTime [
	<inspectorPresentationOrder: 90 title: 'Time'>

	^ SpRoassal3InspectorPresenter new
		canvas: self visualizeTime;
		yourself
]

{ #category : #visualizations }
SBModel >> maximumTime [
	^ (self entries collect: #time) max
]

{ #category : #visualizations }
SBModel >> minimumTime [
	^ (self entries collect: #time) min
]

{ #category : #'as yet unclassified' }
SBModel >> numberOfEntries [
	^ entries size
]

{ #category : #accessing }
SBModel >> users [
	^ users
]

{ #category : #visualizations }
SBModel >> visualizeTime [

	| c pY line lbl s circle some_users |
	c := RSCanvas new.
	"some_users := self users sort: [ :u1 :u2 | u1 entries size > u2 entries size ]."
	some_users := self users sortedAs: [ :u | (u entries collect: #time) median ].
	some_users doWithIndex: [ :user :index |
		pY := index * 10.
		line := RSLine new from: 0@ pY; to: 500@ pY.
		c add: line.
		
		lbl := RSLabel new text: user id; model: user.
		c add: lbl.
		lbl translateBottomLeftTo: 515@ pY.
		
		s := NSScale linear.
		s range: { 0 . 500 }.
		s domain: { self minimumTime . self maximumTime }.
		
		user entries do: [ :e |
			circle := RSCircle new size: 10; model: e; color: Color blue translucent.
			c add: circle.
			circle translateTo: (s scale: e time) @ pY.
		]
		
	].
	c @ RSCanvasController.
	^ c 
]
