Class {
	#name : #BaselineOfWelcomeBrowser,
	#superclass : #BaselineOf,
	#category : #BaselineOfWelcomeBrowser
}

{ #category : #baselines }
BaselineOfWelcomeBrowser >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		spec postLoadDoIt: #loadThemeImages.
		
		self microdown: spec.
		spec 
			package: 'NewTools-WelcomeBrowser' 
			with: [ spec requires: 'Microdown' ] ]
]

{ #category : #postload }
BaselineOfWelcomeBrowser >> loadThemeImages [
	| repositoryClass themeClass location |

	repositoryClass := self class environment classNamed: #IceRepository.
	repositoryClass ifNil: [ ^ self ].
	
	themeClass := self class environment classNamed: #StWelcomeTheme.
	location := 	(repositoryClass registry 
			detect: [ :each | each name = self repositoryName ])
			location.
	
	themeClass loadAllImagesFrom: location / 'resources' / 'themes'
]

{ #category : #baselines }
BaselineOfWelcomeBrowser >> microdown: spec [

	spec baseline: 'Microdown' with: [
		spec
			repository: 'github://pillar-markup/Microdown:integration/src';
			loads: #('RichText') ]
]

{ #category : #postload }
BaselineOfWelcomeBrowser >> repositoryName [

	^ 'NewTools-WelcomeBrowser'
]
