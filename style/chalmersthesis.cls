% Chalmers University of Technology thesis class designed by Felix Augustsson 2021

% Frontmatter and backmatter are derivatives based on "Chalmers University of Technology Master's Thesis" by Magnus Gustaver, found at https://sv.overleaf.com/latex/templates/chalmers-university-of-technology-masters-thesis/vnjxsndxqxfy, licensed under CC BY by Felix Augustsson.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{chalmersthesis}[2021/02/02 Chalmers University of Technology thesis]

\RequirePackage{kvoptions}
\RequirePackage{xcolor}
\RequirePackage{etoolbox}

% Define new title fields
\providecommand*{\subtitle}[1]{\gdef\@subtitle{#1}}
\providecommand*{\@subtitle}{}
\newcommand*{\examiner}[1]{\gdef\@examiner{#1}%
}
\newcommand*{\@examiner}{Use \string\examiner}
\newcommand*{\supervisor}[1]{\gdef\@supervisor{#1}%
}
\newcommand*{\@supervisor}{Use \string\supervisor}
\newcommand*{\thesistype}[1]{\gdef\@thesistype{#1}}
\newcommand*{\@thesistype}{Use \string\thesistype}
\newcommand*{\department}[1]{\gdef\@department{#1}}
\newcommand*{\@department}{Use \string\department}
\newcommand*{\degree}[1]{\gdef\@degree{#1}}
\newcommand*{\@degree}{Use \string\degree}
\newcommand*{\illustration}[1]{\gdef\@illustration{#1}}
\newcommand*{\@illustration}{}

\SetupKeyvalOptions{
  family=cththesis,
  prefix=cththesis@
}

\DeclareStringOption{thesistype}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOptionKey}{report}}

\ProcessKeyvalOptions*

\ifdefstring{\cththesis@thesistype}{master}{
  \definecolor{thesisHeaderColor}{cmyk}{0.14,0,0,0.65} % Gray
  \thesistype{Master's thesis}
  % Path to front page header background art
  \newcommand*{\@frontpageheaderpath}{GrayHeaderPattern}
}{
\ifdefstring{\cththesis@thesistype}{bachelor}{
  \definecolor{thesisHeaderColor}{RGB}{126,180,56} % Green
  \thesistype{Bachelor's thesis}
  % Path to front page header background art
  \newcommand*{\@frontpageheaderpath}{GreenHeaderPattern}
}{
  \definecolor{thesisHeaderColor}{cmyk}{0.14,0,0,0.65} % Gray
  \thesistype{Use \string\thesistype}
  % Path to front page header background art
  \newcommand*{\@frontpageheaderpath}{GrayHeaderPattern}
}}

\definecolor{headerBrown}{RGB}{144,102,78}


\LoadClass[a4paper]{report}

\RequirePackage{tabularx, booktabs} % For main title framing
\RequirePackage[export]{adjustbox} % For logo of institution
\RequirePackage{geometry} % Adjust margins
\RequirePackage{listings} % Give hint of useable commands
\RequirePackage{lmodern} % Latin modern font
\RequirePackage{helvet} % Enables font switching
\RequirePackage{epstopdf}
\RequirePackage{xspace}

% Redefine \and to work with title style
\renewcommand\and{%
  \\%
  &%
}

% Definition of new title page
\makeatletter
\renewcommand*{\maketitle}{%
  % Use custom marginsP
  \newgeometry{
    top=30mm,
    bottom=30mm,
    left=22.5mm,
    right=22.5mm,
  }
  \begin{titlepage}
    % Use different footnotes
    \renewcommand\thefootnote{\@fnsymbol\c@footnote}

    \setlength{\parindent}{0cm}

    \vtop{
      \null\vspace{-25mm}
      \centerline{\includegraphics[width=1.18\textwidth]{\@frontpageheaderpath}}
      \vspace{-2.3cm}
      \hbox{\hspace{0mm}\includegraphics[height=18mm]{style/AvancezChalmersU_white_right}} % FIXME: Quick "path/eps conversion" fix
      \centerline{\textcolor{headerBrown}{\rule{1.18\textwidth}{4pt}}}
      \vspace{\paperheight}\vspace{-85mm}
      \centerline{\textcolor{thesisHeaderColor}{\rule{1.1\textwidth}{0.8pt}}} % Rule after Department
      \vspace{-\paperheight}\vspace{85mm}
    }

    \ifx\@illustration\@empty
    \else
      \begin{figure}[H]
        \centering
        \vspace{1cm}	% Adjust vertical spacing here
        \includegraphics[width=0.9\linewidth]{\@illustration}
      \end{figure}
    \fi

    \mbox{}
    \vfill
    \renewcommand{\familydefault}{\sfdefault} \normalfont % Set cover page font
    \textbf{{\Huge \@title}} \\[0.5cm]
    \ifx\@subtitle\@empty
    \else
      {\Large \@subtitle} \\[0.5cm]
    \fi
    \@thesistype\xspace in \@degree \setlength{\parskip}{1cm}

    \noindent
    {\Large \@author} \setlength{\parskip}{1.5cm}

    \noindent
    \textcolor{thesisHeaderColor}{\small\textbf{\@department}}
    \setlength{\parskip}{1mm}

    \textsc{Chalmers University of Technology} \\
    {\small Gothenburg, Sweden \@date \\
    \href{www.chalmers.se}{www.chalmers.se}}\vspace{1.7cm}

    \renewcommand{\familydefault}{\rmdefault} \normalfont % Reset standard font
    
    %% Add logo if it exists
    %\begin{minipage}[c]{0.7\textwidth} 
    %  \ifx\@logo\empty
    %  \vspace{3cm}
    %  \else
    %  \includegraphics[max height=3cm,max width=\textwidth]{\@logo}
    %  \fi 
    %\end{minipage}%
    %\hfill
    %% Add degree description
    %\begin{minipage}[c]{0.2\textwidth}\small\texttt{\@degreetype}\end{minipage}
    %\vspace{3cm}
    %\begin{center}
    %  % Description
    %  {\scshape\large \@thesistype}\par
    %  \vspace{0.5cm}
    %  % Project title centered between lines
    %  \begin{tabularx}{\linewidth}{>{\centering\arraybackslash}X}
    %  \toprule
    %  {\Huge \@title} \\
    %  \bottomrule
    %  \end{tabularx}
    %  \par
    %  \vspace{0.5cm}
    %  % Department
    %  {\scshape\large \@department}\par
    %  \vspace{1cm}
    %  % Involved people
    %  \begin{tabular}[t]{rl}
    %  Author: & \@author \\
    %  & \\
    %  Examiner: & \@examiner \\
    %  & \\
    %  Supervisors: & \@supervisor
    %  \end{tabular}
    %  \par
    %  \vfill
    %  % Date
    %  {\large \@date}\par
    %  % Footnotes
    %  \@thanks
    %  \setcounter{footnote}{0}%
    %\end{center}
    \clearpage
    \restoregeometry
    \thispagestyle{empty}
    \mbox{}
  \end{titlepage}
  \restoregeometry
}
\makeatother

\endinput
