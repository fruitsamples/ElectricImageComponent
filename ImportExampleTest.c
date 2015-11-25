/*
	File:		ImportExampleTest.c
	
	Description: Code which exercises the Electric Image importer suite of components

	Author:		QuickTime Engineering
	
	Copyright: 	� Copyright 1999-2003 Apple Computer, Inc. All rights reserved.
	
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
	   <3>      11/10/02    dts			updated for QT 6
	   <2>	 	12/08/00	dts			updated for X
	   <1>	 	11/28/99	QTE			first file
*/

#if __MACH__
    #include <Carbon/Carbon.h>
    #include <QuickTime/QuickTime.h>
#else
    #include <ConditionalMacros.h>
    #include <Fonts.h>
    #include <ImageCompression.h>
    #include <Movies.h>
#endif

#include "GetFile.h"

// When building the linked sample each component includes a
// register call which are prototyped here.
extern void EI_GraphicsImporterRegister(void);
extern void EI_CodecRegister(void);
extern void EI_MovieImporterRegister(void);

int main(void)
{
	OSErr err;
	WindowRef w = NULL;
	GraphicsImportComponent gi = NULL;
	Rect r = {100, 100, 130, 130};
	FSSpec theFSSpec;
	OSType fileType = FOUR_CHAR_CODE('EIDI');
	
	#if TARGET_API_MAC_CARBON
		// Initialize for Carbon and QuickTime		
		InitCursor();
		EnterMovies(); // need this for X
	#else
		InitGraf(&qd.thePort);
		InitFonts();
		InitWindows();
		InitMenus();
		TEInit();
		InitDialogs(0L);
		InitCursor();
		MaxApplZone();
	#endif // TARGET_API_MAC_CARBON

	// Register the built in components
	EI_GraphicsImporterRegister();
	EI_CodecRegister();
	EI_MovieImporterRegister();

	w = NewCWindow(NULL, &r, "\pElectricImage Test", false, 0, (WindowPtr)-1, false, 0);

	SetPortWindowPort(w);

	err = GetOneFileWithPreview(1, &fileType, &theFSSpec, NULL);
	if (err) return 1;

	err = GetGraphicsImporterForFile(&theFSSpec, &gi);
	if (err) return 1;

	err = GraphicsImportGetNaturalBounds(gi, &r);
	if (err) return 1;

	SizeWindow(w, r.right - r.left, r.bottom - r.top, false);
	ShowWindow(w);

	GraphicsImportDraw(gi);

	#if TARGET_API_MAC_CARBON
		// Needed for QuickTime 6 on X or you're not going to see anything
		// See TN2060 - http://developer.apple.com/technotes/tn2002/tn2060.html
	if (QDIsPortBuffered(GetWindowPort(w)))
		QDFlushPortBuffer(GetWindowPort(w), NULL);
	#endif

	while (!Button())
		;
	
	return 0;
}