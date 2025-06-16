\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{atadesc}[2025/06/15 Classe para atas do DESC/UERJ]

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

% Comando para formatar a data da ata
\newcommand{\abrirata}[2]{
    \newcounter{dia}
    \newcounter{mes}
    \newcounter{ano}
    \newcounter{hora}
    \newcounter{minuto}

    % Extrai dia, mês e ano
    \setcounter{dia}{\numexpr #1/1000000}
    \setcounter{mes}{\numexpr (#1-\thedia*1000000)/10000}
    \setcounter{ano}{\numexpr #1-\thedia*1000000-\themes*10000}

    % Extrai hora e minuto
    \setcounter{hora}{\numexpr #2/100}
    \setcounter{minuto}{\numexpr #2-\thehora*100}


% Nomes dos meses
    \newcommand{\mesnome}[1]{
        \ifcase##1\or
            janeiro\or fevereiro\or março\or abril\or maio\or junho\or
            julho\or agosto\or setembro\or outubro\or novembro\or dezembro
        \fi
    }
    
    % Números por extenso
    \newcommand{\numeroextenso}[1]{
        \ifcase##1\or
            um\or dois\or três\or quatro\or cinco\or seis\or sete\or oito\or nove\or dez\or
            onze\or doze\or treze\or quatorze\or quinze\or dezesseis\or dezessete\or
            dezoito\or dezenove\or vinte\or vinte e um\or vinte e dois\or vinte e três\or
            vinte e quatro\or vinte e cinco\or vinte e seis\or vinte e sete\or vinte e oito\or
            vinte e nove\or trinta\or trinta e um
        \fi
    }
    
    % Horas por extenso
    \newcommand{\horaextenso}[1]{
        \ifcase##1\or
            uma\or duas\or três\or quatro\or cinco\or seis\or sete\or oito\or nove\or dez\or
            onze\or doze\or treze\or quatorze\or quinze\or dezesseis\or dezessete\or
            dezoito\or dezenove\or vinte\or vinte e uma\or vinte e duas\or vinte e três\or
            vinte e quatro
        \fi
    }
    
    Aos \numeroextenso{\thedia} dias do mês de \mesnome{\themes} de dois mil e \numeroextenso{\numexpr\theano-2000}, às \horaextenso{\thehora} horas
}

% Exemplo de uso:
% \dataata{09062025}{1700} produz:
% "Aos nove dias do mês de junho de dois mil e vinte e cinco, às dezessete horas"


% Comandos para professores
\newcommand{\cristiana}{Prof\textsuperscript{a} Cristiana Barbosa Bentes\xspace}
\newcommand{\matcristiana}{matrícula 30729-8\xspace}
\newcommand{\gencristiana}{a}      % feminino
\newcommand{\felipe}{Prof. Felipe Cassemiro Ulrichsen\xspace}
\newcommand{\matfelipe}{matrícula 42354-1\xspace}
\newcommand{\genfelipe}{o}        % masculino
\newcommand{\gabriel}{Prof. Gabriel Cardoso de Carvalho\xspace}
\newcommand{\matgabriel}{matrícula 42361-6\xspace}
\newcommand{\gengabriel}{o}      % masculino
\newcommand{\giomar}{Prof. Giomar Oliver Sequeiros Olivera\xspace}
\newcommand{\matgiomar}{matrícula 41726-1\xspace}
\newcommand{\gengiomar}{o}        % masculino
\newcommand{\joao}{Prof. João Araujo Ribeiro\xspace}
\newcommand{\matjoao}{matrícula 8055-6\xspace}
\newcommand{\genjoao}{o}       % masculino
\newcommand{\luiza}{Prof\textsuperscript{a} Luiza de Macedo Mourelle\xspace}
\newcommand{\matluiza}{matrícula 7058-1\xspace}
\newcommand{\genluiza}{a}      % feminino
\newcommand{\margareth}{Prof\textsuperscript{a} Margareth Simões Penello Meirelles\xspace}
\newcommand{\matmargareth}{matrícula 33784-0\xspace}
\newcommand{\genmargareth}{a}  % feminino
\newcommand{\luigi}{Prof. Luigi Maciel Ribeiro\xspace}
\newcommand{\matluigi}{matrícula 42383-0\xspace}
\newcommand{\genluigi}{o}      % masculino
\newcommand{\rafaela}{Prof\textsuperscript{a} Rafaela Correia Brum\xspace}
\newcommand{\matrafaela}{matrícula 42384-8\xspace}
\newcommand{\genrafaela}{a}    % feminino
\newcommand{\robert}{Prof. Robert Mota Oliveira\xspace}
\newcommand{\matrobert}{matrícula 41623-0\xspace}
\newcommand{\genrobert}{o}      % masculino
\newcommand{\simone}{Prof\textsuperscript{a} Simone Ingrid Monteiro Gama\xspace}
\newcommand{\matsimone}{matrícula 42362-4\xspace}
\newcommand{\gensimone}{a}    % feminino
\newcommand{\silas}{Prof. Silas Pereira Lima Filho\xspace}
\newcommand{\matsilas}{matrícula 42995-1\xspace}
\newcommand{\gensilas}{o}      % masculino
\newcommand{\thiago}{Prof. Thiago Medeiros Carvalho\xspace}
\newcommand{\matthiago}{matrícula 42350-9\xspace}
\newcommand{\genthago}{o}      % masculino

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



% Comando para iniciar a ata
\newcommand{\iniciarata}[2]{
	\thispagestyle{firstpage}
	\vspace*{2.0cm}
	\begin{center}
		\textbf{ATA DA REUNIÃO #1 DO CORPO DELIBERATIVO DE #2}
	\end{center}
}


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
\newcommand{\fecharata}[2]{%
  \def\horaarg{#1}%
  \expandafter\fecharataextract\horaarg:\relax{#2}%
}

\def\fecharataextract#1:#2:\relax#3{%
  \def\horaext{\horaextenso{#1}}%
  \def\minutoext{%
    \ifnum#2=0 zero%
    \else \numeroextenso{#2}%
    \fi
  }%
  \vspace{1cm}
  Às \horaext\ horas%
  \ifnum#2>0\ e \minutoext\ minutos\fi, nada mais havendo a tratar, eu, #3, lavrei a presente ata, que assino.
  \vspace{2cm}
  \begin{center}
    \textbf{#3}\\
    Chefe do Departamento de Engenharia de Sistemas e Computação\\
    \csname mat\expandafter\@gobble\string#3\endcsname\\
  \end{center}
}
\makeatletter
\newcommand{\afastamento}[6]{%
  Apreciad\csname gen\expandafter\@gobble\string#1\endcsname{} o pedido de afastamento d\csname gen\expandafter\@gobble\string#1\endcsname{} %
  #1, %
  \csname mat\expandafter\@gobble\string#1\endcsname, %
  para apresentação do trabalho intitulado ``\textit{#2}'' %
  no evento ``\textit{#3}'', #4, de #5 a #6. %
  \aprovado
}

\makeatother

