# ACTA IMEKO Latex class file

## Author

Federico Tramarin
Univ. Modena and Reggio Emilia, Italy
tramarin@unimore.it

## HISTORY
A first draft of the class was produced by Corey Stambaugh (corey.stambaugh @ nist.gov) more or less 09/12/2018.
The class was written to mimic the template style of the ACTA IMEKO journal
https://acta.imeko.org/ which is written as a .doc file by: Thomas Bruns, Dirk Röske, Paul P. L. Regtien, Francisco Alegria

This class file was originally downloaded as SelfArx.cls.
Template Source: This template has been downloaded from: http://www.latextemplates.com/template/stylish-article
License: CC BY-NC-SA 3.0

Then, in Sept. 2023 the journal EiC (prof. F. Lamonaca) asked to produce a stable and final Latex class for Acta IMEKO, able o reproduce the same format of the MS Word template.

## CHANGELOG

### Version 1.6
- Author: FT
- Date: 01/02/2024
- Notes
  - Rewrote the code for producing the bibliography, now with bib labels hanged on the left.
  - Added the \AIBreakAtRef command to equalize last column. 
  - Automatic alternate row coloring

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
- Notes This version introduced some other tweaks to match the Word template.
			Now the citations are typesetted as in the word template, as well as we introduced
			the tabularx environment to have tables with 100% column width.
			Now also the bibliography (BST) file is correct!

Vers: 1.3
- Author: FT
- Date: 03/10/2023
- Notes This version introduced all the needed tweaks to interline spaces, character expansions 
			and other minor typographical dimensions to match the Word template.
			Currently, the same paper, if typesetted with the Word and the LaTeX templates
			renders almost identically...a part from the bibligraphy style, that needs some
			more polishings

Vers: 1.2
- Author: FT
- Date: 27/09/2023
- Notes This version finally have all the needed stuffs for a correct authors management 
			Notably, we can reference to the corresponding author indicating the number 
			of the author in the list, this will automatically keep the name
			Added an option to show or not the corresp. author mark
			Symplified the structure for authors
			Solved a serious interference between hyperref and authors names

Vers: 1.1
- Author: FT
- Date: 25/09/2023
- Notes This version adds support for all the needed PDF metadata

Vers: 1.1
- Author: FT
- Date: 25/09/2023
- Notes This version builds over v1.0 (see below). Several futher bugs have been solved 
   - added micro typography options to adress hyphenation and letters/words spacings
   - removed dependence on some packages (e.g. geometry)
   - added a new authors' management method

Vers: 1.0
- Author: FT
- Date: 12/09/2023
- Notes This version builds over the first draft (see below). Several bugs have been solved 
   - removed use of \bf \it etc.
   - missing definitions
   - removed unneded packges