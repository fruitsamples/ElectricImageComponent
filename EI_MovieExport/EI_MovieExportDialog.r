/*
	File:		EI_MovieExportDialog.r
	
	Description: More Mac-style resources for the Movie Export Component.

	Author:		QuickTime team

	Copyright: 	� Copyright 2003 Apple Computer, Inc. All rights reserved.
	
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

*/

data 'CNTL' (512) {
	$"001A 001A 002A 010F 0000 0100 0032 0200"            /* .....*.......2.. */
	$"03F9 0000 0000 0643 6F6C 6F72 3A"                   /* .�.....Color: */
};

data 'CNTL' (513) {
	$"0038 001A 0048 010F 0000 0100 008C 0201"            /* .8...H.......�.. */
	$"03F9 0000 0000 1246 7261 6D65 7320 7065"            /* .�.....Frames pe */
	$"7220 7365 636F 6E64 3A"                             /* r second: */
};

data 'DITL' (512) {
	$"0003 0000 0000 005F 00CC 0073 010E 0402"            /* ......._.�.s.... */
	$"4F4B 0000 0000 005F 007B 0073 00BD 0406"            /* OK....._.{.s.�.. */
	$"4361 6E63 656C 0000 0000 001A 001A 002A"            /* Cancel.........* */
	$"010F 0702 0200 0000 0000 0038 001A 0048"            /* ...........8...H */
	$"010F 0702 0201"                                     /* ...... */
};

data 'DLOG' (512) {
	$"015C 0140 01E8 026C 0005 0000 0000 0000"            /* .\.@.�.l........ */
	$"0000 0200 1E45 6C65 6374 7269 6320 496D"            /* .....Electric Im */
	$"6167 6520 4578 706F 7274 2053 6574 7469"            /* age Export Setti */
	$"6E67 7300 B00A"                                     /* ngs.�� */
};

data 'MENU' (513) {
	$"B1E0 0000 0000 0000 0000 FFFF FFFB 0100"            /* ��........����.. */
	$"0442 6573 7400 0000 0001 2D00 0000 0001"            /* .Best.....-..... */
	$"3800 0000 0002 3130 0000 0000 0231 3200"            /* 8.....10.....12. */
	$"0000 0002 3135 0000 0000 0232 3400 0000"            /* ....15.....24... */
	$"0002 3235 0000 0000 0233 3000 0000 0000"            /* ..25.....30..... */
};

data 'MENU' (512) {
	$"0200 0000 0000 0000 0000 FFFF FFFB 0100"            /* ..........����.. */
	$"0A42 6573 7420 4465 7074 6800 0000 0001"            /* �Best Depth..... */
	$"2D00 0000 000F 426C 6163 6B20 616E 6420"            /* -.....Black and  */
	$"5768 6974 6500 0000 0009 3235 3620 4772"            /* White....�256 Gr */
	$"6179 7300 0000 000A 3235 3620 436F 6C6F"            /* ays....�256 Colo */
	$"7273 0000 0000 1354 686F 7573 616E 6473"            /* rs.....Thousands */
	$"206F 6620 636F 6C6F 7273 0000 0000 134D"            /*  of colors.....M */
	$"696C 6C69 6F6E 7320 6F66 2063 6F6C 6F72"            /* illions of color */
	$"732B 0000 0000 00"                                  /* s+..... */
};

data 'dlgx' (512) {
	$"0000 0000 000F"                                     /* ...... */
};