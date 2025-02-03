%%% ACTA IMEKO Latex class file
%% imeko_acta.cls
%%
%% Vers: 2.0
%% By: Federico Tramarin (tramarin@unimore.it)
%% Date: 13/02/2025
%% Notes: Adjustments to microtypography features, spacings.
%%        Updated the template to reflect the last version of the Word template.
%%        Added the possibility to choose between one and two column layout.
%%        Added the language support in bibliography
%%
%% Copyright (c) 2025 Federico Tramarin
%% 
%%*************************************************************************
%% Legal Notice:
%% This code is offered as-is without any warranty either expressed or
%% implied; without even the implied warranty of MERCHANTABILITY or
%% FITNESS FOR A PARTICULAR PURPOSE! 
%% User assumes all risk.
%% In no event shall the Acta Imeko or any contributor to this code be liable for
%% any damages or losses, including, but not limited to, incidental,
%% consequential, or any other damages, resulting from the use or misuse
%% of any information contained here.
%% All comments are the opinions of their respective authors and are not
%% necessarily endorsed by the Acta Imeko or Imeko.
%
% This work may be distributed and/or modified under the
% conditions of the LaTeX Project Public License, either version 1.3
% of this license or (at your option) any later version.
% The latest version of this license is in
%   https://www.latex-project.org/lppl.txt
% and version 1.3c or later is part of all distributions of LaTeX
% version 2008 or later.
%
% This work has the LPPL maintenance status `maintained'.
% 
% The Current Maintainer of this work is Federico Tramarin.
%
% This work consists of the files imeko_acta.cls, imeko_acta.bst
% and the derived file imeko_acta_template.tex and guide.tex
%
%% Retain all contribution notices and credits.
%% ** Modified files should be clearly indicated as such, including  **
%% ** renaming them and changing author support contact information. **
%%*************************************************************************

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{imeko_acta}[2024/02/08 Acta Imeko paper class v1.8]

\newif\ifweareinproduction	\weareinproductionfalse

%% To choose the type of manuscript
\DeclareOption{article}{\gdef\@arttype{RESEARCH PAPER}}
\DeclareOption{technicalnote}{\gdef\@arttype{TECHNICAL NOTE}}
\DeclareOption{editorial}{\gdef\@arttype{EDITORIAL}}

%% To choose the status of the manuscript
\DeclareOption{submit}{\gdef\@status{submit}}
\DeclareOption{final}{\gdef\@status{final}}

%%
\newif\if@showcorr \@showcorrtrue
\DeclareOption{showcorresponding}{\@showcorrtrue}
\DeclareOption{noshowcorresponding}{\@showcorrfalse}

\newif\ifonecolumn \onecolumnfalse
\DeclareOption{onecolumn}{\onecolumntrue}
\DeclareOption{twocolumn}{\onecolumnfalse}

%\AtEndOfClass{\RequirePackage{microtype}}
\DeclareOption*{%
\ClassWarning{imeko_acta}{Unknown option '\CurrentOption'}%
	\PassOptionsToClass{\CurrentOption}{article}%
}

%% Defaults
\ExecuteOptions{a4paper,twocolumn,article,submit,noshowcorresponding}
\ProcessOptions\relax

\ifonecolumn%
    \PassOptionsToClass{onecolumn}{article}%
\else
    \PassOptionsToClass{twocolumn}{article}%
\fi

\LoadClass[10pt,notitlepage]{article}


\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage[british]{babel}
% using EB-Garamond for serif text
\RequirePackage[lining]{ebgaramond}
% using Helvetica for sans-serif
\RequirePackage[scaled=0.87]{helvet}
% Enabling microtypography features, 
% both for enhanced reading and to adjust ebgaramond 
% otherwise many lines go out of the margin due to hyphenation issues
\RequirePackage{microtype} 

\RequirePackage{ifthen}
\RequirePackage{ifpdf,ifxetex}      % Needed to pick between latex and pdflatex
\RequirePackage{graphicx}
\RequirePackage[table]{xcolor}
\RequirePackage[fleqn]{amsmath}
\RequirePackage{caption}
\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
%\RequirePackage{lastpage}  % Number of pages in the document
\RequirePackage{enumitem}
\RequirePackage{array,booktabs,tabularx}
\RequirePackage{cite}
%only needed if we want to have a double column float *mandatory* at the bottom (because latex only put them at the top by default)
\RequirePackage{stfloats}
\RequirePackage[per-mode = symbol,
inter-unit-product = \ensuremath{{}\cdot{}}]{siunitx}

% activation of microtype features for roman and sans-serif fonts
\microtypesetup{tracking=true,activate=true}
\DeclareMicrotypeSet[tracking]{myset}{encoding = {*}, family = {rm*,sf*}, series={md*,bf*}, size={small-}}
\UseMicrotypeSet[tracking]{myset}
%\SetTracking[ spacing = {100*,350,350 } ]{ encoding = *, family = {rm*} }{ 10 }
\SetTracking[ spacing = {10*,100,100 }]{ encoding = *, family = {rm*} }{ 15 }
\SetTracking[ spacing = {10*,100, 100} ]{ encoding = *, family = {sf*} }{ 5 }


\IfFileExists{imeko_acta_production.sty}{%
  \global\weareinproductiontrue%
  \RequirePackage{imeko_acta_production}}{}

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
% Set the baseline skip to 11.25pt to match the desired line spacing for the document
\def\normalsize{\@setfontsize{\normalsize}{10}{11.3pt}}%
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
\def\huge{\@setfontsize{\huge}{20.74}{24pt}}
\def\Huge{\@setfontsize{\Huge}{24}{28pt}}


%% Various definitions
%Tweak first line indent width
\parindent 4mm
%\flushbottom % Makes all text pages the same height
\raggedbottom
\definecolor{ActaBlue}{RGB}{14,99,189}
\definecolor{AIAbstractBackground}{RGB}{199,217,240} % Color of the boxes behind the abstract and headings
\definecolor{TableGray}{RGB}{230,231,231} % Alternating row background colour

% Definitions for ABSTRACT+AUTHOR FRAME
%----------------------------------------------------------------------
\def\@Keywords{No Keywords.}
\def\@Editor{Not specified.}
\def\@EditorAffiliation{Not specified.}
\edef\@Received{\today}
\edef\@FinalForm{\today}
\edef\@Published{\today}
\edef\@VolumeNumber{VN}
\edef\@VolumeYear{VY}
\edef\@VolumeMonth{VM}
\edef\@IssueNumber{IN}
\edef\@ArticleNumber{AN}
\edef\@SubmissionNumber{SN}
\edef\@ArticleDOI{10.21014/actaimeko.vXiY.NNNN}

\newcommand{\PaperTitle}[1]{\edef\@PaperTitle{#1}}
\newcommand{\Archive}[1]{\edef\@Archive{#1}}
\newcommand{\Abstract}[1]{\edef\@Abstract{#1}}
\newcommand{\Keywords}[1]{\def\@Keywords{#1}}
\newcommand{\Editor}[1]{\edef\@Editor{#1}}
\newcommand{\EditorAffiliation}[1]{\edef\@EditorAffiliation{#1}}
\newcommand{\Funding}[1]{\ifthenelse{\equal{#1}{}}{\def\@Funding{No funding specified.}}{\edef\@Funding{#1}}}
\newcommand{\Received}[1]{\edef\@Received{#1}}
\newcommand{\FinalForm}[1]{\edef\@FinalForm{#1}}
\newcommand{\Published}[1]{\edef\@Published{#1}}
\newcommand{\VolumeNumber}[1]{\edef\@VolumeNumber{#1}}
\newcommand{\VolumeYear}[1]{\edef\@VolumeYear{#1}}
\newcommand{\VolumeMonth}[1]{\edef\@VolumeMonth{#1}}
\newcommand{\IssueNumber}[1]{\edef\@IssueNumber{#1}}
\newcommand{\ArticleNumber}[1]{\edef\@ArticleNumber{#1}}
\newcommand{\SubmissionNumber}[1]{\edef\@SubmissionNumber{#1}}
\newcommand{\ArticleDOI}[1]{\edef\@ArticleDOI{#1}}

\RequirePackage[unicode=true,
	bookmarksopen={true},
	pdffitwindow=true, 
	colorlinks=true, 
	linkcolor=ActaBlue, 
	citecolor=black, 
	urlcolor=ActaBlue, 
	hyperfootnotes=true, 
	pdfstartview={FitH},
	pdfpagemode=UseNone]{hyperref}

%%%% Metadata
\newcommand{\org@maketitle}{}% LATEX-Check
\let\org@maketitle\maketitle
\def\maketitle{%
	\org@maketitle
	\hypersetup{
		pdftitle={\@title},
		pdfsubject={\@Journal\space\@VolumeNumber\space(\@VolumeYear)%
					\space\@IssueNumber,\space 1-\@abspage@last},%\@Subject},
		pdfkeywords={\@Keywords},
		pdfauthor={\@AIauthorsNames},
		pdfinfo={
			Company={IMEKO - The International Measurement Confederation},
			Acta IMEKO Issue Year={\@VolumeYear},
			Acta IMEKO Issue Volume={\@VolumeNumber},
			Acta IMEKO Issue Number={\@IssueNumber},
			Acta IMEKO Issue Month={\@VolumeMonth},
			Acta IMEKO Article Number={\@ArticleNumber},
			Acta IMEKO Page Numbers={1-\@abspage@last},%\pageref{LastPage}},
			Acta IMEKO Article Authors={\@AIauthorsNames},
			Acta IMEKO Section Editor={\@Editor, \@EditorAffiliation},
			Acta IMEKO Received MonthDayYear={\@Received},
			Acta IMEKO InFinalForm MonthDayYear={\@FinalForm}
			}
		}%
		%\typeout{FT:1 \@AIauthorsNames}
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
\setlist[enumerate,1,2]{left= \parindent, labelsep=0.5em}
\setlist[enumerate-a,1,2]{label=\alph*., left= \parindent, labelsep=0.5em}
\setlist[itemize,1]{label=-, left= \parindent, labelsep=0.5em}


% adapting some internal Latex parameters
% TeX default is 50
\hyphenpenalty=20
% If we didn't adjust the interword spacing, 2200 might be better.
% The TeX default is 1000
\hbadness=1000
% Acta IMEKO does not use extra spacing after punctuation
\frenchspacing
\clubpenalty=5000
\widowpenalty=2000
\displaywidowpenalty=1000

\setlength{\fboxrule}{0.75pt} % Width of the border around the abstract

% normally zero, should be relative to font height.
% put in a little rubber to help stop some bad breaks (underfull vboxes)
\parskip 0ex plus 1pt minus 1pt
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
\renewcommand{\tabular}{\let\@halignto\@empty\sffamily%
	%\arraystretch=1.15%
	\footnotesize%
	\rowcolors{1}{gray!19}{white}%
	\@tabular}

% Old piece of code, no more needed
% \let\oldtabularx\tabularx
% \renewcommand{\tabularx}[1]{%
% 	\global\rownum=\z@%
% 	\rowcolors{2}{white}{gray!19}
% 	\oldtabularx{#1}%
% }

\AtBeginEnvironment{tabularx}{%
	\sffamily\footnotesize%
	\rowcolors{2}{white}{gray!19}%
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
	1\space--\space\@abspage@last}
		
% Headers
\fancyhead[L]{}%
\fancyhead[C]{}%
\fancyhead[R]{}
% Footers
\fancyfoot[L]{\footnotesize\sffamily\selectfont {ACTA IMEKO \textbar{} www.imeko.org}}%
\fancyfoot[C]{}%
\fancyfoot[R]{\footnotesize\sffamily\selectfont \@JournalInfoFooter \thepage}%
\pagestyle{fancy} % Enables the custom headers/footers
\fancypagestyle{plain}{}

\def\@seccntformat#1{\csname the#1\endcsname\space}
\def\thesection{\arabic{section}.}
\def\thesubsection{\thesection\arabic{subsection}.}
\def\thesubsubsection{\thesubsection\arabic{subsubsection}.}
% Settings for titles of sections and subsections
% \titleformat{\section}{\sffamily\bfseries\normalsize}{}{0em}{{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\sffamily{\arabic{section}.} \MakeUppercase{#1}}}}[]

%\def\section{\@startsection{section}{1}{\z@}{1ex plus 1ex minus 0.5ex}{1.5ex plus 0ex minus 0.1ex}{\sffamily\normalsize\bfseries\MakeUppercase}}%

% arguments are: #1 - sectiontype name
% (for \@sect)   #2 - section level
%                #3 - section heading indent
%                #4 - top separation (absolute value used, neg indicates not to indent main text)
%                     If negative, make stretch parts negative too!
%                #5 - (absolute value used) positive: bottom separation after heading,
%                      negative: amount to indent main text after heading
%                Both #4 and #5 negative means to indent main text and use negative top separation
%                #6 - font control
\def\section{\@startsection{section}{1}{\z@}{13pt plus 1ex minus 0.5ex}{6pt plus 0ex minus 0.1ex}{\sffamily\normalsize\bfseries\MakeUppercase}}%

%\titleformat{name=\section,numberless}{\sffamily\bfseries\normalsize}{}{0em}{{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\MakeUppercase{#1}}}}[]

\def\subsection{\@startsection{subsection}{2}{\z@}{9pt plus 1pt minus 1pt}{3pt plus 1pt minus 1pt}{\sffamily\small\bfseries}}%

\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{9pt plus 1pt minus 1pt}{1pt plus 1pt minus 1pt}{\sffamily\small}}%
%\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{10pt}
\def\paragraph{\@startsection{paragraph}{4}{\parindent}{0ex plus 0.1ex minus 0.1ex}{-1ex}{\small\sffamily\itshape}}%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Authors Management
% Taken inspiration from Elsevier elsarticle and largely simplified
% for the Acta Imeko class
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Definitions to manage multiple authors
% Definitions for management of multiple authors and affiliations
\def\author{\@@authori}
%\def\author{\@ifnextchar[{\@@author}{\@author}}
\def\@AIaffiliations{}
\def\@AIauthors{}
\def\@AIauthorsNames{}
\def\@AIauthorsNamesCitation{}

%some temporary variables for internal use
\let\authorsep\@empty
\let\sep\@empty
\let\@cormark\@empty
\def\CorrespondingAuthor{}
\def\@CorrespondingAuthorName{}

\def\@author@name{}
\def\@author@surname{}
\def\@authorshortname{}

\def\@tmpauthname{}

\define@key{authornames}{name}{%
	\def\@author@name{#1}}
%	\g@addto@macro\@tmpauthname{#1}}
\define@key{authornames}{surname}{%
	\def\@author@surname{#1}}
%	\g@addto@macro\@tmpauthname{\space#1}}
  \define@key{authornames}{abbreviation}{%
  	\def\@authorshortname{#1}}
	
\setkeys{authornames}{name=Pippo,surname=Pluto,abbreviation=P. Pluto}

\newif\ifnotyetprocessed
\def\@@authori[#1]#2{%
  \setkeys{authornames}{#2}%
  \begingroup
  \toks@{\endgroup\processauthor{#1}}%
  \protected@edef\tmpauthname{%
    \the\toks@{\@author@name\space\@author@surname}{\@authorshortname}%
  }%
  \tmpauthname
}%

\newcounter{auth}
\long\def\processauthor#1#2#3{%
  \g@addto@macro\@AIauthors{%
    \def\baselinestretch{1}%
    \refstepcounter{auth}% increment by 1
    \notyetprocessedtrue
    \authorsep#2\unskip
    \textsuperscript{%
      \@for\@@affmark:=#1\do{%
        \edef\affnum{%
          \@ifundefined{X@\@@affmark}{affn?}{\AIrefMark{\@@affmark}}%
        }%
        \unskip\sep\affnum
        \ifnotyetprocessed
          \NewAIaffLabel{auth-\theauth}{+}%
        \fi
        \edef\cormark{%
          \@ifundefined{X@cor-\theauth}{}{%
            \if@showcorr
              {,\AIrefMark{cor-\theauth}}%
            \else
              {}%
            \fi
          }%
        }%
        \unskip\cormark
        \let\sep=,% now the issue is for the corresponding author with multiple affiliations
        \ifx\cormark\@empty
        \else
          \ifnotyetprocessed % if the author is corresponding and is the first time we are here
            \g@addto@macro\@CorrespondingAuthorName{#2}% add the author name to the output
            \notyetprocessedfalse % if it is a subsequent round, do nothing
          \fi
        \fi
      }%
    }%
    \gdef\authorsep{\unskip,\space}%
    \global\let\sep\@empty
  }%%
  \ifx\@AIauthorsNames\@empty
    \g@addto@macro\@AIauthorsNames{#2}%
  \else
    \g@addto@macro\@AIauthorsNames{;\space#2}%
  \fi
  \ifx\@AIauthorsNamesCitation\@empty
	\g@addto@macro\@AIauthorsNamesCitation{#3}%
  \else
	\g@addto@macro\@AIauthorsNamesCitation{,\space#3}%
  \fi
}%

% we  process all the affiliations, creating an affLabel for each one
% and then writing them down
% in this phase, at the first round, we hence create the variables for cross referencing with 
% authors, in the second round
\def\affiliation{\@@affiliation}
\newcounter{affn}
\renewcommand\theaffn{\arabic{affn}}
\long\def\@@affiliation[#1]#2{%
	\g@addto@macro\@AIaffiliations{%
		\def\baselinestretch{1}%
		\refstepcounter{affn}%
		%\xdef\@currentlabel{\theaffn}%
		%\typeout{Federico - @@affiliation macro -> \@currentlabel}
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
%% F.Tramarin: The following lines are directly taken from IEEEtran.cls
%% 				it was useless to reinvent the wheel...they are simply brilliant!
%%
%% From IEEEtran.cls
%% V1.6 no longer supports the older, nonstandard \shortcite and \citename setup stuff
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

% Acta IMEKO needs citation "sorting" and also grouping of three or
% more citations.
% To this extent, we use Donald Arseneau's cite.sty package. 
% As defined in IEEEtran (Thanks again) cite.sty will notice that the
% following format controls are already defined and will not
% redefine them.
\def\citepunct{], [}
\def\citedash{]--[}

% ---------------------------------------------------------------------
\def\@Journal{Acta IMEKO}
\def\@ISSN{ISSN: 2221-870X}
\def\@Identifier{IMEKO-ACTA-\@VolumeNumber\space(\@VolumeYear)-\@IssueNumber-\@ArticleNumber}
\def\@CopyRight{This is an open-access article distributed under%
	the terms of the Creative Commons Attribution 3.0 License, %
	which permits unrestricted use, distribution, and reproduction %
	in any medium, provided the original author and source are credited.}

\def\urldoibase{https://doi.org/}
\def\urldoi{\urldoibase\@ArticleDOI}

\def\@Citation{\@AIauthorsNamesCitation,\space\@title,\space\@Journal,\space%
	vol.\space\@VolumeNumber\space(\@VolumeYear)\space% 
	no.\space\@IssueNumber,\space%
	pp.\space 1\space--\space\@abspage@last,\space DOI:\space\href{\urldoi}{\@ArticleDOI}%
	}
	%article\space\@ArticleNumber,\space\@VolumeMonth,\space\@VolumeYear,\space%
	%Identifier:\space\@Identifier}

%% Reserva a savebox for the Abstract
\newbox\absbox
\renewenvironment{abstract}{%
	\global\setbox\absbox=\vbox%
	\bgroup%
	\hsize=\textwidth%
	\advance\hsize by -2\fboxsep\relax% let's compensate for the internal
	\advance\hsize by -2\fboxrule\relax% margins of the colored frame
	\advance\hsize by -8pt\relax% where the abstract will be typeset
	\parindent 0pt%
	\fontsize{9}{11}\sffamily\noindent\unskip{ABSTRACT}\par%
	\fontsize{9}{11}\noindent\unskip\ignorespaces}
	{\egroup}

%% a perfect alignment between the start of the title headings between the Word template and this LaTeX template
%% is to use a \vskip-27.5pt in the \@maketitle command
%% To avoid decimal point values, we will use a -27pt for the two column version and -36pt for the one column version
%----------------------------------------------------------------------

\def\@maketitle{%
\overfullrule=10pt
	\null
	\ifonecolumn
		\vskip-37pt%
	\else
		\vskip-27pt%
	\fi
	\parindent0pt
	% \textwidth         518pt% 43pc   % 2 x 21pc + 1pc = 43pc
	% \def\@ActaMarginE{15mm}%
	% \oddsidemargin    \@ActaMarginE
	% \addtolength{\oddsidemargin}{-1in}% compensate for LaTeX's 1in offset
	% \evensidemargin   \@ActaMarginE
	% \addtolength{\evensidemargin}{-1in}% compensate for LaTeX's 1in offset
	\footnotesize\sffamily
	\begin{minipage}[b]{0.925\textwidth}
			\newdimen\upperrule%
			\upperrule=\textwidth%
			\advance\upperrule by -0pt%
			\raggedright
			{\large\bfseries {\MakeUppercase{\@Journal}}\par}\vskip2pt%
			{\small\bfseries {\@ISSN}\par}\vskip1pt%
			{\small\itshape {\@JournalInfoHeader}\par}\vskip2pt%
			\noindent\textcolor[RGB]{49,1,98}{\rule{\upperrule}{1.5pt}}%
	\end{minipage}%\hfill%
	\hskip2pt%
	\begin{minipage}[b]{0.071\textwidth}
		\includegraphics[width=1.28cm]{./imeko.png}
	\end{minipage}%
	\vskip15pt%
	\begingroup
	\huge{\bfseries\@title}\par%
	\vskip15pt%
	\large{\bfseries\@AIauthors}\par%
	\vskip14pt%
	\itshape\small\@AIaffiliations\par%
	\endgroup%%
	\vskip17pt%
	\fcolorbox{AIAbstractBackground}{AIAbstractBackground}{%
		\hskip6pt%
		\parbox{\textwidth}{\vskip8pt%
			\ifvoid\absbox\else\unvbox\absbox\par\vskip6pt\fi}%
		\hskip2pt%
	}
	\vskip10pt%
	\hbox to \textwidth{\leaders\hbox to 2pt{\scriptsize . \hss}\hfil}
	\vskip14pt%
	{\bfseries Section:}\space\@arttype\par
	\vskip6pt%pt%
	{\bfseries Keywords:}\space\@Keywords\par
	\vskip6pt%pt%
	{\bfseries Citation:}\space\par%\@Citation\par
	\vskip6pt%
	{\bfseries Section Editor:}\space\@Editor,\space\@EditorAffiliation\par
	\vskip6pt%
	{\bfseries Received:}\space{\@Received};\space{\bfseries In Final Form:}%
	\space\@FinalForm;\space{\bfseries Published:}\space\@Published.\par
	\vskip6pt%
	{\bfseries Copyright:}\space\@CopyRight\par
	\vskip6pt%
	{\bfseries Funding:}\space\@Funding\par
	\vskip6pt%
	{\bfseries Corresponding Author:}\space\CorrespondingAuthor\par
	\vskip8pt%
	\hbox to \textwidth{\leaders\hbox to 2pt{\scriptsize . \hss}\hfil}
	\vskip12pt%
}

%----------------------------------------------------------------------
%	REFERENCES
%----------------------------------------------------------------------  

% In a similar way to IEEEtran, we provide a command to break the last column
% to try to equalize le bibliography on the last page
\edef\@AItriggerrefnum{0}   % the default of zero means that the command is not executed
\def\@AItriggercmd{\newpage}
\newcount\@AItmpcount
\def\AIBreakAtRef#1{\@AItmpcount=#1%
\edef\@AItriggerrefnum{\the\@AItmpcount}}%

% trigger command at the given reference
\def\@AIbibitemprefix{\@AItmpcount=\@AItriggerrefnum\relax%
\advance\@AItmpcount by -1\relax%
\ifnum\c@enumiv=\@AItmpcount\relax\@AItriggercmd\relax\fi}

% controls bib item spacing
%\def\AIbibitemsep{0pt plus .5pt}
\def\AIbibitemsep{0pt}
\setlength{\labelsep}{3mm}
% Remove brackets from numbering in List of References
\renewcommand{\@biblabel}[1]{[#1]\hfill}

\def\thebibliography#1{\section*{\refname}%
    \addcontentsline{toc}{section}{\refname}%
    \small\list{\@biblabel{\@arabic\c@enumiv}}%
    {\settowidth\labelwidth{\@biblabel{#1}}%
    \leftmargin\labelwidth%
    \advance\leftmargin\labelsep\relax
    \itemsep \AIbibitemsep\relax
    \usecounter{enumiv}%
    \let\p@enumiv\@empty
    \renewcommand\theenumiv{\@arabic\c@enumiv}}%
    \let\@AIlatexbibitem\bibitem%
    \def\bibitem{\@AIbibitemprefix\@AIlatexbibitem}%
\def\newblock{\hskip .11em plus .33em minus .07em}%
\setlength\parskip{1pt plus 1pt minus .5pt}\relax%
\sloppy\clubpenalty4000\widowpenalty4000\interlinepenalty500%
\sfcode`\.=1000}

\def\endthebibliography{%
  \def\@noitemerr{\@latex@warning{Empty `thebibliography' environment}}%
  \endlist
}
%\let\endthebibliography=\endlist

\endinput
%%
%% End of file `imeko_acta.cls'.
