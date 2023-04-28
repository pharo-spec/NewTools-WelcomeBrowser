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
		
		self documentBrowser: spec.
		spec 
			package: 'NewTools-WelcomeBrowser' 
			with: [ spec requires: 'NewToolsDocumentBrowse' ] ]
]

{ #category : #baselines }
BaselineOfWelcomeBrowser >> documentBrowser: spec [
		
	spec 
		baseline: 'NewToolsDocumentBrowser' 
		with: [  spec repository: 'github://pharo-spec/NewTools-DocumentBrowser/src' ]
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

{ #category : #postload }
BaselineOfWelcomeBrowser >> repositoryName [

	^ 'NewTools-WelcomeBrowser'
]
