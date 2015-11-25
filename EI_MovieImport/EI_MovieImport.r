/*
	File:		EI_MovieImport.r
	
	Description: Resources for QuickTime movie import component sample

	Author:		QuickTime Engineering, dts

	Copyright: 	� Copyright 1999 - 2005 Apple Computer, Inc. All rights reserved.
	
	Disclaimer:	IMPORTANT:  This Apple software is supplied to you by Apple Computer, Inc.
				("Apple") in consideration of your agreement to the following terms, and your
				use, installation, modification or redistribution of this Apple software
				constitutes acceptance of these terms.  If you do not agree with these terms,
				please do not use, install, modify or redistribute this Apple software.

				In consideration of your agreement to abide by the following terms, and subject
				to these terms, Apple grants you a personal, non-exclusive license, under Apple�s
				copyrights in this original Apple software (the "Apple Software"), to use,
				reproduce, modify and redistribute the Apple Software, with or without
				modifications, in source and/or binary forms; provided that if you redistribute
				the Apple Software in its entirety and without modifications, you must retain
				this notice and the following text and disclaimers in all such redistributions of
				the Apple Software.  Neither the name, trademarks, service marks or logos of
				Apple Computer, Inc. may be used to endorse or promote products derived from the
				Apple Software without specific prior written permission from Apple.  Except as
				expressly stated in this notice, no other rights or licenses, express or implied,
				are granted by Apple herein, including but not limited to any patent rights that
				may be infringed by your derivative works or by other works in which the Apple
				Software may be incorporated.

				The Apple Software is provided by Apple on an "AS IS" basis.  APPLE MAKES NO
				WARRANTIES, EXPRESS OR IMPLIED, INCLUDING WITHOUT LIMITATION THE IMPLIED
				WARRANTIES OF NON-INFRINGEMENT, MERCHANTABILITY AND FITNESS FOR A PARTICULAR
				PURPOSE, REGARDING THE APPLE SOFTWARE OR ITS USE AND OPERATION ALONE OR IN
				COMBINATION WITH YOUR PRODUCTS.

				IN NO EVENT SHALL APPLE BE LIABLE FOR ANY SPECIAL, INDIRECT, INCIDENTAL OR
				CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
				GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
				ARISING IN ANY WAY OUT OF THE USE, REPRODUCTION, MODIFICATION AND/OR DISTRIBUTION
				OF THE APPLE SOFTWARE, HOWEVER CAUSED AND WHETHER UNDER THEORY OF CONTRACT, TORT
				(INCLUDING NEGLIGENCE), STRICT LIABILITY OR OTHERWISE, EVEN IF APPLE HAS BEEN
				ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
				
	Change History (most recent first):
        <5>     06/28/05    dts     added X86 to platform array
		<4>     05/07/03    dts     added 'thnr' resource for mime types and 'mcfg'
		<3>		06/12/01	dts		rezability for MAC and Win
		<2>	 	11/17/00	dts		updating for PPC and X	
		<1>	 	11/28/99	QTE		first file
*/

/*
    thng_RezTemplateVersion:
        0 - original 'thng' template    <-- default
        1 - extended 'thng' template	<-- used for multiplatform things
        2 - extended 'thng' template including resource map id
*/
#define thng_RezTemplateVersion 2

/*
    cfrg_RezTemplateVersion:
        0 - original					<-- default
        1 - extended
*/
#define cfrg_RezTemplateVersion 1

#if TARGET_REZ_CARBON_MACHO
    #include <Carbon/Carbon.r>
    #include <QuickTime/QuickTime.r>
	#undef __CARBON_R__
	#undef __CORESERVICES_R__
	#undef __CARBONCORE_R__
	#undef __COMPONENTS_R__
#else
    #include "ConditionalMacros.r"
    #include "MacTypes.r"
    #include "Components.r"
    #include "QuickTimeComponents.r"
    #include "CodeFragments.r"
	#undef __COMPONENTS_R__
#endif

#include "EI_MovieImportVersion.h"

// These flags specify information about the capabilities of the component
// Can import from files
// Can create a movie from a file without having to write to a separate disk file
// Can accept a data reference (such as a handle) as the source for the import
#define kEI_MovieImportFlags \
		(canMovieImportFiles | canMovieImportInPlace | canMovieImportDataReferences | canMovieImportValidateFile | canMovieImportValidateDataReferences | hasMovieImportMIMEList)

