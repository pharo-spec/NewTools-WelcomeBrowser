Class {
	#name : #BaselineOfWelcomeBrowser,
	#superclass : #BaselineOf,
	#category : #BaselineOfWelcomeBrowser
}

{ #category : #baselines }
BaselineOfWelcomeBrowser >> baseline: spec [
	<baseline>

	spec for: #'common' do: [
		self documentBrowser: spec.
		spec 
			package: 'WelcomeBrowser' 
			with: [ spec requires: 'NewToolsDocumentBrowse' ] ]
]

{ #category : #baselines }
BaselineOfWelcomeBrowser >> documentBrowser: spec [
		
	spec 
		baseline: 'NewToolsDocumentBrowser' 
		with: [  spec repository: 'github://pharo-spec/NewTools-DocumentBrowser/src' ]
]
