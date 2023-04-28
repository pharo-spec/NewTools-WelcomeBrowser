"
Ennumeration for the different themes availabla (dark, light)
"
Class {
	#name : #StWelcomeTheme,
	#superclass : #Object,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'NewTools-WelcomeBrowser'
}

{ #category : #accessing }
StWelcomeTheme class >> all [

	^ { self light. self dark }
]

{ #category : #'private - utils' }
StWelcomeTheme class >> compileAllImageContents [
	<script>

	self allSubclassesDo: [ :each | each compileImageContents ]
	
]

{ #category : #'private - utils' }
StWelcomeTheme class >> compileImageContents [
	| bits string |

	bits := self sourceImageFile binaryReadStreamDo:   [ :stream |
	ByteArray streamContents: [  :byteArray | byteArray nextPutAll: stream contents  ]  ].

	string := String streamContents: [ :stream |
	stream << '#[ '.
		bits 
			do: [ :each | stream print: each  ]
			separatedBy: [ stream space ].
		stream << ' ]' ].

	self 
		compile: 'imageContents 

	^ ', string
		classified: 'private'
]

{ #category : #accessing }
StWelcomeTheme class >> dark [

	^ StWelcomeDarkTheme uniqueInstance
]

{ #category : #accessing }
StWelcomeTheme class >> light [

	^ StWelcomeLightTheme uniqueInstance
]

{ #category : #'private - utils' }
StWelcomeTheme class >> sourceImageFile [
		
	^ self subclassResponsibility
]

{ #category : #'instance creation' }
StWelcomeTheme class >> uniqueInstance [

	self = StWelcomeTheme
		ifTrue: [ self error: 'Use one of my children' ].
	^ uniqueInstance ifNil: [ self basicNew initialize ]
]

{ #category : #accessing }
StWelcomeTheme >> activate [

	self themeClass beCurrent
]

{ #category : #accessing }
StWelcomeTheme >> image [

	^ PNGReadWriter formFromStream: self imageContents readStream
]

{ #category : #private }
StWelcomeTheme >> imageContents [

	^ self subclassResponsibility
]

{ #category : #testing }
StWelcomeTheme >> isActive [

	^ UITheme current class = self themeClass
]

{ #category : #accessing }
StWelcomeTheme >> label [

	self subclassResponsibility
]

{ #category : #accessing }
StWelcomeTheme >> themeClass [

	^ self subclassResponsibility
]