// Component Manager Thing
resource 'thng' (512) {
	'eat ',									// Type
	'EIDI',									// SubType
	'vide',									// Manufacturer
	                                        // For 'eat ' the media type supported by the component
											// - use componentHasMultiplePlatforms
	0,										// not used Component flags
	0,										// not used Component flags Mask
	0,										// not used Code Type
	0,										// not used Code ID
	'STR ',									// Name Type
	512,									// Name ID
	0,										// Info Type
	0,										// Info ID
	0,										// Icon Type
	0,										// Icon ID
	kEI_MovieImportVersion,					// Version
	componentHasMultiplePlatforms +			// Registration Flags
	componentDoAutoVersion,
	0,										// Resource ID of Icon Family
	{
#if TARGET_OS_MAC							// COMPONENT PLATFORM INFORMATION ----------------------
	#if TARGET_REZ_CARBON_MACHO
        #if !(TARGET_REZ_MAC_PPC || TARGET_REZ_MAC_X86)
        	#error "Platform architecture not defined, TARGET_REZ_MAC_PPC and/or TARGET_REZ_MAC_X86 must be defined!"
        #endif
        #if TARGET_REZ_MAC_PPC
            kEI_MovieImportFlags, 
            'dlle',								// Code Resource type - Entry point found by symbol name 'dlle' resource
            512,								// ID of 'dlle' resource
            platformPowerPCNativeEntryPoint,	// PPC
        #endif
        #if TARGET_REZ_MAC_X86
			kEI_MovieImportFlags,
			'dlle',
            512,
            platformIA32NativeEntryPoint,		// INTEL
        #endif
	#elif TARGET_REZ_CARBON_CFM
        #error "Obsolete, new components should not be built for this configuration."
		kEI_MovieImportFlags,				// Component Flags
		'cfrg',								// Special Case: data-fork based code fragment
		512,	 							/* Code ID usage for CFM components:
												0 (kCFragResourceID) - This means the first member in the code fragment;
													Should only be used when building a single component per file. When doing so
													using kCFragResourceID simplifies things because a custom 'cfrg' resource is not required
												n - This value must match the special 'cpnt' qualifier 1 in the custom 'cfrg' resource */
		platformPowerPCNativeEntryPoint,	// Platform Type (response from gestaltComponentPlatform or failing that, gestaltSysArchitecture)
	#elif TARGET_REZ_MAC_PPC
        #error "Obsolete, new components should not be built for this configuration."
		kEI_MovieImportFlags, 
		'eat ',								// Code Type
		512,								// Code ID
		platformPowerPC,
	#elif TARGET_REZ_MAC_68K
    	#error "Obsolete, new components should not be built for this configuration."
		kEI_MovieImportFlags,
		'eat ',
		512,
		platform68k,
	#else
		#error "At least one TARGET_REZ_XXX_XXX platform must be defined."
	#endif
#endif
#if TARGET_OS_WIN32
	kEI_MovieImportFlags, 
	'dlle',
	512,
	platformWin32,
#endif
	},
	'thnr', 512							// Component public resource identifier
};

// Component Alias
resource 'thga' (513) {
	'eat ',								// Type
	'EIM ', 							// Subtype - this must be in uppercase. It will match an ".eim" suffix case-insensitively.
	'vide',								// Manufaturer - for 'eat ' the media type supported by the component
	kEI_MovieImportFlags |				// Component Flags
	movieImportSubTypeIsFileExtension,	// The subtype is a file name suffix
	0,									// Component Flags Mask
	0, 									// Code Type
	0,									// Code ID
	'STR ',								// Name Type
	512,								// Name ID
	0,									// Info Type
	0,									// Info ID 
	0,									// Icon Type 
	0,									// Icon ID
										// TARGET COMPONENT ---------------
	'eat ',								// Type
	'EIDI',								// SubType
	'vide',								// Manufaturer
	0,									// Component Flags
	0,									// Component Flags Mask
	'thnr', 512,						// Component public resource identifier
	cmpAliasOnlyThisFile
};

// Import components should include a public component resource holding the same data that
// MovieImportGetMIMETypeList would return. This public resource's type and ID should be 'mime' and 1,
// respectively. By including this public resource, QuickTime and applications don't need to open the
// import component and call MovieImportGetMIMETypeList to determine the MIME types the importer supports.
// In the absence of this resource, QuickTime and applications will use MovieImportGetMIMETypeList  
//
// Component public resource
resource 'thnr' (512) {
	{
		'mime', 1, 0, 
		'mime', 512, 0,
		
		'mcfg', 1, 0,
		'mcfg', 512, 0
	} 
};

