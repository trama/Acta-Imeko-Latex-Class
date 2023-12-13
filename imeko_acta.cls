%% ACTA IMEKO Latex class file
%%
%% Vers: 1.4
%% By: Federico Tramarin (tramarin@unimore.it)
%% Date: 12/12/2023
%% Notes: This version introduced some other tweaks to match the Word template.
%%			Now the citations are typesetted as in the word template, as well as we introduced
%%			the tabularx environment to have tables with 100% column width.
%%			Now also the bibliography (BST) file is correct!
%%
%% Vers: 1.3
%% By: Federico Tramarin (tramarin@unimore.it)
%% Date: 03/10/2023
%% Notes: This version introduced all the needed tweaks to interline spaces, character expansions 
%%			and other minor typographical dimensions to match the Word template.
%%			Currently, the same paper, if typesetted with the Word and the LaTeX templates
%%			renders almost identically...a part from the bibligraphy style, that needs some
%%			more polishings
%%
%% Vers: 1.2
%% By: Federico Tramarin (tramarin@unimore.it)
%% Date: 27/09/2023
%% Notes: This version finally have all the needed stuffs for a correct authors management 
%%			Notably, we can reference to the corresponding author indicating the number 
%%			of the author in the list, this will automatically keep the name
%%			Added an option to show or not the corresp. author mark
%%			Symplified the structure for authors
%%			Solved a serious interference between hyperref and authors names
%%
%% Vers: 1.1
%% By: Federico Tramarin (tramarin@unimore.it)
%% Date: 25/09/2023
%% Notes: This version adds support for all the needed PDF metadata
%%
%% Vers: 1.1
%% By: Federico Tramarin (tramarin@unimore.it)
%% Date: 25/09/2023
%% Notes: This version builds over v1.0 (see below). Several futher bugs have been solved 
%%    - added micro typography options to adress hyphenation and letters/words spacings
%%    - removed dependence on some packages (e.g. geometry)
%%    - added a new authors' management method
%%
%% Vers: 1.0
%% By: Federico Tramarin (tramarin@unimore.it)
%% Date: 12/09/2023
%% Notes: This version builds over the first draft (see below). Several bugs have been solved 
%%    - removed use of \bf \it etc.
%%    - missing definitions
%%    - removed unneded packges
%%
%% The main reasons is that matching with the Word template requires quite a lot of font tunings, and obsolete commands (like \bf \it) do not support LaTeX2e's new font selection scheme, or NFSS{\bf foo}, for example, resets all font attributes which had been set earlier. also, we need new options to produce the camera ready and final version, etc.
%%
%% HISTORY:
%% A first draft of the class has been produced by Corey Stambaugh (corey.stambaugh @ nist.gov)
%% Date: 09/12/2018
%%
%% This class file was originally downloaded as SelfArx.cls
%% Template Source: This template has been downloaded from:
%% http://www.latextemplates.com/template/stylish-article
%% License: CC BY-NC-SA 3.0
%%
%% The class has been written to mimic the template style of the ACTA IMEKO journal
%% https://acta.imeko.org/    which is written as a .doc file by:
%% Thomas Bruns, Dirk Röske, Paul P. L. Regtien, Francisco Alegria
%%
%% END HISTORY

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{imeko_acta}[2023/09/12 Acta Imeko paper class v1.0]


\LoadClass[10pt,a4paper]{article}

\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[british]{babel}
% using EB-Garamond for serif text
\RequirePackage[lining]{ebgaramond}
%\usepackage[urw-garamond]{mathdesign}
% using Helvetica for sans-serif
\renewcommand{\sfdefault}{phv}
\usepackage{microtype} % without this, with ebgaramond many lines go out of the margin due to hyphenation issues
\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{ifpdf,ifxetex}      % Needed to pick between latex and pdflatex
\RequirePackage[fleqn]{amsmath}
\RequirePackage{graphicx,xcolor}
\RequirePackage{indentfirst}
\RequirePackage{caption}
\RequirePackage[explicit]{titlesec}
\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\RequirePackage{enumitem}
\RequirePackage{array,booktabs,tabularx}
%only needed if we want to have a double column float * mandatory* at the bottom (because latex only put them at the top by default)
\RequirePackage{stfloats} 
\usepackage{cite}

