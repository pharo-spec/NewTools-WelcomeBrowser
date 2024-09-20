"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : 'ManifestBaselineOfWelcomeBrowser',
	#superclass : 'PackageManifest',
	#category : 'BaselineOfWelcomeBrowser-Manifest',
	#package : 'BaselineOfWelcomeBrowser',
	#tag : 'Manifest'
}

{ #category : 'code-critics' }
ManifestBaselineOfWelcomeBrowser class >> ruleClassNotReferencedRuleV1FalsePositive [

	<ignoreForCoverage>
	^ #(#(#(#RGClassDefinition #(#BaselineOfWelcomeBrowser)) #'2024-06-20T16:03:02.688992+02:00') )
]