// QuickTime Media Configuration Resources ('mcfg' aka kQTMediaConfigResourceType) are used by the QuickTime MIME
// Configuration Control Panel to build and configure its User Interface. The 'mcfg' resource is also used by the
// QuickTime Plug-In to build a list of MIME types it registers for, and to figure out how to open files.
// In a future version of QuickTime for Windows the 'mcfg' resource will be used for the File Type Registration Control Panel.
// Some, but not all of the information contained within the 'mcfg' resources is available in other places in a component.
// However not everything is available, and not all in one place for example, Group ID, Plug-In, Application Flags and so on.
//
// Every Movie Importer ('eat ') and Graphics Importer ('grip') component should really have one.
//
// If either or both of the kQTMediaConfigCanUseApp and kQTMediaConfigCanUsePlugin flags are set, the MIME type will
// automatically show up in the MIME Configuration Control Panel allowing a user to choose how they want QuickTime to handle
// the file, if at all.
// 
// If the kQTMediaConfigUsePluginByDefault flag is set, QuickTime will automatically register the MIME type for the
// QuickTime plug-in with all browsers on both platforms.
//
// Added in QuickTime 6
resource 'mcfg' (512)
{
	kVersionDoesntMatter,					// Version of the component this applies to
	
	{
		// The ID of the group this type belongs with, (OSType, one of kQTMediaConfigStreamGroupID, etc.)
		// This flag determines which group this MIME type will be listed under in the MIME Configuration Control Panel
		kQTMediaConfigVideoGroupID,
		
		// MIME config flags (unsigned long, one or more of kQTMediaConfigCanUseApp, etc.)
		kQTMediaConfigUseAppByDefault		// By default, associate with application specified below instead of the QuickTime plug-in
			| kQTMediaConfigCanUseApp		// This type can be associated with an application
			| kQTMediaConfigCanUsePlugin	// This type can be associated with the QuickTime plug-in
			| kQTMediaConfigBinaryFile,		// The file is binary, not just text

		'EIDI',								// MacOS file type when saved (OSType)
		'TVOD',								// MacOS file creator when saved (OSType)

		// Component information, used by the QuickTime plug-in to find the component to open this type of file
		'eat ',								// Component type (OSType)
		'EIDI',								// Component subtype (OSType)
		'vide',								// Component manufacturer (OSType)
		kEI_MovieImportFlags,				// Component flags
		0, 									// Flags mask

		'EIM ',								// Default file extension (OSType) - this must be in uppercase. It will match an ".eim" suffix case-insensitively.
		kQTMediaInfoNetGroup,				// QT file type group (OSType, one of kQTMediaInfoNetGroup, etc.)

		// Media type synonyms, an array of zero or more Pascal strings - none here
		{
		},

		{
			"Electric Image file",				// Media type description for MIME configuration panel and browser
			"eim",								// File extension(s), comma delimited if more than one
			"QuickTime Player",					// Opening application name for MIME configuration panel and browser
			"Electric Image Movie Importer",	// Missing software description for the missing software dialog
			"Version 1.3",						// Vendor info string (copyright, version, etc)
		},
		
		// Array of one or more MIME types that describe this media type (eg. audio/mpeg, audio/x-mpeg, etc.)
		{
			"video/electric-image",
			"video/x-electric-image",	
		},
	}
};

// Component Name
resource 'STR ' (512) {
	"Electric Image Movie Importer"
};

/* 
	  This is an example of how to build an atom container resource to hold mime types.
	  This component's GetMIMETypeList implementation simply loads this resource and returns it.
	  Please note that atoms of the same type MUST be grouped together within an atom container.
	  (Also note that "video/electric-image" may not have been registered with the IETF.)
*/
resource 'mime' (512) {
	{
		kMimeInfoMimeTypeTag,      1, "video/electric-image";
		kMimeInfoMimeTypeTag,      2, "video/x-electric-image";
		kMimeInfoFileExtensionTag, 1, "eim";
		kMimeInfoFileExtensionTag, 2, "eim";
		kMimeInfoDescriptionTag,   1, "Electric Image";
		kMimeInfoDescriptionTag,   2, "Electric Image";
	};
};

#if	TARGET_REZ_CARBON_MACHO || TARGET_REZ_WIN32
// Code Entry Point for Mach-O and Windows
	resource 'dlle' (512) {
		"EI_MovieImportComponentDispatch"
	};
#endif

#if TARGET_REZ_CARBON_CFM
// Custom extended code fragment resource
// CodeWarrior will correctly adjust the offset and length of each
// code fragment when building a MacOS Merge target
resource 'cfrg' (0) {
	{		
		extendedEntry {
			kPowerPCCFragArch,					// archType
			kIsCompleteCFrag,					// updateLevel
			kNoVersionNum,						// currentVersion
			kNoVersionNum,						// oldDefVersion
			kDefaultStackSize,					// appStackSize
			kNoAppSubFolder,					// appSubFolderID
			kImportLibraryCFrag,				// usage
			kDataForkCFragLocator,				// where
			kZeroOffset,						// offset
			kCFragGoesToEOF,					// length
			"EI Movie Importer",				// member name
			
			// Start of extended info.
			
			'cpnt',								// libKind (not kFragComponentMgrComponent == 'comp' as you might expect)
			"\0x02\0x00",						// qualifier 1 - hex 0x0200 (512) matches Code ID in 'thng'
			"",									// qualifier 2
			"",									// qualifier 3
			"Electric Image Movie Importer",	// intlName, localised
		};
	};
};
#endif