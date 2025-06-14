\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ata_desc}[2025/06/15 Classe para atas do DESC/UERJ]

% Opções da classe
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

% Herda da classe article
\LoadClass[12pt,a4paper]{article}

% Pacotes necessários
\RequirePackage{fancyhdr}
\RequirePackage[portuguese]{babel}
\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{xcolor}
\RequirePackage{xspace}
\RequirePackage{graphicx}
\RequirePackage[left=2.48cm,right=1.7cm,top=2.35cm,marginparwidth=3.4cm]{geometry}
\RequirePackage{enumitem}

% Configurações de cabeçalho
\newcommand{\universitylogo}{logo_uerj_cor.jpg}
\fancyheadoffset[L]{2mm}
\renewcommand{\headrulewidth}{0pt}

% Cabeçalho da primeira página
\fancypagestyle{firstpage}{
	\fancyhf{}
	\lhead{
		\begin{minipage}{0.15\textwidth}
			\includegraphics[width=2.5cm]{\universitylogo}
		\end{minipage}
		\hfill 
		\begin{minipage}{0.85\textwidth}
			\raggedright
			UNIVERSIDADE DO ESTADO DO RIO DE JANEIRO \\
			CENTRO DE TECNOLOGIA E CIÊNCIAS \\
			FACULDADE DE ENGENHARIA \\
			DEPARTAMENTO DE ENGENHARIA DE SISTEMAS E COMPUTAÇÃO \\
		\end{minipage}
	}
}

% Estilo das páginas seguintes
\pagestyle{plain}

% Comandos para professores
\newcommand{\cristiana}{Prof\textsuperscript{a} Cristiana Barbosa Bentes\xspace}
\newcommand{\matcristiana}{matrícula 30729-8\xspace}
\newcommand{\felipe}{Prof. Felipe Cassemiro Ulrichsen\xspace}
\newcommand{\matfelipe}{matrícula 42354-1\xspace}
\newcommand{\gabriel}{Prof. Gabriel Cardoso de Carvalho\xspace}
\newcommand{\matgabriel}{matrícula 42361-6\xspace}
\newcommand{\giomar}{Prof. Giomar Oliver Sequeiros Olivera\xspace}
\newcommand{\matgiomar}{matrícula 41726-1\xspace}
\newcommand{\joao}{Prof. João Araujo Ribeiro\xspace}
\newcommand{\matjoao}{matrícula 8055-6\xspace}
\newcommand{\luiza}{Prof\textsuperscript{a} Luiza de Macedo Mourelle\xspace}
\newcommand{\matluiza}{matrícula 7058-1\xspace}
\newcommand{\margareth}{Prof\textsuperscript{a} Margareth Simões Penello Meirelles\xspace}
\newcommand{\matmargareth}{matrícula 33784-0\xspace}
\newcommand{\luigi}{Prof. Luigi Maciel Ribeiro\xspace}
\newcommand{\matluigi}{matrícula 42383-0\xspace}
\newcommand{\rafaela}{Prof\textsuperscript{a} Rafaela Correia Brum\xspace}
\newcommand{\matrafaela}{matrícula 42384-8\xspace}
\newcommand{\robert}{Prof. Robert Mota Oliveira\xspace}
\newcommand{\matrobert}{matrícula 41623-0\xspace}
\newcommand{\simone}{Prof\textsuperscript{a} Simone Ingrid Monteiro Gama\xspace}
\newcommand{\matsimone}{matrícula 42362-4\xspace}
\newcommand{\silas}{Prof. Silas Pereira Lima Filho\xspace}
\newcommand{\matsilas}{matrícula 42995-1\xspace}
\newcommand{\thiago}{Prof. Thiago Medeiros Carvalho\xspace}
\newcommand{\matthiago}{matrícula 42350-9\xspace}

% Comando para itens aprovados
\newcommand{\aprovado}{\textcolor{red}{\textbf{APROVADO}}}

