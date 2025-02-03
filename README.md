# ACTA IMEKO Latex class file

This repository contains the source code of the LaTeX class for typesetting manuscripts for the international journal Acta IMEKO (https://acta.imeko.org/).
The online journal of IMEKO - the [International Measurement Confederation](https://www.imeko.org/).

You can download the current Release through the side link, in the **Releases** section.

## Author

[**Federico Tramarin**](https://personale.unimore.it/rubrica/dettaglio/tramarin) @ University Modena and Reggio Emilia, Italy

tramarin AT unimore.it

## INSTALLATION

At the moment the package has not yet been published on CTAN, and hence cannot be installed through the usual channels (TeX Live package manager, MikTeX, etc.).

The most simple ways to have the package working properly are:
- download the latest release and unpack it in a place of your preference;
- inside, you can find a folder named _bare article template_  which serves as a skeleton to start typing your paper.

Another convenient way could be to copy&paste the three files inside the folder _class_ (they are imeko_acta.cls, imeko_acta.bst and imeko.png) into the same folder of your LaTeX files (the sources of your paper)

**NOTE**: if you plan to use it several times, you may consider to put them in your local TEXMF folder, usually under your home dir (please refer to online guides to locate the exact position of this folder).

## HISTORY
A first draft of the class was produced by Corey Stambaugh (corey.stambaugh @ nist.gov) more or less 09/12/2018.
The class was written to mimic the template style of the ACTA IMEKO journal
https://acta.imeko.org/ which is written as a .doc file by: Thomas Bruns, Dirk Röske, Paul P. L. Regtien, Francisco Alegria

This class file was originally downloaded as SelfArx.cls.
Template Source: This template has been downloaded from: http://www.latextemplates.com/template/stylish-article
License: CC BY-NC-SA 3.0

Then, in Sept. 2023 the journal EiC (prof. F. Lamonaca) asked to produce a stable and final Latex class for Acta IMEKO, able o reproduce the same format of the MS Word template.

The main reasons for a rewrite are that matching the Word template requires quite a lot of font tunings, and obsolete commands (like \bf \it) do not support LaTeX2e's new font selection scheme, or NFSS{\bf foo}, for example, resets all font attributes which had been set earlier. also, we need new options to produce the camera ready and final version, etc.

## CHANGELOG

### Version 2.0
- Author: FT
- Date: 08/02/2024
- Notes
  - Fixed microtypography features to match the Word template
  - Completed the bibliography style class
  - many other small fixes and bug corrections
  - extensive tests for debugging carried out

### Version 1.9

### Version 1.8
- Author: FT
- Date: 08/02/2024
- Notes
  - Updated the LICENSE of this project, now under the LPPL license.
  - Corrected some serious bugs in class
    - fixed endbibliography code
    - switched to \edef with dates in titlepage to correctly support for \today
  - included _siunitx_ package by default (it's a measurement journal in the end :smile:)

### Version 1.7
- Author: FT
- Date: 06/02/2024
- Notes
  - Several enhancements on the code
  - Removed code dependencies on "titlesec" and "calc", which are now not loaded
  - Rewrote the code for the titlepage, so that standard latex commands can be used, like "title", "\begin{abstract}", etc.

### Version 1.6
- Author: FT
- Date: 01/02/2024
- Notes
  - Rewrote the code for producing the bibliography, now with bib labels hanged on the left.
  - Added the \AIBreakAtRef command to equalize last column. 
  - Automatic alternate row coloring
  - author management robust to multiple affiliations

Vers: 1.5
- Author: FT
- Date: 13/01/2024
- Notes 
  - Several bug corrections after first article sent to production.
  - Solved issues with metadata (especially author names)
  - Added the Subject and SubmissionNumber.

Vers: 1.4
- Author: FT
- Date: 12/12/2023
- Notes 
  - This version introduced some other tweaks to match the Word template
	- Now the citations are typesetted as in the word template
  - We introduced the tabularx environment to have tables with 100% column width
	- Now also the bibliography (BST) file is correct!

Vers: 1.3
- Author: FT
- Date: 03/10/2023
- Notes 
  - This version introduced all the needed tweaks to interline spaces, character expansions 
			and other minor typographical dimensions to match the Word template.
	- Currently, the same paper, if typesetted with the Word and the LaTeX templates
		renders almost identically...a part from the bibligraphy style, that needs some
		more polishings

Vers: 1.2
- Author: FT
- Date: 27/09/2023
- Notes 
  - This version finally have all the needed stuffs for a correct authors management 
	- Notably, we can reference to the corresponding author indicating the number 
			of the author in the list, this will automatically keep the name
	- Added an option to show or not the corresp. author mark
	- Symplified the structure for authors
	- Solved a serious interference between hyperref and authors names

Vers: 1.1
- Author: FT
- Date: 25/09/2023
- Notes 
  - This version adds support for all the needed PDF metadata

Vers: 1.1
- Author: FT
- Date: 25/09/2023
- Notes 
  - This version builds over v1.0 (see below). 
  - Several futher bugs have been solved 
  - Added micro typography options to adress hyphenation and letters/words spacings
  - Removed dependence on some packages (e.g. geometry)
  - Added a new authors' management method

Vers: 1.0
- Author: FT
- Date: 12/09/2023
- Notes 
  - This version builds over the first draft (see below). Several bugs have been solved 
  - Removed use of \bf \it etc.
  - Missing definitions
  - Removed unneded packges
