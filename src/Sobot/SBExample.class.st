Class {
	#name : #SBExample,
	#superclass : #TestCase,
	#category : #Sobot
}

{ #category : #running }
SBExample >> run [
	<script: 'self new run inspect'>
	| filePath m |
	filePath := '/Users/alexandrebergel/Dropbox/GitRepos/Sobot/data/anonData.csv'.
	m := SBModel new.
	m importContent: filePath asFileReference contents.
	m build.
	^ m
]

{ #category : #running }
SBExample >> runSmall [
	<script: 'self new run inspect'>
	| m |
	m := SBModel new.
	m importContent: SobotTest new simpleData.
	m build.
	^ m
]