\ifxetex
	\RequirePackage{fontspec,unicode-math}
	\setsansfont{Calibri}
%\setromanfont[LetterSpace=-0.5]{Adobe Garamond Pro}
	\setmathfont{Cambria Math}
\fi

\ifLuaTeX
	\RequirePackage{fontspec,unicode-math}
\setsansfont{Calibri}
%\setromanfont[LetterSpace=-0.5]{Adobe Garamond Pro}
	\setmathfont{Cambria Math}
\fi


%% To choose the type of manuscript
\DeclareOption{article}{\gdef\@arttype{Research Paper}}
\DeclareOption{technicalnote}{\gdef\@arttype{Technical Note}}
\DeclareOption{editorial}{\gdef\@arttype{Editorial}}

%% To choose the status of the manuscript
\DeclareOption{submit}{\gdef\@status{submit}}
\DeclareOption{final}{\gdef\@status{final}}

%%
\newif\if@showcorr \@showcorrtrue
\DeclareOption{showcorresponding}{\@showcorrtrue}
\DeclareOption{noshowcorresponding}{\@showcorrfalse}
%\gdef\@showcorrtrue

%\AtEndOfClass{\RequirePackage{microtype}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%% Defaults
\ExecuteOptions{10pt,a4paper,article,submit,noshowcorresponding}

\ProcessOptions\relax

% Set page layout options (no geometry package)
\setlength{\paperheight}{297mm}%
\setlength{\paperwidth}{210mm}%
\topmargin        -51.0pt%49.0pt
\textheight        717pt% 58pc % = 9.63in or 696pt
\textwidth         512pt% 43pc   % 2 x 21pc + 1pc = 43pc
\columnsep          16pt%1pc % 1 pc is 12 pt
\def\@ActaMarginE{15mm}%
\oddsidemargin    \@ActaMarginE
\addtolength{\oddsidemargin}{-1in}% compensate for LaTeX's 1in offset
\evensidemargin   \@ActaMarginE
\addtolength{\evensidemargin}{-1in}% compensate for LaTeX's 1in offset

% Font tweaks (mostly on the baseline skip) to match Word template
\def\normalsize{\@setfontsize{\normalsize}{10}{11.35pt}}%
\normalsize
\abovedisplayskip 1.5ex plus4pt minus2pt%
\belowdisplayskip \abovedisplayskip%
\abovedisplayshortskip 0pt plus4pt%
\belowdisplayshortskip 1.5ex plus4pt minus2pt
\def\small{\@setfontsize{\small}{9}{9.8pt}}
\def\footnotesize{\@setfontsize{\footnotesize}{8}{9.8pt}}
\def\scriptsize{\@setfontsize{\scriptsize}{7}{7pt}}
\def\tiny{\@setfontsize{\tiny}{5}{6pt}}
\def\sublargesize{\@setfontsize{\sublargesize}{11}{13.4pt}}
\def\large{\@setfontsize{\large}{12}{14pt}}
\def\nlarge{\@setfontsize{\nlarge}{13}{15pt}}
\def\Large{\@setfontsize{\Large}{14}{17pt}}
\def\LARGE{\@setfontsize{\LARGE}{17}{20pt}}
\def\nLARGE{\@setfontsize{\nLARGE}{19}{21pt}}
\def\huge{\@setfontsize{\huge}{20}{24pt}}
\def\Huge{\@setfontsize{\Huge}{24}{28pt}}


%% Various definitions
%Tweak first line indent width
\parindent 4mm
\flushbottom % Makes all text pages the same height
\definecolor{ActaBlue}{RGB}{19,33,94}
\definecolor{color2}{RGB}{205,217,240} % Color of the boxes behind the abstract and headings

% Definitions for ABSTRACT+AUTHOR FRAME
%----------------------------------------------------------------------  

\newcommand{\PaperTitle}[1]{\def\@PaperTitle{#1}}
\newcommand{\Archive}[1]{\def\@Archive{#1}}
%\newcommand{\JournalInfo}[1]{\def\@JournalInfo{#1}}
\newcommand{\Abstract}[1]{\def\@Abstract{#1}}
\newcommand{\Keywords}[1]{\def\@Keywords{#1}}
\newcommand{\Citation}[1]{\def\@Citation{#1}}
\newcommand{\Editor}[1]{\def\@Editor{#1}}
\newcommand{\EditorAffiliation}[1]{\def\@EditorAffiliation{#1}}
\newcommand{\Funding}[1]{\ifthenelse{\equal{#1}{}}{\def\@Funding{No funding specified.}}{\def\@Funding{#1}}}
\newcommand{\Received}[1]{\def\@Received{#1}}
\newcommand{\FinalForm}[1]{\def\@FinalForm{#1}}
\newcommand{\Published}[1]{\def\@Published{#1}}
\newcommand{\VolumeNumber}[1]{\def\@VolumeNumber{#1}}
\newcommand{\VolumeYear}[1]{\def\@VolumeYear{#1}}
\newcommand{\VolumeMonth}[1]{\def\@VolumeMonth{#1}}
\newcommand{\IssueNumber}[1]{\def\@IssueNumber{#1}}
\newcommand{\ArticleNumber}[1]{\def\@ArticleNumber{#1}}
\newcommand{\Identifier}[1]{\def\@Identifier{#1}}
%\newcommand{\Journal}[1]{\def\@Journal{#1}}
%\newcommand{\ISSN}[1]{\def\@ISSN{#1}}
%\newcommand{\Section}[1]{\def\@Section{#1}}
%\newcommand{\CopyRight}[1]{\def\@CopyRight{#1}}
%\newcommand{\AIauthorsNames}{\@AIauthorsNames}

\RequirePackage[unicode=true,
	bookmarksopen={true},
	pdffitwindow=true, 
	colorlinks=true, 
	linkcolor=ActaBlue, 
	%	citecolor=ActaBlue, 
citecolor=black, 
	urlcolor=ActaBlue, 
	hyperfootnotes=true, 
	pdfstartview={FitH},
	pdfpagemode=UseNone]{hyperref}

%%%% Metadata
\newcommand{\org@maketitle}{}% LATEX-Check
\let\org@maketitle\maketitle
\def\maketitle{%
	\hypersetup{
		pdftitle={\@PaperTitle},
		pdfsubject={\@Abstract},
		pdfkeywords={\@Keywords},
		pdfauthor={\@AIauthorsNames},
		%pdfcreator={FT},
		%pdfproducer={FT},
		pdfinfo={
			Company={IMEKO - The International Measurement Confederation},
			Acta IMEKO Issue Year={\@VolumeYear},
			Acta IMEKO Issue Volume={\@VolumeNumber},
			Acta IMEKO Issue Number={\@IssueNumber},
			Acta IMEKO Issue Month={\@VolumeMonth},
			Acta IMEKO Article Number={\@ArticleNumber},
			Acta IMEKO Article Authors={\@AIauthorsNames},
			Acta IMEKO Section Editor={\@Editor, \@EditorAffiliation},
			Acta IMEKO Received MonthDayYear={\@Received},
			Acta IMEKO InFinalForm MonthDayYear={\@FinalForm}
			}
		}%
		%\typeout{FT:1 \@AIauthorsNames}
	\org@maketitle
}

% Acta IMEKO item lists: we uses 5) not 5.
% a) not (a)
% iii) not iii.
% A) not A.
\def\labelenumi{\theenumi)}     \def\theenumi{\arabic{enumi}}
\def\labelenumii{\theenumii)}  \def\theenumii{\alph{enumii}}
\def\labelenumiii{\theenumiii)} \def\theenumiii{\roman{enumiii}}
\def\labelenumiv{\theenumiv)}   \def\theenumiv{\Alph{enumiv}}

% exactly the same as in article.cls
\def\p@enumii{\theenumi}
\def\p@enumiii{\theenumi(\theenumii)}
\def\p@enumiv{\p@enumiii\theenumiii}

\setlist{nosep}
\newlist{enumerate-a}{enumerate}{1}
\setlist[enumerate-a,1,2]{label=\alph*.}
\setlist[itemize,1]{label=-}


% adapting some internal Latex parameters
% TeX default is 50
\hyphenpenalty=50
% If we didn't adjust the interword spacing, 2200 might be better.
% The TeX default is 1000
\hbadness=2200
% IEEE does not use extra spacing after punctuation
\frenchspacing
%%%% Widows & orphans
\clubpenalty=5000
\widowpenalty=2000
\displaywidowpenalty=1000

\setlength{\fboxrule}{0.75pt} % Width of the border around the abstract

% normally zero, should be relative to font height.
% put in a little rubber to help stop some bad breaks (underfull vboxes)
\parskip 0ex plus 0ex minus 0.1ex
\setlength{\mathindent}{0pt}

% adjust caption properties
\captionsetup{format=plain,indention=0in,singlelinecheck=false,font={sf,footnotesize},labelsep=period,justification=justified}
\setlength\abovecaptionskip{6pt plus 3pt minus 2pt}
\setlength\belowcaptionskip{0pt}% plus 3pt minus 2pt} % 
\setlength\textfloatsep{12pt plus 2pt minus 2pt}
\setlength\intextsep{4pt plus 2pt minus 2pt}

\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.85}
\renewcommand{\textfraction}{0.1}
\renewcommand{\floatpagefraction}{0.85}
\renewcommand{\dbltopfraction}{0.85}
\renewcommand{\dblfloatpagefraction}{.85}
\setcounter{topnumber}{25}
\setcounter{bottomnumber}{25}
\setcounter{totalnumber}{25}
\setcounter{dbltopnumber}{25}

% set tabular/tables to use sans-serif small fonts
\renewcommand{\tabular}{\let\@halignto\@empty\sffamily\footnotesize\@tabular}
\usepackage{etoolbox}
\AtBeginEnvironment{tabularx}{%
	\sffamily\footnotesize%
}
\newcolumntype{C}{>{\centering\arraybackslash}X}

% Set the page header
\renewcommand{\headrulewidth}{0pt}% % No header rule
\renewcommand{\footrulewidth}{0.75pt}% % No footer rule
%\newcommand{\PaperFooter}[1]{
\def\@JournalInfoFooter{\@VolumeMonth\ \@VolumeYear\ \textbar{} % 
	Volume\ \@VolumeNumber\ \textbar{} Number \@IssueNumber\ \textbar{} }

\def\@JournalInfoHeader{\@VolumeMonth\ \@VolumeYear, %
	Volume\ \@VolumeNumber, Number \@IssueNumber, %
	\@ArticleNumber}
		
% Headers
\fancyhead[L]{}%
\fancyhead[C]{}%
\fancyhead[R]{}
% Footers
\fancyfoot[L]{\footnotesize\sffamily\selectfont {ACTA IMEKO \textbar{}  www.imeko.org}}%
\fancyfoot[C]{}%
\fancyfoot[R]{\footnotesize\sffamily\selectfont \@JournalInfoFooter \thepage}%
\pagestyle{fancy}          % Enables the custom headers/footers
\fancypagestyle{plain}{}

\def\thesection{\arabic{section}.}
\def\thesubsection{\thesection.\arabic{subsection}}
\def\thesubsubsection{\thesubsection.\arabic{subsubsection}}
\def\@seccntformat#1{\csname the#1\endcsname\space}
% Settings for titles of sections and subsections
% \titleformat{\section}{\sffamily\bfseries\normalsize}{}{0em}{{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\sffamily{\arabic{section}.} \MakeUppercase{#1}}}}[]

%\def\section{\@startsection{section}{1}{\z@}{1ex plus 1ex minus 0.5ex}{1.5ex plus 0ex minus 0.1ex}{\sffamily\normalsize\bfseries\MakeUppercase}}%

\def\section{\@startsection{section}{1}{\z@}{12pt}{6pt}{\sffamily\normalsize\bfseries\MakeUppercase}}%

\titleformat{name=\section,numberless}{\sffamily\bfseries\normalsize}{}{0em}{{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\MakeUppercase{#1}}}}[]

\titleformat{\subsection}{\sffamily\bfseries\small}{}{0em}{{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{{\arabic{section}.\arabic{subsection}.} {#1}}}}[] 

\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{9pt \@plus1pt \@minus1pt}{3pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{0pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{10pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Authors Management
% Adapted from Elsevier and largely simplified
% for the Acta Imeko class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Definitions to manage multiple authors
% Definitions for management of multiple authors and affiliations
% adapted from the code of elsarticle

\def\author{\@@author}
\def\@AIaffiliations{}
\def\@AIauthors{}
\def\@AIauthorsNames{}

%some temporary variables for internal use
\let\authorsep\@empty
\let\sep\@empty
\let\@cormark\@empty
\def\CorrespondingAuthor{}
\def\@CorrespondingAuthorName{}

% Create Authors string with superscripts indicating their affiliation (\@@affmark)
% However, at the first round, there can not be a match between author and affiliation
% So first round we write affn? and crate a reference for \@@affmark
% then we process
\newcounter{auth}
\def\@@author[#1]#2{%
    \g@addto@macro\@AIauthors{%
    \def\baselinestretch{1}%
	\refstepcounter{auth}% increment by 1
    \authorsep#2\unskip\textsuperscript{%
\typeout{Federico - @@author macro -> #1 - #2}
      	\@for\@@affmark:=#1\do{%
\typeout{Federico - @@author macro -> auth:\theauth\ affmark:\@@affmark - author:#1}
       		\edef\affnum{\@ifundefined{X@\@@affmark}{affn?}{\AIrefMark{\@@affmark}}}%
     		\unskip\sep\affnum%
			\edef\cormark{\@ifundefined{X@cor-\theauth}{}{%
				\if@showcorr
					{,\AIrefMark{cor-\theauth}}%
				\else
					{}%
				\fi}}%
			%			\unskip\sep\cormark\let\sep=,% this line was wrong, since it will add a extra comma in case of multiple affiliations
			\unskip\cormark\let\sep=,% now the issue is for the corresponding author with multiple affiliations
			\ifx\cormark\@empty%
			\else
			\g@addto@macro\@CorrespondingAuthorName{#2}%
			\fi
			}%
      	}%
    \gdef\authorsep{\unskip,\space}%
    \global\let\sep\@empty%
	}
	\ifx\@AIauthorsNames\@empty
		\g@addto@macro\@AIauthorsNames{#2}%
	\else
		\g@addto@macro\@AIauthorsNames{\authorsep#2}%
	\fi
}

% we  process all the affiliations, creating an affLabel for each one
% and then writing them down
% in this phase, at the first round, we hence create the variables for cross referencing with 
% authors, in the second round
\def\affiliation{\@@affiliation}
\newcounter{affn}
\renewcommand\theaffn{\arabic{affn}}
\long\def\@@affiliation[#1]#2{%
\typeout{Federico - @@affiliation macro}
	\g@addto@macro\@AIaffiliations{%
		\def\baselinestretch{1}%
		\refstepcounter{affn}%
		\xdef\@currentlabel{\theaffn}%
\typeout{Federico - @@affiliation macro -> \@currentlabel}
		\AIaffLabel{#1}%here we create a first round of refmarks for each affiliation
		{\upshape\textsuperscript{\theaffn}}\space#2\par\vspace{1pt}}% the vspace is necessary to keep the same interline spacing of word (due to superscripts)
	}

% AIaffLabel is used in the first round to create a global variable for affiliation referencing
% that is written to the aux file
% in practice, each affiliation mark (it can be a number, a letter, etc) is
% associated with a sequence number of the affiliation
\def\AIaffLabel#1{\@bsphack\protected@write\@auxout{}%
	{\string\NewAIaffLabel{#1}{\@currentlabel}}\@esphack}
\def\NewAIaffLabel#1#2{\expandafter\xdef\csname X@#1\endcsname{#2}}

% AIrefMark is used in the second round to xref the previous defined variables
\def\AIrefMark#1{\@ifundefined{X@#1}{0}{\csname X@#1\endcsname}%
}

% here we create a first round of refmarks for the corresponding author
\def\CorrespondingAuthorNumber#1{\NewAIaffLabel{cor-#1}{$\ast$}}

\newcounter{cnote}
\def\CorrespondingAuthorEmail#1{\refstepcounter{cnote}%
	\AIaffLabel{#1}%
	\g@addto@macro\CorrespondingAuthor{%
	\@CorrespondingAuthorName, e-mail: \url{#1}}}

%%%% URL
\RequirePackage{xurl}
\urlstyle{same}
% Line breaks in URL
\def\UrlDigits{\do\1\do\2\do\3\do\4\do\5\do\6\do\7\do\8\do\9\do\0}
\g@addto@macro{\UrlBreaks}{\UrlOrds}
\g@addto@macro{\UrlBreaks}{\UrlDigits}

%% CITATION COMMANDS
%% 
%% F.Tramarin: The following llines are directly taken from IEEEtran.cls
%% 				it was meaningful to reinvent the wheel...they are simply brilliant!
%% From IIItran.cls
%% V1.6 no longer supports the older, nonstandard \shortcite and \citename setup stuff
% 
% 
% Modify Latex2e \@citex to separate citations with "], ["
\def\@citex[#1]#2{%
	\let\@citea\@empty
	\@cite{\@for\@citeb:=#2\do
		{\@citea\def\@citea{], [}%
			\edef\@citeb{\expandafter\@firstofone\@citeb\@empty}%
			\if@filesw\immediate\write\@auxout{\string\citation{\@citeb}}\fi
			\@ifundefined{b@\@citeb}{\mbox{\reset@font\bfseries ?}%
				\G@refundefinedtrue
				\@latex@warning
				{Citation `\@citeb' on page \thepage \space undefined}}%
			{\hbox{\csname b@\@citeb\endcsname}}}}{#1}}

% V1.6 we create hooks for the optional use of Donald Arseneau's
% cite.sty package. cite.sty is "smart" and will notice that the
% following format controls are already defined and will not
% redefine them. The result will be the proper sorting of the
% citation numbers and auto detection of 3 or more entry "ranges" -
% all in IEEE style:  [1], [2], [5]--[7], [12]
% This also allows for an optional note, i.e., \cite[mynote]{..}.
% If the \cite with note has more than one reference, the note will
% be applied to the last of the listed references. It is generally
% desired that if a note is given, only one reference is listed in
% that \cite.
% Thanks to Mr. Arseneau for providing the required format arguments
% to produce the IEEE style.
\def\citepunct{], [}
\def\citedash{]--[}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%\setlist{nolistsep} % Uncomment to remove spacing between items in lists (enumerate, itemize)
% ---------------------------------------------------------------------
\def\@Journal{Acta IMEKO}
\def\@ISSN{ISSN: 221-870X}
\def\@CopyRight{This is an open-access article distributed under%
	the terms of the Creative Commons Attribution 3.0 License, %
	which permits unrestricted use, distribution, and reproduction %
	in any medium, provided the original author and source are credited.}
\def\@Citation{\@AIauthorsNames, \@PaperTitle, \@Journal, vol. \@VolumeNumber, no. \@IssueNumber, article \@ArticleNumber, \@VolumeMonth, \@VolumeYear, Identifier: \@Identifier}

\renewcommand{\@maketitle}{%
	\twocolumn[{%
		%\pagestyle{fancy}%
		\vskip-26pt%
		\begin{minipage}[b]{0.933\textwidth}
			{\raggedright
				{\large\sffamily\bfseries\selectfont {\MakeUppercase{\@Journal}}\par}\vskip2pt%
				{\small\sffamily\bfseries\selectfont {\@ISSN}\par}\vskip1pt%
				{\small\sffamily\itshape\selectfont {\@JournalInfoHeader}\par}\vskip1pt%
				\noindent\textcolor{ActaBlue}{\rule{\textwidth-2pt}{1.5pt}}}%
		\end{minipage}
		\begin{minipage}[b]{0.05\textwidth}
			\includegraphics[width=1.28cm]{IMEKO.png}
		\end{minipage}
		\vskip24pt%
		{\raggedright{\huge\sffamily\bfseries\selectfont \@PaperTitle}\par}%
		\vskip15pt%
		{\raggedright{\large\sffamily\bfseries\selectfont \@AIauthors}\par}%
		\vskip14pt%
		\begingroup%
		\raggedright\sffamily\itshape%\small%
		\small%
		\@AIaffiliations\par%
		\endgroup%%
		\vskip17pt%
		\fcolorbox{color2}{color2}{%
			\parbox{\textwidth-2\fboxsep-2\fboxrule}{\centering%
				\colorbox{color2}{%
					\parbox{\textwidth-4\fboxsep-2\fboxrule}{%
						\vskip6pt%
						\ifx\@Keywords\@empty%
						\fontsize{9}{12}\sffamily{\expandafter\MakeUppercase\expandafter{\abstractname}}\\\@Abstract%
						\else%
						\fontsize{9}{12}\sffamily{\expandafter\MakeUppercase\expandafter{\abstractname}}\\\@Abstract%
						\fi%
					}%
				}%
			
			}%
		}%
		\vskip10pt%
		\hbox to \textwidth{\leaders\hbox to 2pt{\scriptsize . \hss}\hfil}
		\vskip12pt%
		{\footnotesize\sffamily\bfseries\selectfont {{Section:}}}
		{\footnotesize\sffamily\selectfont {\@arttype}\par}
		\vskip6pt%pt%
		{\footnotesize\sffamily\bfseries\selectfont {{Keywords:}}}
		{\footnotesize\sffamily\selectfont {\@Keywords}\par}
		\vskip6pt%pt%
		{\footnotesize\sffamily\bfseries\selectfont {{Citation:}}}
		{\footnotesize\sffamily\selectfont {\@Citation}\par}
		\vskip6pt%
		{\footnotesize\sffamily\bfseries\selectfont {{Section Editor:}}}
		{\footnotesize\sffamily\selectfont {\@Editor, \@EditorAffiliation}\par}
		\vskip6pt%
		{\footnotesize\sffamily\bfseries\selectfont {{Received:}}}
		{\footnotesize\sffamily\selectfont {\@Received;}}
		{\footnotesize\sffamily\bfseries\selectfont {{In Final Form:}}}
		{\footnotesize\sffamily\selectfont {\@FinalForm;}}
		{\footnotesize\sffamily\bfseries\selectfont {{Published:}}}
		{\footnotesize\sffamily\selectfont {\@Published.}\par}
		\vskip6pt%
		{\footnotesize\sffamily\bfseries\selectfont {Copyright:}}
		{\footnotesize\sffamily\selectfont {\@CopyRight}\par}
		\vskip6pt%
		{\footnotesize\sffamily\bfseries\selectfont {Funding:}}
		{\footnotesize\sffamily\selectfont {\@Funding}\par}
		\vskip6pt%
		{\footnotesize\sffamily\bfseries\selectfont {Corresponding Author:}}
		{\footnotesize\sffamily\selectfont {\CorrespondingAuthor}\par}
		\vskip6pt%
		\hbox to \textwidth{\leaders\hbox to 2pt{\scriptsize . \hss}\hfil}
		\vskip18pt%
	}]%
}%

%----------------------------------------------------------------------
%	REFERENCES
%----------------------------------------------------------------------  

% Remove brackets from numbering in List of References
\renewcommand{\@biblabel}[1]{[#1]}
%\setlength{\bibitemsep}{0cm}
\setlength{\labelsep}{3mm}%
\let\oldbibliography\thebibliography
\renewcommand{\thebibliography}[1]{%
	\addcontentsline{toc}{section}{\refname}%
	\oldbibliography{#1}%
	\small\setlength\itemsep{0pt}\setlength\parskip{1pt}}%
	