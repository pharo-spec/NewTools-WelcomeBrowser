Class {
	#name : 'BaselineOfWelcomeBrowser',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfWelcomeBrowser',
	#package : 'BaselineOfWelcomeBrowser'
}

{ #category : 'baselines' }
BaselineOfWelcomeBrowser >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec postLoadDoIt: #loadThemeImages.
		
		self microdown: spec.
		spec 
			package: 'NewTools-WelcomeBrowser' 
			with: [ spec requires: 'Microdown' ] ]
]

{ #category : 'postload' }
BaselineOfWelcomeBrowser >> loadThemeImages [
	| themeClass location |

	themeClass := self class environment classNamed: #StWelcomeTheme.
	location := 	self repositoryLocation.
	themeClass loadAllImagesFrom: location / 'resources' / 'themes'
]

{ #category : 'baselines' }
BaselineOfWelcomeBrowser >> microdown: spec [

	spec baseline: 'Microdown' with: [
		spec
			repository: 'github://pillar-markup/Microdown:Pharo12/src';
			loads: #('RichText') ]
]

{ #category : 'as yet unclassified' }
BaselineOfWelcomeBrowser >> packageRepository [
	" Tries to determine a repository from which the baseline is being loaded. Useful for 
	refering other baselines in the same repository. "

	^ (self class package mcWorkingCopy repositoryGroup repositories
		   reject: [ :each | each = MCCacheRepository uniqueInstance ])
		  ifNotEmpty: [ :repositories |
			  repositories
				  detect: [ :each | each description beginsWith: 'tonel://' ]
				  ifNone: [ repositories anyOne ] ]
		  ifEmpty: [ nil ]
]

{ #category : 'as yet unclassified' }
BaselineOfWelcomeBrowser >> repositoryLocation [
	| locationFromIceberg |

	locationFromIceberg := (self class environment classNamed: #IceRepository)
		ifNotNil: [ :iceberg |
			iceberg registry 
				detect: [ :each | each name = self repositoryName ]
				ifNone: [ nil ] ].

	^ locationFromIceberg
		ifNil: [ self packageRepository directory asFileReference parent ] 
]

{ #category : 'private' }
BaselineOfWelcomeBrowser >> repositoryName [

	^ 'NewTools-WelcomeBrowser'
]
