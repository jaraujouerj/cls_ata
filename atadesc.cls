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