% Configurações de formatação
\AtBeginDocument{
	\headsep = 20pt
	\setlength{\parindent}{0cm}
	\setlength{\tabcolsep}{5pt}
	
	% Configuração da lista de pauta
	\setlist[enumerate]{label=\Roman*., nosep, leftmargin=*}
}

% Comandos para conversão de números por extenso (Português)
\makeatletter

% Macro to ensure a number string has a certain number of digits with leading zeros
% #1: input number (e.g., 9, 25, 123)
% #2: desired total number of digits (e.g., 2, 3, 4)
% #3: output macro name (e.g., \myresult)
\newcommand{\@ensure@digit@count}[3]{%
  \edef\@normnum{\number#1}% Normalize the input number
  \def\@padding{}% Initialize padding
  \ifcase#2\relax % Desired digit count
    % Case 0 and 1 are not typical for this use, default to no padding
    \edef#3{\@normnum}%
  \or % Case 1 digit (no padding needed beyond normalization)
    \edef#3{\@normnum}%
  \or % Case 2 digits
    \ifnum\@normnum<10\relax \def\@padding{0}\fi
    \edef#3{\@padding\@normnum}%
  \or % Case 3 digits
    \ifnum\@normnum<10\relax \def\@padding{00}\else
      \ifnum\@normnum<100\relax \def\@padding{0}\fi
    \fi
    \edef#3{\@padding\@normnum}%
  \or % Case 4 digits
    \ifnum\@normnum<10\relax \def\@padding{000}\else
      \ifnum\@normnum<100\relax \def\@padding{00}\else
        \ifnum\@normnum<1000\relax \def\@padding{0}\fi
      \fi
    \fi
    \edef#3{\@padding\@normnum}%
  \else % Default for other digit counts (e.g., >4 or invalid)
    \def#3{[Unsupported Digit Count #2]}% Or just \edef#3{\@normnum}
  \fi
}

% Unidades (1-9)
% \@numtoword@unidade{<num>}{<outputmacro>}
\newcommand{\@numtoword@unidade}[2]{%
  \ifcase#1\relax
    \def#2{}% 0 - vazio
  \or\def#2{um}% 1
  \or\def#2{dois}% 2
  \or\def#2{três}% 3
  \or\def#2{quatro}% 4
  \or\def#2{cinco}% 5
  \or\def#2{seis}% 6
  \or\def#2{sete}% 7
  \or\def#2{oito}% 8
  \or\def#2{nove}% 9
  \else\def#2{[Unidade Inválida]}%
  \fi
}

% Dezenas especiais (10-19)
% \@numtoword@dezena@dez{<num>}{<outputmacro>}
\newcommand{\@numtoword@dezena@dez}[2]{%
  \ifcase#1\relax
    \def#2{dez}% 10
  \or\def#2{onze}% 11
  \or\def#2{doze}% 12
  \or\def#2{treze}% 13
  \or\def#2{catorze}% 14
  \or\def#2{quinze}% 15
  \or\def#2{dezesseis}% 16
  \or\def#2{dezessete}% 17
  \or\def#2{dezoito}% 18
  \or\def#2{dezenove}% 19
  \else\def#2{[Dezena Inválida]}%
  \fi
}

% Dezenas puras (20, 30, ..., 90)
% \@numtoword@dezena@pura{<digit dezena>}{<outputmacro>}
\newcommand{\@numtoword@dezena@pura}[2]{%
  \ifcase#1\relax
    \def#2{}%
  \or\def#2{}% não usado para 1X
  \or\def#2{vinte}% 2
  \or\def#2{trinta}% 3
  \or\def#2{quarenta}% 4
  \or\def#2{cinquenta}% 5
  \or\def#2{sessenta}% 6
  \or\def#2{setenta}% 7
  \or\def#2{oitenta}% 8
  \or\def#2{noventa}% 9
  \else\def#2{[Dezena Pura Inválida]}%
  \fi
}

% Números de 1 a 99
% \@numtoword@dd{<numero>}{<outputmacro>}
\newif\if@temunidade@dd % flag para saber se tem unidade e adicionar "e"
\newcommand{\@numtoword@dd}[2]{%
  \edef\@tempnum{\number#1}% Ensure #1 is treated as a number, e.g. "00" -> 0
  \def#2{}% Default to empty output
  \ifnum\@tempnum<0\relax \def#2{[Número Negativo Inválido]}\fi
  \ifnum\@tempnum=0\relax \def#2{}\fi % Explicitly empty for 0
  \ifnum\@tempnum>0\relax % 1-99
    \ifnum\@tempnum<10\relax % 1-9
      \@numtoword@unidade{\@tempnum}{#2}%
    \else
      \ifnum\@tempnum<20\relax % 10-19
        \expandafter\@numtoword@dezena@dez\expandafter{\the\numexpr\@tempnum-10\relax}{#2}%
      \else % 20-99
        \@temunidade@ddfalse
        \@ensure@digit@count{\@tempnum}{2}{\@padded@dd@num}% Ensure 2 digits for parsing
        \edef\@dezena{\expandafter\@firstoftwo\@padded@dd@num}%
        \edef\@unidade{\expandafter\@secondoftwo\@padded@dd@num}%
        \@numtoword@dezena@pura{\@dezena}{\@dezenaword}%
        \ifnum\number\@unidade>0 % Compare as number
            \@temunidade@ddtrue
            \@numtoword@unidade{\@unidade}{\@unidadeword}%
        \fi
        \if@temunidade@dd
            \edef#2{\@dezenaword\ e \@unidadeword}%
        \else
            \def#2{\@dezenaword}%
        \fi
      \fi
    \fi
  \fi
  \ifnum\@tempnum>99\relax \def#2{[DD Inválido (>99)]}\fi
}
% Helpers to get digits (simplistic, for 2-digit numbers only)
\def\@firstoftwo#1#2{#1}
\def\@secondoftwo#1#2{#2}

% Centenas puras (100, 200, ..., 900)
% \@numtoword@centena@pura{<digit centena>}{<outputmacro>}
\newcommand{\@numtoword@centena@pura}[2]{%
  \ifcase#1\relax
    \def#2{}%
  \or\def#2{cem}% 1xx (para 100 sozinho) / "cento" (para 101-199)
  \or\def#2{duzentos}%
  \or\def#2{trezentos}%
  \or\def#2{quatrocentos}%
  \or\def#2{quinhentos}%
  \or\def#2{seiscentos}%
  \or\def#2{setecentos}%
  \or\def#2{oitocentos}%
  \or\def#2{novecentos}%
  \else\def#2{[Centena Pura Inválida]}%
  \fi
}

% Números de 1 a 999 (estrutura básica)
% \@numtoword@ccc{<numero>}{<outputmacro>}
\newcommand{\@numtoword@ccc}[2]{%
  \edef\@tempnumccc{\number#1}% Ensure #1 is treated as a number
  \def#2{}% Default to empty output
  \ifnum\@tempnumccc<0\relax \def#2{[CCC Negativo Inválido]}\fi
  \ifnum\@tempnumccc=0\relax \def#2{}\fi % Explicitly empty for 0
  \ifnum\@tempnumccc>0\relax
    \ifnum\@tempnumccc<100\relax % 1-99
       \@numtoword@dd{\@tempnumccc}{#2}%
    \else
      \ifnum\@tempnumccc=100\relax \def#2{cem}\fi
      \ifnum\@tempnumccc>100\relax
        \ifnum\@tempnumccc<1000\relax % 101-999
          % Parsing for 3 digits C D U
          \@ensure@digit@count{\@tempnumccc}{3}{\@padded@ccc@num}% Ensure 3 digits
          \edef\@digitoC{\expandafter\@firstofthree\@padded@ccc@num}%
          \edef\@digitoD{\expandafter\@secondofthree\@padded@ccc@num}%
          \edef\@digitoU{\expandafter\@thirdofthree\@padded@ccc@num}%
          \edef\@restoDDstr{\@digitoD\@digitoU}%
          \edef\@restoDDnum{\number\@restoDDstr}%

          \@numtoword@centena@pura{\@digitoC}{\@centenaword}%
          \ifnum\@digitoC=1\relax % cem vs cento
              \ifnum\@restoDDnum>0\relax \def\@centenaword{cento}\fi
          \fi

          \@numtoword@dd{\@restoDDnum}{\@restoword}%

          \ifnum\@restoDDnum>0\relax
              \edef#2{\@centenaword\ e \@restoword}%
          \else
              \def#2{\@centenaword}%
          \fi
        \fi
      \fi
    \fi
  \fi
  \ifnum\@tempnumccc>999\relax \def#2{[CCC Inválido (>999)]}\fi
}
\def\@firstofthree#1#2#3{#1}
\def\@secondofthree#1#2#3{#2}
\def\@thirdofthree#1#2#3{#3}


% Milhares (estrutura básica)
% \@numtoword@milhar{<numero>}{<outputmacro>}
\newcommand{\@numtoword@milhar}[2]{%
  \edef\@tempnummil{\number#1}% Ensure #1 is treated as a number
  \def#2{}% Default to empty
  \ifnum\@tempnummil<0\relax \def#2{[Milhar Negativo Inválido]}\fi
  \ifnum\@tempnummil=0\relax \def#2{}\fi % Explicitly empty for 0
  \ifnum\@tempnummil>0\relax
    ifnum\@tempnummil < 1000 \@numtoword@ccc{\@tempnummil}{#2}\fi % 1-999
    ifnum\@tempnummil = 1000 \def#2{mil}\fi % 1000
    ifnum\@tempnummil > 1000 % 1001-9999
      ifnum\@tempnummil < 2000 % 1001-1999
        \@numtoword@ccc{\number\numexpr\@tempnummil - 1000}{\@restomil}%
        % Check if \@restomil is empty (e.g. if \@numtoword@ccc returns empty for 0)
        % This condition is for 1000, which is handled by "\ifnum\@tempnummil = 1000 \def#2{mil}\fi"
        % For 1001 to 1999, \@restomil should not be empty.
        % If it were, "mil e " would be wrong. "mil" alone would also be wrong for e.g. 1001.
        % The current logic of \@numtoword@ccc for 0 ensures \@restomil is empty if remainder is 0.
        % So, for 1000, \@numtoword@ccc{0}{\@restomil} makes \@restomil empty.
        % The `mil e \@restomil` should be fine.
        \ifx\@restomil\@empty % This implies the remainder was 0, e.g. processing 1000.
             def#2{mil}% This correctly handles the case if somehow 1000 slips to here.
        \else
             def#2{mil e \@restomil}%
        \fi
      \fi
      ifnum\@tempnummil > 1999 % 2000-9999
        ifnum\@tempnummil < 10000
          \@ensure@digit@count{\@tempnummil}{4}{\@padded@mil@num}% Ensure 4 digits
          \edef\@digitomil{\expandafter\@firstoffour\@padded@mil@num}%
          \edef\@restocccstr{\expandafter\@restofthreefromfour\@padded@mil@num}%
          \edef\@restocccnum{\number\@restocccstr}%
          \@numtoword@unidade{\@digitomil}{\@milwordprefix}%
          \@numtoword@ccc{\@restocccnum}{\@restomil}%
          \ifx\@restomil\@empty
              \edef#2{\@milwordprefix\ mil}%
          \else
              \edef#2{\@milwordprefix\ mil e \@restomil}%
          \fi
        \fi
      \fi
    \fi
  \fi
  ifnum\@tempnummil > 9999 \def#2{[Milhar Inválido (>9999)]}\fi
}
\def\@firstoffour#1#2#3#4{#1}
\def\@restofthreefromfour#1#2#3#4{#2#3#4}


% User-facing command
\newcommand{\NumeroPorExtenso}[2]{%
  \edef\@numtoextenso{\number#1}%
  \def#2{}% Default to empty
  \ifnum\@numtoextenso<0 \def#2{[NPE Negativo]}\fi
  \ifnum\@numtoextenso=0 \def#2{zero}\fi % User command might say "zero" for 0. Or empty if preferred. Let's use "zero".
  \ifnum\@numtoextenso>0
    \ifnum\@numtoextenso<100 \@numtoword@dd{\@numtoextenso}{#2}\fi
    \ifnum\@numtoextenso>99 \ifnum\@numtoextenso<1000 \@numtoword@ccc{\@numtoextenso}{#2}\fi\fi
    \ifnum\@numtoextenso>999 \ifnum\@numtoextenso<10000 \@numtoword@milhar{\@numtoextenso}{#2}\fi\fi
    % Add more ranges if needed e.g. >9999
  \fi
}

\makeatother
% Fim dos comandos para conversão de números por extenso

% Comando para iniciar a ata
\newcommand{\iniciarata}[2]{
	\thispagestyle{firstpage}
	\vspace*{2.0cm}
	\begin{center}
		\textbf{ATA DA REUNIÃO #1 DO CORPO DELIBERATIVO DE #2}
	\end{center}
}

% Comando para data por extenso
% Argumento: DD/MM/YYYY

\def\parseataextensodateaux#1/#2/#3\relax{\@parseataextensodate{#1}{#2}{#3}}

\newcommand{\@parseataextensodate}[3]{%
    \def\portuguesemonthname{[Mês Inválido]}% Default value
    \ifcase#2\relax % Month is #2
        \or \def\portuguesemonthname{janeiro}%
        \or \def\portuguesemonthname{fevereiro}%
        \or \def\portuguesemonthname{março}%
        \or \def\portuguesemonthname{abril}%
        \or \def\portuguesemonthname{maio}%
        \or \def\portuguesemonthname{junho}%
        \or \def\portuguesemonthname{julho}%
        \or \def\portuguesemonthname{agosto}%
        \or \def\portuguesemonthname{setembro}%
        \or \def\portuguesemonthname{outubro}%
        \or \def\portuguesemonthname{novembro}%
        \or \def\portuguesemonthname{dezembro}%
    \fi

    % Converter dia para extenso
    \NumeroPorExtenso{#1}{\diaporextenso}%
    % Converter ano para extenso
    \NumeroPorExtenso{#3}{\anoporextenso}%

    % Formato final com todas as partes por extenso:
    \diaporextenso\ de \portuguesemonthname\ de \anoporextenso%
}

\newcommand{\dataextenso}[1]{%
    % Chama o helper \@parseataextensodate passando os componentes da data
    % A data #1 (DD/MM/YYYY) é passada para \parseataextensodateaux
    % que então separa os argumentos por '/'
    \expandafter\parseataextensodateaux#1\relax
}
% Exemplo de uso: \dataextenso{9/6/2025} -> nove de junho de dois mil e vinte e cinco

% Comando para seção de professores presentes
\newcommand{\profpresentes}{
	\section*{PROFESSORES PRESENTES}
}

% Comando para pauta do dia
\newcommand{\pauta}[1]{
	\section*{Pauta do dia}
	\begin{enumerate}
		#1
	\end{enumerate}
}

% Comando para fechamento da ata
\newcommand{\fecharata}[3]{
	\vspace{1cm}
	Às #1, nada mais havendo a tratar, eu, #2, lavrei a presente ata, que assino.
	\vspace{2cm}
	
	\begin{center}
		\textbf{#2}\\
		Chefe do Departamento de Engenharia de Sistemas e Computação\\
		#3\\
	\end{center}
}