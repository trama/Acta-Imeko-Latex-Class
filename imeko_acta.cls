%% ACTA IMEKO Latex class file
%% Vers: 1.0
%% By: Federico Tramarin (tramarin@unimore.it)
%% Date: 12/09/2023
%% Notes: This version builds over the first draft (see below). Several bugs have been solved 
%%    - removed use of \bf \it etc.
%%    - missing definitions
%%    - removed unneded packges
%%
%% The main reasons is that matching with the Word template requires quite a lot of font tunings, and obsolete commands (like \bf \it) do not support LaTeX2e's new font selection scheme, or NFSS{\bf foo}, for example, resets all font attributes which had been set earlier. also, we need new options to produce the camera ready and final version, etc.

% This class file was originally downloaded as SelfArx.cls
% Template Source: This template has been downloaded from:
% http://www.latextemplates.com/template/stylish-article
% License: CC BY-NC-SA 3.0 
% The vast majority of original markup has been removed. 
% The class is now for:
% IMEKO ACTA (https://acta.imeko.org/index.php/acta-imeko)
% By: Corey Stambaugh (corey.stambaugh @ nist.gov)
% Vers: 1.0
% Date: 09/12/2018 
% Notes: Sets up the majority of options to produce required formatting for ACTA IMEKO.
%
% The class has been written to mimic the template style of:
% https://acta.imeko.org/index.php/acta-imeko/article/view/IMEKO-ACTA-00%282011%29-01-04
% which is written as a .doc file by:
% Thomas Bruns, Dirk Röske, Paul P. L. Regtien, Francisco Alegria
%% latex style practice

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{imeko_acta}[2023/09/12 Acta Imeko paper class v1.0]


\LoadClass[10pt,a4paper]{article}
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
% using EB-Garamond for serif text
\RequirePackage[lining]{ebgaramond}
% using Helvetica for sans-serif
\renewcommand{\sfdefault}{phv}
\usepackage{microtype} % without this, with ebgaramond many lines go out of the margin due to hyphenation issues

\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{ifpdf,ifxetex}      % Needed to pick between latex and pdflatex
\RequirePackage[fleqn]{amsmath}
\RequirePackage{graphicx,xcolor}
%\RequirePackage[english]{babel}
\RequirePackage{indentfirst}
\RequirePackage{caption}
\RequirePackage[explicit]{titlesec}
\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\RequirePackage{enumitem}
\RequirePackage{array,booktabs}
%only needed if we want to have a double column float * mandatory* at the bottom (because latex only put them at th etop by default)
%\RequirePackage{stfloats} 

\ifxetex
\RequirePackage{fontspec,unicode-math}
\setsansfont{Calibri}
\setmathfont{Cambria Math}
\fi


%% To choose the type of manuscript
\DeclareOption{article}{\gdef\@arttype{Article}}
\DeclareOption{technicalnote}{\gdef\@arttype{Technical Note}}
\DeclareOption{editorial}{\gdef\@arttype{Editorial}}

%% To choose the status of the manuscript
\DeclareOption{submit}{\gdef\@status{submit}}
\DeclareOption{final}{\gdef\@status{final}}

%\AtEndOfClass{\RequirePackage{microtype}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%% Defaults
\ExecuteOptions{10pt,a4paper,article,submit}

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

% Set correct margins
%\RequirePackage[left=1.5cm,right=1.5cm,top=2.0cm,bottom=2.5cm,headheight=11pt,a4paper]{geometry}

% Font tweaks (mostly on the baseline skip) to match Word template
%\typeout{-- This is a 10 point document.}
\def\normalsize{\@setfontsize{\normalsize}{10}{12.00pt}}%
%\setlength{\@IEEEnormalsizefontbaselineskip}{12pt}%
\normalsize
\abovedisplayskip 1.5ex plus4pt minus2pt%
\belowdisplayskip \abovedisplayskip%
\abovedisplayshortskip 0pt plus4pt%
\belowdisplayshortskip 1.5ex plus4pt minus2pt
\def\small{\@setfontsize{\small}{9}{10pt}}
\def\footnotesize{\@setfontsize{\footnotesize}{8}{8pt}}
\def\scriptsize{\@setfontsize{\scriptsize}{7}{7pt}}
\def\tiny{\@setfontsize{\tiny}{5}{6pt}}
% sublargesize is a tad smaller than large - 11pt
\def\sublargesize{\@setfontsize{\sublargesize}{11}{13.4pt}}
\def\large{\@setfontsize{\large}{12}{14pt}}
\def\nlarge{\@setfontsize{\nlarge}{13}{15pt}}
\def\Large{\@setfontsize{\Large}{14}{17pt}}
\def\LARGE{\@setfontsize{\LARGE}{17}{20pt}}
%%%%
\def\nLARGE{\@setfontsize{\nLARGE}{19}{21pt}}
%%%%
\def\huge{\@setfontsize{\huge}{20}{24pt}}
\def\Huge{\@setfontsize{\Huge}{24}{28pt}}
%\fi

%---------------------------------------------------------------------% Various definitions
%---------------------------------------------------------------------

%Tweak first line indent width
\parindent 1.0em

\definecolor{ActaBlue}{RGB}{19,33,94}
\definecolor{color2}{RGB}{205,217,240} % Color of the boxes behind the abstract and headings

% Definitions for ABSTRACT+AUTHOR FRAME
%----------------------------------------------------------------------  

\newcommand{\PaperTitle}[1]{\def\@PaperTitle{#1}}
\newcommand{\Archive}[1]{\def\@Archive{#1}}
% \newcommand{\Authors}[1]{\def\@Authors{#1}}
% \newcommand{\AuthorsNew}[2]{\def\@AuthorsNew[#1]{#2}}
\newcommand{\Journal}[1]{\def\@Journal{#1}}
\newcommand{\ISSN}[1]{\def\@ISSN{#1}}
\newcommand{\JournalInfo}[1]{\def\@JournalInfo{#1}}
\newcommand{\Abstract}[1]{\def\@Abstract{#1}}
\newcommand{\Keywords}[1]{\def\@Keywords{#1}}
\newcommand{\Section}[1]{\def\@Section{#1}}
\newcommand{\Citation}[1]{\def\@Citation{#1}}
\newcommand{\Editor}[1]{\def\@Editor{#1}}
\newcommand{\CopyRight}[1]{\def\@CopyRight{#1}}
\newcommand{\Funding}[1]{\def\@Funding{#1}}
\newcommand{\CorAuthor}[1]{\def\@CorAuthor{#1}}
\newcommand{\Received}[1]{\def\@Received{#1}}
\newcommand{\FinalForm}[1]{\def\@FinalForm{#1}}
\newcommand{\Published}[1]{\def\@Published{#1}}
\newcommand{\AuthorsNames}{\@AuthorsNames}


\RequirePackage[unicode=true,
	bookmarksopen={true},
	pdffitwindow=true, 
	colorlinks=true, 
	linkcolor=ActaBlue, 
	citecolor=ActaBlue, 
	urlcolor=ActaBlue, 
	hyperfootnotes=true, 
	pdfstartview={FitH},
	pdfpagemode= UseNone]{hyperref}

%%%% Metadata
\newcommand{\org@maketitle}{}% LATEX-Check
\let\org@maketitle\maketitle
\def\maketitle{%
	\hypersetup{
		pdftitle={\@PaperTitle},
		pdfsubject={\@Abstract},
		pdfkeywords={\@Keywords},
		pdfauthor={\@AuthorsNames}
		}%
	\org@maketitle
}

% IEEE uses 5) not 5.
\def\labelenumi{\theenumi)}     \def\theenumi{\arabic{enumi}}

% IEEE uses a) not (a)
\def\labelenumii{\theenumii)}  \def\theenumii{\alph{enumii}}

% IEEE uses iii) not iii.
\def\labelenumiii{\theenumiii)} \def\theenumiii{\roman{enumiii}}

% IEEE uses A) not A.
\def\labelenumiv{\theenumiv)}   \def\theenumiv{\Alph{enumiv}}

% exactly the same as in article.cls
\def\p@enumii{\theenumi}
\def\p@enumiii{\theenumi(\theenumii)}
\def\p@enumiv{\p@enumiii\theenumiii}

\setlist{nosep}
\newlist{enumerate-a}{enumerate}{1}
\setlist[enumerate-a,1,2]{label=\alph*.}
\setlist[itemize,1]{label=-}


% copied from IEEEtran
% LaTeX is a little to quick to use hyphenations
% So, we increase the penalty for their use and raise
% the badness level that triggers an underfull hbox
% warning. The author may still have to tweak things,
% but the appearance will be much better "right out
% of the box" than that under V1.5 and prior.
% TeX default is 50
\hyphenpenalty=1000
% If we didn't adjust the interword spacing, 2200 might be better.
% The TeX default is 1000
\hbadness=2200
% IEEE does not use extra spacing after punctuation
\frenchspacing
%%%% Widows & orphans
\clubpenalty=10000
\widowpenalty=10000
\displaywidowpenalty=10000

\setlength{\fboxrule}{0.75pt} % Width of the border around the abstract

% normally zero, should be relative to font height.
% put in a little rubber to help stop some bad breaks (underfull vboxes)
\parskip 0ex plus 0.2ex minus 0.1ex
\setlength{\mathindent}{0pt}

% adjust caption properties
\captionsetup{format=plain,indention=0in,singlelinecheck=false,font={sf,footnotesize},labelsep=period,justification=justified}
\setlength{\abovecaptionskip}{6pt}
\setlength{\belowcaptionskip}{0pt}

% set tabular/tables to use sans-serif small fonts
\renewcommand{\tabular}{\let\@halignto\@empty\sffamily\footnotesize\@tabular}

% Set the page header
\renewcommand{\headrulewidth}{0pt}% % No header rule
\renewcommand{\footrulewidth}{0.75pt}% % No footer rule
\pagestyle{fancy}          % Enables the custom headers/footers
\newcommand{\PaperFooter}[3]{\def\@PaperFooter{#1 \textbar{} Volume #2 \textbar{} Number #3 \textbar{} }}
% Headers
\lhead{}%
\chead{}%
\rhead{}
% Footers
\lfoot{\footnotesize\sffamily\selectfont {ACTA IMEKO \textbar{}  www.imeko.org}}%
\cfoot{}%
\rfoot{\footnotesize\sffamily\selectfont \@PaperFooter \thepage}%

% Settings for titles of sections and subsections
\titleformat{\section}{\sffamily\bfseries\normalsize}{}{0em}
{{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\sffamily{\arabic{section}.} \MakeUppercase{#1}}}}[]

\titleformat{name=\section,numberless}{\sffamily\bfseries\normalsize}{}{0em}{{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{\MakeUppercase{#1}}}}[]

\titleformat{\subsection}{\sffamily\bfseries\small}{}{0em}{{\parbox{\dimexpr\linewidth-2\fboxsep\relax}{{\arabic{section}.\arabic{subsection}.} {#1}}}}[] 

\titlespacing*{\section}{0pc}{3ex \@plus4pt \@minus3pt}{5pt}
\titlespacing*{\subsection}{0pc}{2.5ex \@plus3pt \@minus2pt}{0pt}
\titlespacing*{\subsubsection}{0pc}{2ex \@plus2.5pt \@minus1.5pt}{0pt}
\titlespacing*{\paragraph}{0pc}{1.5ex \@plus2pt \@minus1pt}{10pt}


% Definitions to manage multiple authors
% Definitions for management of multiple authors and affiliations
% adapted from the code of elsarticle
\def\CorrespAut{}

\def\author{\@@author}
\let\authorsep\@empty
\let\sep\@empty
\def\@AIaffiliation{}
\def\@AIauthors{}
\def\@AuthorsNames{}
\def\@AICorrespondingAuthor{}

% Create Authors string with superscripts indicating their affiliation
% However, at the first round, there can not be a match between author and affiliation
% So first round we write affn?
% then we process
%\def\@currentAuthor{}
\def\@@author[#1]#2{%
    \g@addto@macro\@AIauthors{%
    \def\baselinestretch{1}%
    \authorsep#2\unskip\textsuperscript{%
      	\@for\@@affmark:=#1\do{%
       		\edef\affnum{\@ifundefined{X@\@@affmark}{affn?}{\AIrefMark{\@@affmark}}}%
     		\unskip\sep\affnum\let\sep=,}%
      	\ifx\@corref\@empty\else\unskip\sep a corref\g@addto@macro\@AICorrespondingAuthor{#2, }%
		\@corref\let\sep=,\fi
      	}%
    \def\authorsep{\unskip,\space}%
    \global\let\sep\@empty%
	\global\let\@corref\@empty}
    \g@addto@macro\@AuthorsNames{#2, }%
}

% we  process all the affiliations, creating an affLabel for each one
% and then writing them down
% in this phase, at the first round, we hence create the variables for cross referencing with 
% authors, in the second round
\def\affiliation{\@@affiliation}
\newcounter{affn}
\renewcommand\theaffn{\arabic{affn}}
\long\def\@@affiliation[#1]#2{%
	\g@addto@macro\@AIaffiliation{%
		\def\baselinestretch{1}%
		\refstepcounter{affn}%
		\xdef\@currentlabel{\theaffn}%
		\AIaffLabel{#1}%here we create a first round of refmarks for each affiliation
		\textsuperscript{\theaffn}#2\par}%
	}

% AIaffLabel used  in the first round to create a global variable for affiliation referencing
\def\AIaffLabel#1{\@bsphack\protected@write\@auxout{}%
	{\string\NewAIaffLabel{#1}{\@currentlabel}}\@esphack}
	\def\NewAIaffLabel#1#2{\expandafter\xdef\csname X@#1\endcsname{#2}}
% AIrefMark is used in the second round to xref the previous defined variables
\def\AIrefMark#1{\@ifundefined{X@#1}{0}{\csname X@#1\endcsname}}

\let\@corref\@empty
\def\corref{\edef\cnotenum{\AIrefMark{AIcorrAuthor}}%
 	\edef\@corref{%
		\ifcase\cnotenum\or%
		$\ast$\or$\ast\ast$\fi\hskip-1pt}}

\newcounter{cnote}
\def\cortext#1{\g@addto@macro\CorrespAut{%
	\refstepcounter{cnote}%
	\AIaffLabel{AIcorrAuthor}%
	\@AICorrespondingAuthor
	#1}}

%----------------------------------------------------------------------
%	LIST CONTROL
%----------------------------------------------------------------------  

%%%% URL
\RequirePackage{url}
\urlstyle{same}
% Line breaks in URL
\def\UrlDigits{\do\1\do\2\do\3\do\4\do\5\do\6\do\7\do\8\do\9\do\0}
\g@addto@macro{\UrlBreaks}{\UrlOrds}
\g@addto@macro{\UrlBreaks}{\UrlDigits}

%\setlist{nolistsep} % Uncomment to remove spacing between items in lists (enumerate, itemize)

% ---------------------------------------------------------------------

\renewcommand{\@maketitle}{%
	\twocolumn[{%
	%	\thispagestyle{empty}%
		\vskip-24pt%
		\begin{minipage}[b]{0.925\textwidth}
			{\raggedright
				{\sublargesize\sffamily\bfseries\selectfont {\@Journal}}\\
				{\footnotesize\sffamily\bfseries\selectfont {\@ISSN}}\\
				{\footnotesize\sffamily\itshape\selectfont {\@JournalInfo}}\\
				\noindent\textcolor{ActaBlue}{\rule{\textwidth-2pt}{1.5pt}}}%
		\end{minipage}
		\begin{minipage}[b]{0.05\textwidth}
			\includegraphics[width=0.5in]{IMEKO.png}
		\end{minipage}
		\vskip24pt%
		{\raggedright{\fontsize{18}{18}\sffamily\bfseries\selectfont \@PaperTitle}\par}%
		\vskip14pt%
		{\raggedright{\sublargesize\sffamily\bfseries\selectfont \@AIauthors}\par}%
		\vskip12pt%
		\begingroup%
		\raggedright\sffamily\itshape%\small%
		\footnotesize%
		\@AIaffiliation\par%
		\endgroup%%
		\vskip18pt%
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
		\vskip12pt%
		\hbox to \textwidth{\leaders\hbox to 2pt{\scriptsize . \hss}\hfil}
		\vskip10pt%
		{\footnotesize\sffamily\bfseries\selectfont {{Section:}}}
		{\footnotesize\sffamily\selectfont {\@Section}}
		\vskip4pt%pt%
		{\footnotesize\sffamily\bfseries\selectfont {{Keywords:}}}
		{\footnotesize\sffamily\selectfont {\@Keywords}}
		\vskip4pt%pt%
		{\footnotesize\sffamily\bfseries\selectfont {{Citation:}}}
		{\footnotesize\sffamily\selectfont {\@Citation}}
		\vskip4pt%
		{\footnotesize\sffamily\bfseries\selectfont {{Section Editor:}}}
		{\footnotesize\sffamily\selectfont {\@Editor}}
		\vskip4pt%
		{\footnotesize\sffamily\bfseries\selectfont {{Received:}}}
		{\footnotesize\sffamily\selectfont {\@Received;}}
		{\footnotesize\sffamily\bfseries\selectfont {{In Final Form:}}}
		{\footnotesize\sffamily\selectfont {\@FinalForm;}}
		{\footnotesize\sffamily\bfseries\selectfont {{Published:}}}
		{\footnotesize\sffamily\selectfont {\@Published.}}
		\vskip4pt%
		{\footnotesize\sffamily\bfseries\selectfont {Copyright:}}
		{\footnotesize\sffamily\selectfont {\@CopyRight}}
		\vskip4pt%
		{\footnotesize\sffamily\bfseries\selectfont {Funding:}}
		{\footnotesize\sffamily\selectfont {\@Funding}}
		\vskip4pt%
		{\footnotesize\sffamily\bfseries\selectfont {Corresponding Author:}}
		{\footnotesize\sffamily\selectfont {\@CorAuthor}}
		\vskip4pt%
		\hbox to \textwidth{\leaders\hbox to 2pt{\scriptsize . \hss}\hfil}
		\vskip16pt%
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
	\setlength\itemsep{0pt}}%