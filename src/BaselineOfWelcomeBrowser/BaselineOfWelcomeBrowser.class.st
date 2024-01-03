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
		spec postLoadDoIt: #loadThemeImagesWithTarget:spec:.
		
		self microdown: spec.
		spec 
			package: 'NewTools-WelcomeBrowser' 
			with: [ spec requires: 'Microdown' ] ]
]

{ #category : 'postload' }
BaselineOfWelcomeBrowser >> loadThemeImagesWithTarget: aTarget spec: spec [
	| themeClass location |

	themeClass := self class environment classNamed: #StWelcomeTheme.
	location := 	self repositoryLocation: spec.
	themeClass loadAllImagesFrom: location / 'resources' / 'themes'
]

{ #category : 'baselines' }
BaselineOfWelcomeBrowser >> microdown: spec [

	spec baseline: 'Microdown' with: [
		spec
			repository: 'github://pillar-markup/Microdown:Pharo12/src';
			loads: #('RichText') ]
]

{ #category : 'private' }
BaselineOfWelcomeBrowser >> repositoryLocation: spec [

	| locationFromIceberg |
	locationFromIceberg := (self class environment classNamed:
		                        #IceRepository) ifNotNil: [ :iceberg |
		                       iceberg registry
			                       detect: [ :each |
			                       each name = self repositoryName ]
			                       ifNone: [ nil ] ].

	^ locationFromIceberg ifNil: [
		  | tonelURL |
		  tonelURL := self packageRepositoryURLForSpec: spec.
		  (TonelRepository basicFromUrl: tonelURL) directory asFileReference
			  parent ]
]

{ #category : 'private' }
BaselineOfWelcomeBrowser >> repositoryName [

	^ 'NewTools-WelcomeBrowser'
]
