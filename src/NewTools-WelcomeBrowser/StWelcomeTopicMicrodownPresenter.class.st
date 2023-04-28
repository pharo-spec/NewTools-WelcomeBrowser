Class {
	#name : #StWelcomeTopicMicrodownPresenter,
	#superclass : #StWelcomeTopicPresenter,
	#category : #'NewTools-WelcomeBrowser'
}

{ #category : #accessing }
StWelcomeTopicMicrodownPresenter >> contents: aString [

	contentPresenter documentFromString: aString
	
]

{ #category : #initialization }
StWelcomeTopicMicrodownPresenter >> initializePresenters [

	super initializePresenters.
	contentPresenter := self instantiate: MicrodownPresenter
]
