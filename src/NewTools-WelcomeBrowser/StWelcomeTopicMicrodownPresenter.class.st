"
A topic that will include microdown text.
"
Class {
	#name : 'StWelcomeTopicMicrodownPresenter',
	#superclass : 'StWelcomeTopicPresenter',
	#category : 'NewTools-WelcomeBrowser-Presenters',
	#package : 'NewTools-WelcomeBrowser',
	#tag : 'Presenters'
}

{ #category : 'accessing' }
StWelcomeTopicMicrodownPresenter >> contents: aString [

	contentPresenter documentFromString: aString
	
]

{ #category : 'initialization' }
StWelcomeTopicMicrodownPresenter >> initializePresenters [

	super initializePresenters.
	contentPresenter := self instantiate: MicrodownPresenter
]
