

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2025 Persian Master Thesis]

\LoadClass[12pt,a4paper,oneside]{report}

% Required packages (ORDER IS IMPORTANT)
\RequirePackage{graphicx} % must be loaded before bidi/xepersian
\usepackage{subcaption}
\RequirePackage[
  a4paper,
  top=3.5cm,
  right=3.5cm,
  bottom=3cm,
  left=2.5cm
]{geometry}
\RequirePackage{setspace}
\RequirePackage{chngcntr}
\RequirePackage{caption}
\RequirePackage{float}

% include pdfs
\usepackage{pdfpages}





% --- Table numbering per chapter ---
\counterwithin{table}{chapter}
% --- Table number format: chapter-table (with dash) ---
\AtBeginDocument{%
  \renewcommand{\thetable}{(\arabic{table}-\thechapter)}
}

% --- Persian table caption name ---
\renewcommand{\tablename}{جدول}

\DeclareCaptionFont{nazanin}{\BNazaninFont\fontsize{11}{13}\selectfont}
\captionsetup[table]{
labelfont=nazanin,
textfont=nazanin,
labelsep=space
}

% package for long tables
\RequirePackage{longtable}

% Format: جدول (۳-۱) عنوان
\DeclareCaptionLabelFormat{persiantable}{#1 #2}
\captionsetup[table]{labelformat=persiantable}

% NOW load tocloft after setting up tables
\usepackage{tocloft}
% --- List of Tables entry format ---
\renewcommand{\cfttabpresnum}{جدول~}
\renewcommand{\cfttabaftersnum}{}
\setlength{\cfttabnumwidth}{2cm}


% Force tocloft to handle tables in LOT
\makeatletter
\@ifundefined{cfttablefont}{\let\cfttablefont\cftsecfont}{} % Fallback if undefined
\@ifundefined{cfttablepagefont}{\let\cfttablepagefont\cftsecpagefont}{}
\makeatother




% #########################################################
% List of Figures (Images) settings
% #########################################################

% Number figures per chapter
\counterwithin{figure}{chapter}

% Persian name for figures
\renewcommand{\figurename}{شکل}

% Figure numbering format: chapter-figure
\AtBeginDocument{%
  \renewcommand{\thefigure}{(\arabic{figure}-\thechapter)}
}

% Caption font for figures
\DeclareCaptionFont{figurenazanin}{\BNazaninFont\fontsize{11}{13}\selectfont}
\captionsetup[figure]{
  labelfont=figurenazanin,
  textfont=figurenazanin,
  labelsep=space
}

% Caption label format: شکل (#chapter-#figure)
\DeclareCaptionLabelFormat{persianfigure}{#1 #2}
\captionsetup[figure]{labelformat=persianfigure}

% List of Figures (LOT) entry formatting
 % \usepackage{tocloft}

\renewcommand{\cftfigpresnum}{شکل~}
\renewcommand{\cftfigaftersnum}{}
\setlength{\cftfignumwidth}{2cm}

% Ensure LOT font exists
\makeatletter
\@ifundefined{cftfigfont}{\let\cftfigfont\cftsecfont}{}
\@ifundefined{cftfigpagefont}{\let\cftfigpagefont\cftsubsecpagefont}{}
\makeatother


% #########################################################
% List of Graphs (Charts) settings
% #########################################################
\RequirePackage{float} % needed to define new floats
\RequirePackage{caption} % for custom captions

% Create new float called "chart"
\newfloat{chart}{htbp}{loc}[chapter]  % [chapter] resets numbering each chapter
\floatname{chart}{نمودار}               % Persian name for captions

% Number charts per chapter
\RequirePackage{chngcntr}
\counterwithin{chart}{chapter}

% Format chart numbers: chapter-chart
\AtBeginDocument{%
  \renewcommand{\thechart}{(\arabic{chart}-\thechapter)}
}

% Set caption font for charts
\DeclareCaptionFont{chartnazanin}{\BNazaninFont\fontsize{11}{13}\selectfont}
\captionsetup[chart]{labelfont=chartnazanin, textfont=chartnazanin, labelsep=space}

% Caption label format: نمودار (#chapter-#chart)
\DeclareCaptionLabelFormat{persianchart}{#1 #2}
\captionsetup[chart]{labelformat=persianchart}

% List of Charts (LOA) entry formatting -----------------------------------



\DeclareCaptionListFormat{chartlist}{%
  % \makebox[2em][l]{نمودار~(#2)}#1%
  \makebox[2em][l]{نمودار~#2}#1%
}

\captionsetup[chart]{%
  listformat=chartlist
}

\newcommand{\listcharttitleformat}{%
  \centering
  \BNazaninFont\bfseries\fontsize{14}{16}\selectfont
  \par\vspace{-2em}
}
\newcommand{\listchartname}{فهرست نمودارها}

\makeatletter
\newcommand{\listofcharts}{%
  \phantomsection
  % \addcontentsline{toc}{chapter}{فهرست نمودارها}
  \begingroup
    \let\clearpage\relax
    \let\cleardoublepage\relax
    \listof{chart}{}%
  \endgroup
}
\makeatother


% algorithms
\usepackage{algorithm}
\usepackage{algorithmic}


\newfloat{algorithm}{htbp}{alg}[chapter]  % [chapter] resets numbering per chapter
\floatname{algorithm}{\textbf{الگوریتم}}          % Persian name for algorithm captions

% Number algorithms per chapter (like charts)
\counterwithin{algorithm}{chapter}

% Format algorithm numbers: chapter-algorithm
\AtBeginDocument{%
  \renewcommand{\thealgorithm}{(\arabic{algorithm}-\thechapter)}
}

% Set Persian font for algorithm captions
\DeclareCaptionFont{algorithmnazanin}{\BNazaninFont\fontsize{11}{13}\selectfont}
\captionsetup[algorithm]{labelfont=algorithmnazanin, textfont=algorithmnazanin, labelsep=space}

% Format algorithm labels: "الگوریتم (#chapter-#algorithm)"
\DeclareCaptionLabelFormat{persianalgorithm}{#1 #2}
\captionsetup[algorithm]{labelformat=persianalgorithm}

% Ensure algorithms don't appear in list of charts
\makeatletter
\renewcommand{\listofalgorithms}{%
  \phantomsection
  \begingroup
    \let\clearpage\relax
    \let\cleardoublepage\relax
    \listof{algorithm}{}%
  \endgroup
}
\makeatother

% % Reset algorithm counter at start of each chapter
% \AtBeginChapter{\setcounter{algorithm}{0}}

% % Format algorithm numbering as "Chapter-Number"
% \renewcommand{\thealgorithm}{\arabic{algorithm}-\thechapter}
% \renewcommand{\STATE}{\textbf{\arabic{algorithmicline}}\ }

\renewcommand{\algorithmicfor}{{\textbf{به ازای}}}
\renewcommand{\algorithmicto}{{\textbf{تا}}}
\renewcommand{\algorithmicand}{{\textbf{و}}}
\renewcommand{\algorithmicendfor}{{\textbf{پایان به ازای}}}
\renewcommand{\algorithmicwhile}{{\textbf{تا وقتی}}}
\renewcommand{\algorithmicendwhile}{{\textbf{پایان تا وقتی}}}
\renewcommand{\algorithmicdo}{\hspace{-.2em}:}
\renewcommand{\algorithmicif}{{\textbf{اگر}}}
\renewcommand{\algorithmicendif}{{\textbf{پایان اگر}}}
\renewcommand{\algorithmicthen}{\hspace{-.2em}:}
\renewcommand{\algorithmicelse}{{\textbf{در غیر این صورت:}}}
%\renewcommand{\algorithmicelsif}{{در غیر این صورت اگر: }}
\renewcommand{\algorithmicreturn}{{\textbf{برگردان}}}
\renewcommand{\algorithmiccomment}[1]{$\triangleleft$ \emph{#1}}
\renewcommand{\algorithmicrequire}{\textbf{ورودی:}}
\renewcommand{\algorithmicensure}{\textbf{خروجی:}}



% ==================== List of Abbreviations ====================

\usepackage{amsmath,amssymb,amsfonts}
\usepackage{tabularx}   % <-- REQUIRED (fixes & error)
\newcommand{\LTRcell}[1]{\begin{LTR}#1\end{LTR}}
\newcommand{\RTLcell}[1]{\begin{RTL}#1\end{RTL}}
\newcommand{\abbr}[2]{%
  \LTRcell{$#1$} & \RTLcell{#2} \\[6pt]
}

\newcommand{\listofabbreviations}{%
  \clearpage
  \phantomsection
  % \addcontentsline{toc}{chapter}{%
  %   \protect\BNazaninFont\fontsize{14}{16}\selectfont\textbf{فهرست علائم اختصاری}}

  \begin{center}
    {\BNazaninFont\fontsize{14}{16}\selectfont\textbf{فهرست علائم اختصاری}}
  \end{center}

  \vspace{1em}
  \BNazaninFont\fontsize{12}{14}\selectfont

  \renewcommand{\arraystretch}{0.75}
  \begin{LTR}
  \begin{tabularx}{\textwidth}{@{} l >{\raggedleft\arraybackslash}X @{}}
    \abbr{a}{یک اسکالر}
    \abbr{\mathbf{x}}{یک بردار}
    \abbr{\mathcal{S}}{یک توزیع احتمال}
    \abbr{\mathrm{A}}{یک لیست یا مجموعه}
    \abbr{(\cdot)_{i}}{\(i\)-امین عضو یک لیست یا بردار}
    \abbr{(\cdot)[j:k]}{\(j\)-امین تا \(k\)-امین عضو یک لیست یا بردار}
    \abbr{\mathbb{R}}{مجموعه اعداد حقیقی}
    \abbr{\mathbb{Z}}{مجموعه اعداد صحیح}
    \abbr{[n]}{مجموعه اعداد صحیح از \(1\) تا \(n\)}
    \abbr{\langle \cdot , \cdot \rangle}{ضرب داخلی دو بردار در فضای اقلیدسی \(\mathbb{R}^n\)}
    \abbr{\lVert \cdot \rVert_2}{نُرم اقلیدسی یک بردار}
    \abbr{\overset{\$}{\leftarrow}}{عملیات نمونه برداری (سمپلینگ) از یک توزیع}
    \abbr{\mathcal{U}_k}{توزیع یکنواخت بر روی \(\{0,1\}^k\)}
    \abbr{\lambda}{پارامتر امنیت \lr{(Security Parameter)}}
    \abbr{\mathbb{E}}{امید ریاضی}

  \end{tabularx}
  \renewcommand{\arraystretch}{1}
  \end{LTR}


  \clearpage
}

% def, lemma and theorem

\newtheorem{definition}{تعریف}
\newtheorem{theorem}{قضیه}
\newtheorem{lemma}{لم}
\renewcommand{\proof}{\textbf{اثبات:}}



% #########################################################
% chapter and section formatting
% #########################################################
\RequirePackage{titlesec}
\RequirePackage{fancyhdr}
\RequirePackage{xcolor}

\titleformat{\subsection}
  {\BNazaninFont\fontsize{12}{14}\selectfont}
  {\thesubsection}{1em}{}

\titleformat{\subsubsection}
  {\BNazaninFont\fontsize{12}{14}\selectfont}
  {\thesubsubsection}{1em}{}

\newcommand{\ChapterSectionFormats}{%
  \titleformat{\subsection}
    {\BNazaninFont\bfseries\fontsize{14}{16}\selectfont}
    {\thesubsection}{1em}{}
  \titlespacing*{\subsection}{0pt}{36pt}{24pt}

  \titleformat{\subsubsection}
    {\BNazaninFont\bfseries\fontsize{13}{15}\selectfont}
    {\thesubsubsection}{1em}{}
  \titlespacing*{\subsubsection}{0pt}{36pt}{24pt}
}

\usepackage{etoolbox}

\pretocmd{\chapter}{\ChapterSectionFormats}{}{}



% --- Define main chapter style ---
\newcommand{\mainchapterstyle}{
  \titleformat{\chapter}[block]
    {\linespread{1}\setlength{\parskip}{0pt}%
     \hspace{50pt}\BNazaninFont\bfseries\fontsize{22}{22}\selectfont}
    {فصل \thechapter:}
    {8pt}
    {}
    [
      % \ChapterSubsectionStyle
      % \ChapterSubsubsectionStyle
      \hspace{50pt}\titlerule
      \thispagestyle{chapterfirstpage} % use custom page style for first page
      \setlength{\parskip}{12pt}%
      \linespread{1.85}%
      \clearpage
    ]
  \titlespacing*{\chapter}{50pt}{72pt}{0pt}
}

% --- Define fancy page style for first page of chapter ---
\fancypagestyle{chapterfirstpage}{%
  \fancyhf{} % clear everything
  \renewcommand{\headrulewidth}{0pt} % no header line
  \fancyfoot[C]{} % no footer (no page number)
}

% --- Define normal header for rest of chapter ---
\renewcommand{\chaptermark}[1]{%
  \markboth{فصل \thechapter: #1}{}%
}

% \newcommand{\thesistitle}{عنوان پایان‌نامه}
\newcommand{\thesistitle}{عنوان پایان‌نامه / رساله}


\fancypagestyle{mainheader}{%
  \fancyhf{} % clear everything
  % \fancyhead[L]{\BNazaninFont\fontsize{11}{13}\selectfont فصل \thechapter: مقدمه} % left: chapter title (you can make dynamic later)
  \fancyhead[L]{\BNazaninFont\fontsize{11}{13}\selectfont \leftmark} % left: chapter title (you can make dynamic later)

  \fancyhead[R]{\BNazaninFont\fontsize{11}{13}\selectfont \thesistitle}       % right: thesis title
  \fancyfoot[C]{%
    \BNazaninFont\fontsize{10}{12}\selectfont
    \thepage
  } % page number bnazanin 10 font center footer
  \renewcommand{\headrulewidth}{0.4pt} % horizontal line
}

% footnote formatting settings
\RequirePackage{perpage}
\MakePerPage{footnote}

% \newfontface\footnotefont{Times New Roman}

\renewcommand{\footnotesize}{%
  \footnotefont\fontsize{9}{11}\selectfont
}

\makeatletter
\renewcommand{\@makefnmark}{%
  \textsuperscript{%
    {\footnotefont\fontsize{9}{9}\selectfont \@thefnmark}%
  }%
}
\makeatother

% bullet settings
% \makeatletter
% \renewcommand{\labelitemi}{\textbullet} % standard bullet

% % Redefine itemize label font
% \renewcommand{\makelabel}[1]{%
%   \hss\BNazaninFont\bfseries\fontsize{13}{15}\selectfont #1%
% }
% \makeatother




% \setlist[itemize,1]{%
%   label={\raisebox{0.2ex}{$\bullet$}},
%   font=\BNazaninFont\bfseries\fontsize{13}{15}\selectfont,
%   labelsep=0.6em,
%   leftmargin=*,
% }
\usepackage{enumitem}

\setlist[itemize,1]{%
  label={\raisebox{0.2ex}{\normalfont$\bullet$}},
  labelsep=0.6em,
  leftmargin=*,
  font=\BNazaninFont\bfseries\fontsize{13}{15}\selectfont,
}


\counterwithin{equation}{chapter}

% Customize equation numbering: (equationnumber-chapternumber)


% \makeatletter
% \renewenvironment{equation}
%   {\setlength{\parskip}{0pt}\refstepcounter{equation}% Increment equation counter
%    \begin{trivlist} % Start a trivlist (handles vertical space)
%    \item[]\leavevmode % Start list item, leave vertical mode
%    \hspace{\fill}\bgroup$\displaystyle}% Start equation box, aligned to the left
%   {$\egroup % End equation box
%    \end{trivlist} % End trivlist
%    \par\hspace{\fill}(\theequation)\hspace*{2em}\par % Place equation number on a new line, aligned left
%    \vskip\belowdisplayskip\setlength{\parskip}{12pt}} % Add vertical space below the equation
   
% \makeatother

\makeatletter
\renewenvironment{equation}
  {\setlength{\parskip}{0pt}\refstepcounter{equation}% Increment equation counter
   \begin{samepage}% Keep everything on same page
   \begin{trivlist}% Start a trivlist
   \item[]\leavevmode% Start list item, leave vertical mode
   \hspace{\fill}\bgroup$\displaystyle}% Start equation box
  {$\egroup% End equation box
   \end{trivlist}% End trivlist
   \par\hspace{\fill}(\theequation)\hspace*{2em}\par% Place equation number
   \end{samepage}% End samepage environment
   \vskip\belowdisplayskip\setlength{\parskip}{12pt}}% Add vertical space
\makeatother


% references formatting
% \usepackage{xpatch}

% Patch \cite to fix inline RTL brackets
% \usepackage[colorlinks=true, linkcolor=blue, citecolor=blue, urlcolor=blue]{hyperref}
\usepackage[colorlinks=true, linkcolor=black, citecolor=black, urlcolor=black]{hyperref}


\makeatletter
\let\oldcite\cite
\renewcommand{\cite}[1]{%
  \textfontfamily{\latinfont}%
  \begingroup
    \def\@tempcite{\oldcite{#1}}%
    \mbox{\lr{\@tempcite}}%
  \endgroup
}
\makeatother


% bulet for references





% #########################################################
% end of chapter and section formatting
% #########################################################




\RequirePackage{xepersian}

\AtBeginDocument{%
  \newfontface\footnotefont{Times New Roman}
}

\makeatletter
\renewcommand{\theequation}{%
  \arabic{chapter}-\arabic{equation}%
}
\makeatother





% Force base font sizes according to university standard
% Persian text: 13pt, English text: 12pt
\AtBeginDocument{%
\fontsize{13}{16}\selectfont
}

% Page style
\pagestyle{plain}

% #########################################################
% table of contents settings
% #########################################################

% -------- Chapter & Section Numbering Format --------
\renewcommand{\thechapter}{\arabic{chapter}}
\renewcommand{\thesection}{\thechapter-\arabic{section}-}
\renewcommand{\thesubsection}{\thesection\arabic{subsection}-}
\renewcommand{\thesubsubsection}{\thesubsection\arabic{subsubsection}-}

% -------- TOC Chapter Format --------
\renewcommand{\cftchappresnum}{فصل\ }   % before chapter number
\renewcommand{\cftchapaftersnum}{:\ }   % after chapter number
\setlength{\cftchapnumwidth}{1cm}       % adjust to fit "فصل #: "

% Leader dots for chapters
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}}

% -------- TOC Fonts --------
\renewcommand{\cftchapfont}{\BNazaninFont\mdseries\fontsize{12}{14}\selectfont}
\renewcommand{\cftchappagefont}{\BNazaninFont\mdseries\fontsize{12}{14}\selectfont}
\renewcommand{\cftsecfont}{\fontsize{12}{14}\selectfont\BNazaninFont}
\renewcommand{\cftsubsecfont}{\fontsize{12}{14}\selectfont\BNazaninFont}
\renewcommand{\cftsubsubsecfont}{\fontsize{12}{14}\selectfont\BNazaninFont}

% -------- List of Tables fonts --------
% Ensure these commands exist
\makeatletter
\@ifundefined{cfttablefont}{\renewcommand{\cfttablefont}{\fontsize{12}{14}\selectfont\BNazaninFont}}{}
\@ifundefined{cfttablepagefont}{\renewcommand{\cfttablepagefont}{\fontsize{12}{14}\selectfont\BNazaninFont}}{}
\makeatother

% -------- TOC Indentation --------
\setlength{\cftsecindent}{0.5cm}
\setlength{\cftsubsecindent}{1cm}
\setlength{\cftsubsubsecindent}{1.5cm}


% Allow flexible line breaks everywhere
\sloppy



\newcommand{\vecb}[1]{\mathbf{#1}} % short command for vector
\newcommand{\distribution}[1]{\mathcal{#1}}  % short command for distribution
\newcommand{\listset}[1]{\mathrm{#1}} % short command for list and sets
\newcommand{\innerproduct}[2]{\langle #1, #2 \rangle} % short for inner product
\newcommand{\norm}[1]{\|\vecb{#1}\|_2} % short for norm
\newcommand{\rsample}{\overset{\$}{\leftarrow}} % short for random sampling
\newcommand{\genprocess}{\overline{\mathsf{Model}}} % short for gen process model
\newcommand{\scheme}[1]{\mathcal{#1}} % short for schemes
\newcommand{\lm}{\mathsf{Model}} % language model
\newcommand{\Alg}[1]{\mathsf{#1}} % algorithm
\newcommand{\key}[1]{\mathsf{#1}} % secret key
\newcommand{\history}{\boldsymbol{\rho}} % prompt
\newcommand{\negl}{\mathsf{negl}} % \negl
\newcommand{\prf}{\mathsf{F}} % pseudo random function(PRF)
\newcommand{\Hybrid}{\mathsf{Hyb}}  % Main hybrid command

\newcommand{\Adv}{\mathbf{Adv}}   % For advantage notation

\newcommand{\Fail}{\mathbf{Fail}}   % For advantage notation

\newcommand{\RobFail}{\mathbf{RFail}}   % For advantage notation








