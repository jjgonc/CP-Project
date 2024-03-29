\documentclass[a4paper]{article}
\usepackage[a4paper,left=3cm,right=2cm,top=2.5cm,bottom=2.5cm]{geometry}
\usepackage{palatino}
\usepackage[colorlinks=true,linkcolor=blue,citecolor=blue]{hyperref}
\usepackage{graphicx}
\usepackage{cp2021t}
\usepackage{subcaption}
\usepackage{adjustbox}
\usepackage{color}
\definecolor{red}{RGB}{255,  0,  0}
\definecolor{blue}{RGB}{0,0,255}
\def\red{\color{red}}
\def\blue{\color{blue}}
%================= local x=====================================================%
\def\getGif#1{\includegraphics[width=0.3\textwidth]{cp2021t_media/#1.png}}
\let\uk=\emph
\def\aspas#1{``#1"}
%================= lhs2tex=====================================================%
%include polycode.fmt 
%format (div (x)(y)) = x "\div " y
%format succ = "\succ "
%format ==> = "\Longrightarrow "
%format map = "\map "
%format length = "\length "
%format fst = "\p1"
%format p1  = "\p1"
%format snd = "\p2"
%format p2  = "\p2"
%format Left = "i_1"
%format Right = "i_2"
%format i1 = "i_1"
%format i2 = "i_2"
%format >< = "\times"
%format >|<  = "\bowtie "
%format |-> = "\mapsto"
%format . = "\comp "
%format .=?=. = "\mathbin{\stackrel{\mathrm{?}}{=}}"
%format (kcomp (f)(g)) = f "\kcomp " g
%format -|- = "+"
%format conc = "\mathsf{conc}"
%format summation = "{\sum}"
%format (either (a) (b)) = "\alt{" a "}{" b "}"
%format (frac (a) (b)) = "\frac{" a "}{" b "}"
%format (uncurry f) = "\uncurry{" f "}"
%format (const f) = "\underline{" f "}"
%format TLTree = "\mathsf{TLTree}"
%format (lcbr (x)(y)) = "\begin{lcbr}" x "\\" y "\end{lcbr}"
%format (split (x) (y)) = "\conj{" x "}{" y "}"
%format (for (f) (i)) = "\for{" f "}\ {" i "}"
%format B_tree = "\mathsf{B}\mbox{-}\mathsf{tree} "
\def\ana#1{\mathopen{[\!(}#1\mathclose{)\!]}}
%format <$> = "\mathbin{\mathopen{\langle}\$\mathclose{\rangle}}"
%format (cataA (f) (g)) = "\cata{" f "~" g "}_A"
%format (anaA (f) (g)) = "\ana{" f "~" g "}_A"
%format (cataB (f) (g)) = "\cata{" f "~" g "}_B"
%format (cata (f)) = "\cata{" f "}"
%format (anaB (f) (g)) = "\ana{" f "~" g "}_B"
%format Either a b = a "+" b 
%format fmap = "\mathsf{fmap}"
%format NA   = "\textsc{na}"
%format NB   = "\textsc{nb}"
%format inT = "\mathsf{in}"
%format outT = "\mathsf{out}"
%format Null = "1"
%format (Prod (a) (b)) = a >< b
%format fF = "\fun F "
%format e1 = "e_1 "
%format e2 = "e_2 "
%format Dist = "\fun{Dist}"
%format IO = "\fun{IO}"
%format BTree = "\fun{BTree} "
%format LTree = "\mathsf{LTree}"
%format inNat = "\mathsf{in}"
%format (cataNat (g)) = "\cata{" g "}"
%format Nat0 = "\N_0"
%format Rational = "\Q "
%format toRational = " to_\Q "
%format fromRational = " from_\Q "
%format muB = "\mu "
%format (frac (n)(m)) = "\frac{" n "}{" m "}"
%format (fac (n)) = "{" n "!}"
%format (underbrace (t) (p)) = "\underbrace{" t "}_{" p "}"
%format matrix = "matrix"
%%format (bin (n) (k)) = "\Big(\vcenter{\xymatrix@R=1pt{" n "\\" k "}}\Big)"
%format `ominus` = "\mathbin{\ominus}"
%format % = "\mathbin{/}"
%format <-> = "{\,\leftrightarrow\,}"
%format <|> = "{\,\updownarrow\,}"
%format `minusNat`= "\mathbin{-}"
%format ==> = "\Rightarrow"
%format .==>. = "\Rightarrow"
%format .<==>. = "\Leftrightarrow"
%format .==. = "\equiv"
%format .<=. = "\leq"
%format .&&&. = "\wedge"
%format cdots = "\cdots "
%format pi = "\pi "
%format (curry (f)) = "\overline{" f "}"
%format (cataLTree (x)) = "\llparenthesis\, " x "\,\rrparenthesis"
%format (anaLTree (x)) = "\mathopen{[\!(}" x "\mathclose{)\!]}"
%format delta = "\Delta "

%---------------------------------------------------------------------------

\title{
       	Cálculo de Programas
\\
       	Trabalho Prático
\\
       	MiEI+LCC --- 2020/21
}

\author{
       	\dium
\\
       	Universidade do Minho
}


\date\mydate

\makeindex
\newcommand{\rn}[1]{\textcolor{red}{#1}}
\begin{document}

\maketitle

\begin{center}\large
\begin{tabular}{ll}
\textbf{Grupo} nr. 53
\\\hline
93204 & José João Gonçalves	
\\
93314 & Maria Sofia Rocha Gomes	
\\
93194 & Miguel Rodrigues Santa Cruz	
\\

\end{tabular}
\end{center}

\section{Preâmbulo}

\CP\ tem como objectivo principal ensinar
a progra\-mação de computadores como uma disciplina científica. Para isso
parte-se de um repertório de \emph{combinadores} que formam uma álgebra da
programação (conjunto de leis universais e seus corolários) e usam-se esses
combinadores para construir programas \emph{composicionalmente}, isto é,
agregando programas já existentes.
  
Na sequência pedagógica dos planos de estudo dos dois cursos que têm
esta disciplina, opta-se pela aplicação deste método à programação
em \Haskell\ (sem prejuízo da sua aplicação a outras linguagens 
funcionais). Assim, o presente trabalho prático coloca os
alunos perante problemas concretos que deverão ser implementados em
\Haskell.  Há ainda um outro objectivo: o de ensinar a documentar
programas, a validá-los e a produzir textos técnico-científicos de
qualidade.

\section{Documentação} Para cumprir de forma integrada os objectivos
enunciados acima vamos recorrer a uma técnica de programa\-ção dita
``\litp{literária}'' \cite{Kn92}, cujo princípio base é o seguinte:
%
\begin{quote}\em Um programa e a sua documentação devem coincidir.
\end{quote}
%
Por outras palavras, o código fonte e a documentação de um
programa deverão estar no mesmo ficheiro.

O ficheiro \texttt{cp2021t.pdf} que está a ler é já um exemplo de
\litp{programação literária}: foi gerado a partir do texto fonte
\texttt{cp2021t.lhs}\footnote{O suffixo `lhs' quer dizer
\emph{\lhaskell{literate Haskell}}.} que encontrará no
\MaterialPedagogico\ desta disciplina descompactando o ficheiro
\texttt{cp2021t.zip} e executando:
\begin{Verbatim}[fontsize=\small]
    $ lhs2TeX cp2021t.lhs > cp2021t.tex
    $ pdflatex cp2021t
\end{Verbatim}
em que \href{https://hackage.haskell.org/package/lhs2tex}{\texttt\LhsToTeX} é
um pre-processador que faz ``pretty printing''
de código Haskell em \Latex\ e que deve desde já instalar executando
\begin{Verbatim}[fontsize=\small]
    $ cabal install lhs2tex --lib
\end{Verbatim}
Por outro lado, o mesmo ficheiro \texttt{cp2021t.lhs} é executável e contém
o ``kit'' básico, escrito em \Haskell, para realizar o trabalho. Basta executar
\begin{Verbatim}[fontsize=\small]
    $ ghci cp2021t.lhs
\end{Verbatim}

%if False
\begin{code}
{-# OPTIONS_GHC -XNPlusKPatterns #-}
{-# LANGUAGE GeneralizedNewtypeDeriving, DeriveDataTypeable, FlexibleInstances #-}
module Main where 
import Cp
import List hiding (fac)
import Nat
import LTree
import Data.List hiding (find)
import Test.QuickCheck hiding ((><),choose,collect)
import qualified Test.QuickCheck as QuickCheck
import Graphics.Gloss
import Graphics.Gloss.Interface.Pure.Game
import Control.Monad
import Control.Applicative hiding ((<|>))
import System.Process
\end{code}
%endif

\noindent Abra o ficheiro \texttt{cp2021t.lhs} no seu editor de texto preferido
e verifique que assim é: todo o texto que se encontra dentro do ambiente
\begin{quote}\small\tt
\verb!\begin{code}!
\\ ... \\
\verb!\end{code}!
\end{quote}
é seleccionado pelo \GHCi\ para ser executado.

\section{Como realizar o trabalho}
Este trabalho teórico-prático deve ser realizado por grupos de 3 (ou 4) alunos.
Os detalhes da avaliação (datas para submissão do relatório e sua defesa
oral) são os que forem publicados na \cp{página da disciplina} na \emph{internet}.

Recomenda-se uma abordagem participativa dos membros do grupo
de trabalho por forma a poderem responder às questões que serão colocadas
na \emph{defesa oral} do relatório.

Em que consiste, então, o \emph{relatório} a que se refere o parágrafo anterior?
É a edição do texto que está a ser lido, preenchendo o anexo \ref{sec:resolucao}
com as respostas. O relatório deverá conter ainda a identificação dos membros
do grupo de trabalho, no local respectivo da folha de rosto.

Para gerar o PDF integral do relatório deve-se ainda correr os comando seguintes,
que actualizam a bibliografia (com \Bibtex) e o índice remissivo (com \Makeindex),
\begin{Verbatim}[fontsize=\small]
    $ bibtex cp2021t.aux
    $ makeindex cp2021t.idx
\end{Verbatim}
e recompilar o texto como acima se indicou. Dever-se-á ainda instalar o utilitário
\QuickCheck,
que ajuda a validar programas em \Haskell\ e a biblioteca \gloss{Gloss} para
geração de gráficos 2D:
\begin{Verbatim}[fontsize=\small]
    $ cabal install QuickCheck gloss --lib
\end{Verbatim}
Para testar uma propriedade \QuickCheck~|prop|, basta invocá-la com o comando:
\begin{verbatim}
    > quickCheck prop
    +++ OK, passed 100 tests.
\end{verbatim}
Pode-se ainda controlar o número de casos de teste e sua complexidade,
como o seguinte exemplo mostra:
\begin{verbatim}
    > quickCheckWith stdArgs { maxSuccess = 200, maxSize = 10 } prop
    +++ OK, passed 200 tests.
\end{verbatim}
Qualquer programador tem, na vida real, de ler e analisar (muito!) código
escrito por outros. No anexo \ref{sec:codigo} disponibiliza-se algum
código \Haskell\ relativo aos problemas que se seguem. Esse anexo deverá
ser consultado e analisado à medida que isso for necessário.

\subsection{Stack}

O \stack{Stack} é um programa útil para criar, gerir e manter projetos em \Haskell.
Um projeto criado com o Stack possui uma estrutura de pastas muito específica:

\begin{itemize}
\item Os módulos auxiliares encontram-se na pasta \emph{src}.
\item O módulos principal encontra-se na pasta \emph{app}.
\item A lista de depêndencias externas encontra-se no ficheiro \emph{package.yaml}.
\end{itemize}

Pode aceder ao \GHCi\ utilizando o comando:
\begin{verbatim}
stack ghci
\end{verbatim}

Garanta que se encontra na pasta mais externa \textbf{do projeto}.
A primeira vez que correr este comando as depêndencias externas serão instaladas automaticamente.

Para gerar o PDF, garanta que se encontra na diretoria \emph{app}.

\Problema

Os \emph{tipos de dados algébricos} estudados ao longo desta disciplina oferecem
uma grande capacidade expressiva ao programador. Graças à sua flexibilidade,
torna-se trivial implementar \DSL s
e até mesmo \href{http://www.cse.chalmers.se/~ulfn/papers/thesis.pdf}{linguagens de programação}.

Paralelamente, um tópico bastante estudado no âmbito de \DL\ 
é a derivação automática de expressões matemáticas, por exemplo, de derivadas.
Duas técnicas que podem ser utilizadas para o cálculo de derivadas são:

\begin{itemize}
\item \emph{Symbolic differentiation}
\item \emph{Automatic differentiation}
\end{itemize}

\emph{Symbolic differentiation} consiste na aplicação sucessiva de transformações
(leia-se: funções) que sejam congruentes com as regras de derivação. O resultado
final será a expressão da derivada.

O leitor atento poderá notar um problema desta técnica: a expressão
inicial pode crescer de forma descontrolada, levando a um cálculo pouco eficiente.
\emph{Automatic differentiation} tenta resolver este problema,
calculando \textbf{o valor} da derivada da expressão em todos os passos.
Para tal, é necessário calcular o valor da expressão \textbf{e} o valor da sua derivada.

Vamos de seguida definir uma linguagem de expressões matemáticas simples e
implementar as duas técnicas de derivação automática.
Para isso, seja dado o seguinte tipo de dados,

\begin{code}
data ExpAr a = X
           | N a
           | Bin BinOp (ExpAr a) (ExpAr a)
           | Un UnOp (ExpAr a)
           deriving (Eq, Show)
\end{code}

\noindent
onde |BinOp| e |UnOp| representam operações binárias e unárias, respectivamente:

\begin{code}
data BinOp = Sum
           | Product
           deriving (Eq, Show)

data UnOp = Negate
          | E
          deriving (Eq, Show)
\end{code}

\noindent
O construtor |E| simboliza o exponencial de base $e$.

Assim, cada expressão pode ser uma variável, um número, uma operação binária
aplicada às devidas expressões, ou uma operação unária aplicada a uma expressão.
Por exemplo,
\begin{spec}
Bin Sum X (N 10)
\end{spec}
designa |x+10| na notação matemática habitual.

\begin{enumerate}
\item A definição das funções |inExpAr| e |baseExpAr| para este tipo é a seguinte:
\begin{code}
inExpAr = either (const X) num_ops where
  num_ops = either N ops
  ops     = either bin (uncurry Un)
  bin(op, (a, b)) = Bin op a b

baseExpAr f g h j k l z = f -|- (g -|- (h >< (j >< k) -|- l >< z))
\end{code}

  Defina as funções |outExpAr| e |recExpAr|,
  e teste as propriedades que se seguem.
  \begin{propriedade}
    |inExpAr| e |outExpAr| são testemunhas de um isomorfismo,
    isto é,
    |inExpAr . outExpAr = id| e |outExpAr . idExpAr = id|:
\begin{code}
prop_in_out_idExpAr :: (Eq a) => ExpAr a -> Bool
prop_in_out_idExpAr = inExpAr . outExpAr .==. id

prop_out_in_idExpAr :: (Eq a) => OutExpAr a -> Bool
prop_out_in_idExpAr = outExpAr . inExpAr .==. id
\end{code}
    \end{propriedade}

  \item Dada uma expressão aritmética e um escalar para substituir o |X|,
	a função

\begin{quote}
      |eval_exp :: Floating a => a -> (ExpAr a) -> a|
\end{quote}

\noindent calcula o resultado da expressão. Na página \pageref{pg:P1}
    esta função está expressa como um catamorfismo. Defina o respectivo gene
    e, de seguida, teste as propriedades:
    \begin{propriedade}
       A função |eval_exp| respeita os elementos neutros das operações.
\begin{code}
prop_sum_idr :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_sum_idr a exp = eval_exp a exp .=?=. sum_idr where
  sum_idr = eval_exp a (Bin Sum exp (N 0))

prop_sum_idl :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_sum_idl a exp = eval_exp a exp .=?=. sum_idl where
  sum_idl = eval_exp a (Bin Sum (N 0) exp)

prop_product_idr :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_product_idr a exp = eval_exp a exp .=?=. prod_idr where
  prod_idr = eval_exp a (Bin Product exp (N 1))

prop_product_idl :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_product_idl a exp = eval_exp a exp .=?=. prod_idl where
  prod_idl = eval_exp a (Bin Product (N 1) exp)

prop_e_id :: (Floating a, Real a) => a -> Bool
prop_e_id a = eval_exp a (Un E (N 1)) == expd 1

prop_negate_id :: (Floating a, Real a) => a -> Bool
prop_negate_id a = eval_exp a (Un Negate (N 0)) == 0
\end{code}
    \end{propriedade}
    \begin{propriedade}
      Negar duas vezes uma expressão tem o mesmo valor que não fazer nada.
\begin{code}
prop_double_negate :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_double_negate a exp = eval_exp a exp .=?=. eval_exp a (Un Negate (Un Negate exp))
\end{code}
    \end{propriedade}

  \item É possível otimizar o cálculo do valor de uma expressão aritmética tirando proveito
  dos elementos absorventes de cada operação. Implemente os genes da função
\begin{spec}
      optmize_eval :: (Floating a, Eq a) => a -> (ExpAr a) -> a
\end{spec}
  que se encontra na página \pageref{pg:P1} expressa como um hilomorfismo\footnote{Qual é a vantagem de implementar a função |optimize_eval| utilizando um hilomorfismo em vez de utilizar um catamorfismo com um gene "inteligente"?}
  e teste as propriedades:

    \begin{propriedade}
      A função |optimize_eval| respeita a semântica da função |eval|.
\begin{code}
prop_optimize_respects_semantics :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_optimize_respects_semantics a exp = eval_exp a exp .=?=. optmize_eval a exp
\end{code}
    \end{propriedade}


\item Para calcular a derivada de uma expressão, é necessário aplicar transformações
à expressão original que respeitem as regras das derivadas:\footnote{%
	Apesar da adição e multiplicação gozarem da propriedade comutativa,
	há que ter em atenção a ordem das operações por causa dos testes.}

\begin{itemize}
  \item Regra da soma:
\begin{eqnarray*}
	\frac{d}{dx}(f(x)+g(x))=\frac{d}{dx}(f(x))+\frac{d}{dx}(g(x))
\end{eqnarray*}
  \item Regra do produto:
\begin{eqnarray*}
	\frac{d}{dx}(f(x)g(x))=f(x)\cdot \frac{d}{dx}(g(x))+\frac{d}{dx}(f(x))\cdot g(x)
\end{eqnarray*}
\end{itemize}

  Defina o gene do catamorfismo que ocorre na função
    \begin{quote}
      |sd :: Floating a => ExpAr a -> ExpAr a|
    \end{quote}
  que, dada uma expressão aritmética, calcula a sua derivada.
  Testes a fazer, de seguida:
    \begin{propriedade}
       A função |sd| respeita as regras de derivação.
\begin{code}
prop_const_rule :: (Real a, Floating a) => a -> Bool
prop_const_rule a = sd (N a) == N 0

prop_var_rule :: Bool
prop_var_rule = sd X == N 1

prop_sum_rule :: (Real a, Floating a) => ExpAr a -> ExpAr a -> Bool
prop_sum_rule exp1 exp2 = sd (Bin Sum exp1 exp2) == sum_rule where
  sum_rule = Bin Sum (sd exp1) (sd exp2)

prop_product_rule :: (Real a, Floating a) => ExpAr a -> ExpAr a -> Bool
prop_product_rule exp1 exp2 = sd (Bin Product exp1 exp2) == prod_rule where
  prod_rule =Bin Sum (Bin Product exp1 (sd exp2)) (Bin Product (sd exp1) exp2)

prop_e_rule :: (Real a, Floating a) => ExpAr a -> Bool
prop_e_rule exp = sd (Un E exp) == Bin Product (Un E exp) (sd exp)

prop_negate_rule :: (Real a, Floating a) => ExpAr a -> Bool
prop_negate_rule exp = sd (Un Negate exp) == Un Negate (sd exp)
\end{code}
    \end{propriedade}

\item Como foi visto, \emph{Symbolic differentiation} não é a técnica
mais eficaz para o cálculo do valor da derivada de uma expressão.
\emph{Automatic differentiation} resolve este problema cálculando o valor
da derivada em vez de manipular a expressão original.

  Defina o gene do catamorfismo que ocorre na função
    \begin{spec}
    ad :: Floating a => a -> ExpAr a -> a
    \end{spec}
  que, dada uma expressão aritmética e um ponto,
  calcula o valor da sua derivada nesse ponto,
  sem transformar manipular a expressão original.
  Testes a fazer, de seguida:

    \begin{propriedade}
       Calcular o valor da derivada num ponto |r| via |ad| é equivalente a calcular a derivada da expressão e avalia-la no ponto |r|.
\begin{code}
prop_congruent :: (Floating a, Real a) => a -> ExpAr a -> Bool
prop_congruent a exp = ad a exp .=?=. eval_exp a (sd exp)
\end{code}
    \end{propriedade}
\end{enumerate}

\Problema

Nesta disciplina estudou-se como fazer \pd{programação dinâmica} por cálculo,
recorrendo à lei de recursividade mútua.\footnote{Lei (\ref{eq:fokkinga})
em \cite{Ol18}, página \pageref{eq:fokkinga}.}

Para o caso de funções sobre os números naturais (|Nat0|, com functor |fF
X = 1 + X|) é fácil derivar-se da lei que foi estudada uma
	\emph{regra de algibeira}
	\label{pg:regra}
que se pode ensinar a programadores que não tenham estudado
\cp{Cálculo de Programas}. Apresenta-se de seguida essa regra, tomando como exemplo o
cálculo do ciclo-\textsf{for} que implementa a função de Fibonacci, recordar
o sistema
\begin{spec}
fib 0 = 1
fib(n+1) = f n

f 0 = 1
f (n+1) = fib n + f n
\end{spec}
Obter-se-á de imediato
\begin{code}
fib' = p1 . for loop init where
   loop(fib,f)=(f,fib+f)
   init = (1,1)
\end{code}
usando as regras seguintes:
\begin{itemize}
\item	O corpo do ciclo |loop| terá tantos argumentos quanto o número de funções mutuamente recursivas.
\item	Para as variáveis escolhem-se os próprios nomes das funções, pela ordem
que se achar conveniente.\footnote{Podem obviamente usar-se outros símbolos, mas numa primeira leitura
dá jeito usarem-se tais nomes.}
\item	Para os resultados vão-se buscar as expressões respectivas, retirando a variável |n|.
\item	Em |init| coleccionam-se os resultados dos casos de base das funções, pela mesma ordem.
\end{itemize}
Mais um exemplo, envolvendo polinómios do segundo grau $ax^2 + b x + c$ em |Nat0|.
Seguindo o método estudado nas aulas\footnote{Secção 3.17 de \cite{Ol18} e tópico
\href{https://www4.di.uminho.pt/~jno/media/cp/}{Recursividade mútua} nos vídeos das aulas teóricas.},
de $f\ x = a x^2 + b x + c$ derivam-se duas funções mutuamente recursivas:
\begin{spec}
f 0 = c
f (n+1) = f n + k n

k 0 = a + b
k(n+1) = k n + 2 a
\end{spec}
Seguindo a regra acima, calcula-se de imediato a seguinte implementação, em Haskell:
\begin{code}
f' a b c = p1 . for loop init where
  loop(f,k) = (f+k,k+2*a)
  init = (c,a+b) 
\end{code}
O que se pede então, nesta pergunta?
Dada a fórmula que dá o |n|-ésimo \catalan{número de Catalan},
\begin{eqnarray}
	C_n = \frac{(2n)!}{(n+1)! (n!) }
	\label{eq:cat}
\end{eqnarray}
derivar uma implementação de $C_n$ que não calcule factoriais nenhuns.
Isto é, derivar um ciclo-\textsf{for}
\begin{spec}
cat = cdots . for loop init where cdots
\end{spec}
que implemente esta função.

\begin{propriedade}
A função proposta coincidem com a definição dada:
\begin{code}
prop_cat = (>=0) .==>. (catdef  .==. cat)
\end{code}
\end{propriedade}
%
\textbf{Sugestão}: Começar por estudar muito bem o processo de cálculo dado
no anexo \ref{sec:recmul} para o problema (semelhante) da função exponencial.


\Problema 

As \bezier{curvas de Bézier}, designação dada em honra ao engenheiro
\href{https://en.wikipedia.org/wiki/Pierre_B%C3%A9zier}{Pierre Bézier},
são curvas ubíquas na área de computação gráfica, animação e modelação.
Uma curva de Bézier é uma curva paramétrica, definida por um conjunto
$\{P_0,...,P_N\}$ de pontos de controlo, onde $N$ é a ordem da curva.

\begin{figure}[h!]
  \centering
  \includegraphics[width=0.8\textwidth]{cp2021t_media/Bezier_curves.png}
  \caption{Exemplos de curvas de Bézier retirados da \bezier{ Wikipedia}.}
\end{figure}

O algoritmo de \emph{De Casteljau} é um método recursivo capaz de calcular
curvas de Bézier num ponto. Apesar de ser mais lento do que outras abordagens,
este algoritmo é numericamente mais estável, trocando velocidade por correção.

De forma sucinta, o valor de uma curva de Bézier de um só ponto $\{P_0\}$
(ordem $0$) é o próprio ponto $P_0$. O valor de uma curva de Bézier de ordem
$N$ é calculado através da interpolação linear da curva de Bézier dos primeiros
$N-1$ pontos e da curva de Bézier dos últimos $N-1$ pontos.

A interpolação linear entre 2 números, no intervalo $[0, 1]$, é dada pela
seguinte função:

\begin{code}
linear1d :: Rational -> Rational -> OverTime Rational
linear1d a b = formula a b where
  formula :: Rational -> Rational -> Float -> Rational
  formula x y t = ((1.0 :: Rational) - (toRational t)) * x + (toRational t) * y
\end{code}
%
A interpolação linear entre 2 pontos de dimensão $N$ é calculada através
da interpolação linear de cada dimensão.

O tipo de dados |NPoint| representa um ponto com $N$ dimensões.
\begin{code}
type NPoint = [Rational]
\end{code}
Por exemplo, um ponto de 2 dimensões e um ponto de 3 dimensões podem ser
representados, respetivamente, por:
\begin{spec}
p2d = [1.2, 3.4]
p3d = [0.2, 10.3, 2.4]
\end{spec}
%
O tipo de dados |OverTime a| representa um termo do tipo |a| num dado instante
(dado por um |Float|).
\begin{code}
type OverTime a = Float -> a
\end{code}
%
O anexo \ref{sec:codigo} tem definida a função 
    \begin{spec}
    calcLine :: NPoint -> (NPoint -> OverTime NPoint)
    \end{spec}
que calcula a interpolação linear entre 2 pontos, e a função
    \begin{spec}
    deCasteljau :: [NPoint] -> OverTime NPoint
    \end{spec}
que implementa o algoritmo respectivo.

\begin{enumerate}

\item Implemente |calcLine| como um catamorfismo de listas,
testando a sua definição com a propriedade:
    \begin{propriedade} Definição alternativa.
\begin{code}
prop_calcLine_def :: NPoint -> NPoint -> Float -> Bool
prop_calcLine_def p q d = calcLine p q d ==  zipWithM linear1d p q d
\end{code}
    \end{propriedade}

\item Implemente a função |deCasteljau| como um hilomorfismo, testando agora a propriedade:
    \begin{propriedade}
      Curvas de Bézier são simétricas.
\begin{code}
prop_bezier_sym :: [[Rational]] -> Gen Bool
prop_bezier_sym l = all (< delta) . calc_difs . bezs <$> elements ps  where
  calc_difs = (\(x, y) -> zipWith (\w v -> if w >= v then w - v else v - w) x y)
  bezs t    = (deCasteljau l t, deCasteljau (reverse l) (fromRational (1 - (toRational t))))
  delta = 1e-2
\end{code}
    \end{propriedade}

  \item Corra a função |runBezier| e aprecie o seu trabalho\footnote{%
        A representação em Gloss é uma adaptação de um
        \href{https://github.com/hrldcpr/Bezier.hs}{projeto}
        de Harold Cooper.} clicando na janela que é aberta (que contém, a verde, um ponto
        inicila) com o botão esquerdo do rato para adicionar mais pontos.
        A tecla |Delete| apaga o ponto mais recente.

\end{enumerate}

\Problema

Seja dada a fórmula que calcula a média de uma lista não vazia $x$,
\begin{equation}
avg\ x = \frac 1 k\sum_{i=1}^{k} x_i
\end{equation}
onde $k=length\ x$. Isto é, para sabermos a média de uma lista precisamos de dois catamorfismos: o que faz o somatório e o que calcula o comprimento a lista.
Contudo, é facil de ver que
\begin{quote}
	$avg\ [a]=a$
\\
	$avg (a:x) = \frac 1 {k+1}(a+\sum_{i=1}^{k} x_i) = \frac{a+k(avg\ x)}{k+1}$ para $k=length\ x$
\end{quote}
Logo $avg$ está em recursividade mútua com $length$ e o par de funções pode ser expresso por um único catamorfismo, significando que a lista apenas é percorrida uma vez.

\begin{enumerate}

\item	Recorra à lei de recursividade mútua para derivar a função
|avg_aux = cata (either b q)| tal que 
|avg_aux = split avg length| em listas não vazias. 

\item	Generalize o raciocínio anterior para o cálculo da média de todos os elementos de uma \LTree\ recorrendo a uma única travessia da árvore (i.e.\ catamorfismo).

\end{enumerate}
Verifique as suas funções testando a propriedade seguinte:
\begin{propriedade}
A média de uma lista não vazia e de uma \LTree\ com os mesmos elementos coincide,
a menos de um erro de 0.1 milésimas:
\begin{code}
prop_avg :: [Double] -> Property
prop_avg = nonempty .==>. diff .<=. const 0.000001 where
   diff l = avg l - (avgLTree . genLTree) l
   genLTree = anaLTree lsplit
   nonempty = (>[])
\end{code}
\end{propriedade}

\Problema	(\textbf{NB}: Esta questão é \textbf{opcional} e funciona como \textbf{valorização} apenas para os alunos que desejarem fazê-la.) 

\vskip 1em \noindent
Existem muitas linguagens funcionais para além do \Haskell, que é a linguagem usada neste trabalho prático. Uma delas é o \Fsharp\ da Microsoft. Na directoria \verb!fsharp! encontram-se os módulos \Cp, \Nat\ e \LTree\ codificados em \Fsharp. O que se pede é a biblioteca \BTree\ escrita na mesma linguagem.

Modo de execução: o código que tiverem produzido nesta pergunta deve ser colocado entre o \verb!\begin{verbatim}! e o \verb!\end{verbatim}! da correspondente parte do anexo \ref{sec:resolucao}. Para além disso, os grupos podem demonstrar o código na oral.

\newpage

\part*{Anexos}

\appendix

\section{Como exprimir cálculos e diagramas em LaTeX/lhs2tex}
Como primeiro exemplo, estudar o texto fonte deste trabalho para obter o
efeito:\footnote{Exemplos tirados de \cite{Ol18}.} 
\begin{eqnarray*}
\start
	|id = split f g|
%
\just\equiv{ universal property }
%
        |lcbr(
		p1 . id = f
	)(
		p2 . id = g
	)|
%
\just\equiv{ identity }
%
        |lcbr(
		p1 = f
	)(
		p2 = g
	)|
\qed
\end{eqnarray*}

Os diagramas podem ser produzidos recorrendo à \emph{package} \LaTeX\ 
\href{https://ctan.org/pkg/xymatrix}{xymatrix}, por exemplo: 
\begin{eqnarray*}
\xymatrix@@C=2cm{
    |Nat0|
           \ar[d]_-{|cataNat g|}
&
    |1 + Nat0|
           \ar[d]^{|id + (cataNat g)|}
           \ar[l]_-{|inNat|}
\\
     |B|
&
     |1 + B|
           \ar[l]^-{|g|}
}
\end{eqnarray*}

\section{Programação dinâmica por recursividade múltipla}\label{sec:recmul}
Neste anexo dão-se os detalhes da resolução do Exercício \ref{ex:exp} dos apontamentos da
disciplina\footnote{Cf.\ \cite{Ol18}, página \pageref{ex:exp}.},
onde se pretende implementar um ciclo que implemente
o cálculo da aproximação até |i=n| da função exponencial $exp\ x = e^x$,
via série de Taylor:
\begin{eqnarray}
	exp\ x 
& = &
	\sum_{i=0}^{\infty} \frac {x^i} {i!}
\end{eqnarray}
Seja $e\ x\ n = \sum_{i=0}^{n} \frac {x^i} {i!}$ a função que dá essa aproximação.
É fácil de ver que |e x 0 = 1| e que $|e x (n+1)| = |e x n| + \frac {x^{n+1}} {(n+1)!}$.
Se definirmos $|h x n| = \frac {x^{n+1}} {(n+1)!}$ teremos |e x| e |h x| em recursividade
mútua. Se repetirmos o processo para |h x n| etc obteremos no total três funções nessa mesma
situação:
\begin{spec}
e x 0 = 1
e x (n+1) = h x n + e x n

h x 0 = x
h x (n+1) = x/(s n) * h x n

s 0 = 2
s (n+1) = 1 + s n
\end{spec}
Segundo a \emph{regra de algibeira} descrita na página \ref{pg:regra} deste enunciado,
ter-se-á, de imediato:
\begin{code}
e' x = prj . for loop init where
     init = (1,x,2)
     loop(e,h,s)=(h+e,x/s*h,1+s)
     prj(e,h,s) = e
\end{code}

\section{Código fornecido}\label{sec:codigo}

\subsection*{Problema 1}

\begin{code}
expd :: Floating a => a -> a
expd = Prelude.exp

type OutExpAr a = Either () (Either a (Either (BinOp, (ExpAr a, ExpAr a)) (UnOp, ExpAr a)))
\end{code}

\subsection*{Problema 2}
Definição da série de Catalan usando factoriais (\ref{eq:cat}):
\begin{code}
catdef n = div (fac((2*n))) ((fac((n+1))*(fac n)))
\end{code}
Oráculo para inspecção dos primeiros 26 números de Catalan\footnote{Fonte:
\catalan{Wikipedia}.}:
\begin{code}
oracle = [
    1, 1, 2, 5, 14, 42, 132, 429, 1430, 4862, 16796, 58786, 208012, 742900, 2674440, 9694845,
    35357670, 129644790, 477638700, 1767263190, 6564120420, 24466267020,
    91482563640, 343059613650, 1289904147324, 4861946401452
    ]
\end{code}

\subsection*{Problema 3}
Algoritmo:
\begin{spec}
deCasteljau :: [NPoint] -> OverTime NPoint
deCasteljau [] = nil
deCasteljau [p] = const p
deCasteljau l = \pt -> (calcLine (p pt) (q pt)) pt where
  p = deCasteljau (init l)
  q = deCasteljau (tail l)
\end{spec}
Função auxiliar:
\begin{spec}
calcLine :: NPoint -> (NPoint -> OverTime NPoint)
calcLine [] = const nil
calcLine(p:x) = curry g p (calcLine x) where
   g :: (Rational, NPoint -> OverTime NPoint) -> (NPoint -> OverTime NPoint)
   g (d,f) l = case l of
       []     -> nil
       (x:xs) -> \z -> concat $ (sequenceA [singl . linear1d d x, f xs]) z
\end{spec}
2D:
\begin{code}
bezier2d :: [NPoint] -> OverTime (Float, Float)
bezier2d [] = const (0, 0)
bezier2d l = \z -> (fromRational >< fromRational) . (\[x, y] -> (x, y)) $ ((deCasteljau l) z)
\end{code}
Modelo:
\begin{code}
data World = World { points :: [NPoint]
                   , time :: Float
                   }
initW :: World
initW = World [] 0

tick :: Float -> World -> World
tick dt world = world { time=(time world) + dt }

actions :: Event -> World -> World
actions (EventKey (MouseButton LeftButton) Down _ p) world =
  world {points=(points world) ++ [(\(x, y) -> map toRational [x, y]) p]}
actions (EventKey (SpecialKey KeyDelete) Down _ _) world =
    world {points = cond (== []) id init (points world)}
actions _ world = world

scaleTime :: World -> Float
scaleTime w = (1 + cos (time w)) / 2

bezier2dAtTime :: World -> (Float, Float)
bezier2dAtTime w = (bezier2dAt w) (scaleTime w)

bezier2dAt :: World -> OverTime (Float, Float)
bezier2dAt w = bezier2d (points w)

thicCirc :: Picture
thicCirc = ThickCircle 4 10

ps :: [Float]
ps = map fromRational ps' where
  ps' :: [Rational]
  ps' = [0, 0.01..1] -- interval
\end{code}
Gloss:
\begin{code}
picture :: World -> Picture
picture world = Pictures
  [ animateBezier (scaleTime world) (points world)
  , Color white . Line . map (bezier2dAt world) $ ps
  , Color blue . Pictures $ [Translate (fromRational x) (fromRational y) thicCirc | [x, y] <- points world]
  , Color green $ Translate cx cy thicCirc
  ] where
  (cx, cy) = bezier2dAtTime world
\end{code}
Animação:
\begin{code}
animateBezier :: Float -> [NPoint] -> Picture
animateBezier _ [] = Blank
animateBezier _ [_] = Blank
animateBezier t l = Pictures
  [ animateBezier t (init l)
  , animateBezier t (tail l)
  , Color red . Line $ [a, b]
  , Color orange $ Translate ax ay thicCirc
  , Color orange $ Translate bx by thicCirc
  ] where
  a@(ax, ay) = bezier2d (init l) t
  b@(bx, by) = bezier2d (tail l) t
\end{code}
Propriedades e \emph{main}:
\begin{code}
runBezier :: IO ()
runBezier = play (InWindow "Bézier" (600, 600) (0,  0))
  black 50 initW picture actions tick

runBezierSym :: IO ()
runBezierSym = quickCheckWith (stdArgs {maxSize = 20, maxSuccess = 200} ) prop_bezier_sym
\end{code}

Compilação e execução dentro do interpretador:\footnote{Pode ser útil em testes
envolvendo \gloss{Gloss}. Nesse caso, o teste em causa deve fazer parte de uma função
|main|.}
\begin{code}
main = runBezier

run = do { system "ghc cp2021t" ; system "./cp2021t" }
\end{code}

\subsection*{QuickCheck}
Código para geração de testes:
\begin{code}
instance Arbitrary UnOp where
  arbitrary = elements [Negate, E]

instance Arbitrary BinOp where
  arbitrary = elements [Sum, Product]

instance (Arbitrary a) => Arbitrary (ExpAr a) where
  arbitrary = do
    binop <- arbitrary
    unop  <- arbitrary
    exp1  <- arbitrary
    exp2  <- arbitrary
    a     <- arbitrary

    frequency . map (id >< pure) $ [(20, X), (15, N a), (35, Bin binop exp1 exp2), (30, Un unop exp1)]


infixr 5 .=?=.
(.=?=.) :: Real a => a -> a -> Bool
(.=?=.) x y = (toRational x) == (toRational y)


\end{code}

\subsection*{Outras funções auxiliares}
%----------------- Outras definições auxiliares -------------------------------------------%
Lógicas:
\begin{code}
infixr 0 .==>.
(.==>.) :: (Testable prop) => (a -> Bool) -> (a -> prop) -> a -> Property
p .==>. f = \a -> p a ==> f a

infixr 0 .<==>.
(.<==>.) :: (a -> Bool) -> (a -> Bool) -> a -> Property
p .<==>. f = \a -> (p a ==> property (f a)) .&&. (f a ==> property (p a))

infixr 4 .==.
(.==.) :: Eq b => (a -> b) -> (a -> b) -> (a -> Bool)
f .==. g = \a -> f a == g a

infixr 4 .<=.
(.<=.) :: Ord b => (a -> b) -> (a -> b) -> (a -> Bool)
f .<=. g = \a -> f a <= g a

infixr 4 .&&&.
(.&&&.) :: (a -> Bool) -> (a -> Bool) -> (a -> Bool)
f .&&&. g = \a -> ((f a) && (g a))
\end{code}

%----------------- Soluções dos alunos -----------------------------------------%

\section{Soluções dos alunos}\label{sec:resolucao}
Os alunos devem colocar neste anexo as suas soluções para os exercícios
propostos, de acordo com o "layout" que se fornece. Não podem ser
alterados os nomes ou tipos das funções dadas, mas pode ser adicionado
texto, disgramas e/ou outras funções auxiliares que sejam necessárias.

Valoriza-se a escrita de \emph{pouco} código que corresponda a soluções
simples e elegantes. 

\subsection*{Problema 1} \label{pg:P1}
São dadas:
\begin{code}
cataExpAr g = g . recExpAr (cataExpAr g) . outExpAr
anaExpAr g = inExpAr . recExpAr (anaExpAr g) . g
hyloExpAr h g = cataExpAr h . anaExpAr g

eval_exp :: Floating a => a -> (ExpAr a) -> a
eval_exp a = cataExpAr (g_eval_exp a)

optmize_eval :: (Floating a, Eq a) => a -> (ExpAr a) -> a
optmize_eval a = hyloExpAr (gopt a) clean

sd :: Floating a => ExpAr a -> ExpAr a
sd = p2 . cataExpAr sd_gen

ad :: Floating a => a -> ExpAr a -> a
ad v = p2 . cataExpAr (ad_gen v)
\end{code}
Definir:


\vspace{1cm}
\textbf{outExpAr}

\begin{code}
outExpAr X = i1 $ ()
outExpAr (N a) = i2 . i1 $ a
outExpAr (Bin o l r) = i2 . i2 . i1 $ (o, (l,r))
outExpAr (Un o e) = i2 . i2 .i2 $ (o,e)
\end{code}

Para este exercicio, sabemos que |outExpAr . inExpAr = id|, sendo este um isomorfismo.
Portanto:


\begin{eqnarray}
\start
|outExpAr . inExpAr = id|
%
\just\equiv{ Def. inExpAr; Natural-id; Reflexão-+ }
%
|outExpAr . (either (const X) num_ops) = (either i1 i2)|
%
\just\equiv{ Fusão-+ }
%
|either (outExpAr . (const X)) (outExpAr . num_ops) = (either i1 i2)|
%
\just\equiv{ Eq-+ }
%
        |lcbr(
		outExpAr . (const X) = i1
	)(
		outExpAr . num_ops = i2
	)|
%
\just\equiv{ Def. num ops; Natural-id; Reflexão-+ }
%
        |lcbr(
		outExpAr . (const X) = i1
	)(
		outExpAr . (either N ops) = i2 . (either i1 i2)
	)|
%
\just\equiv{ Eq-+ (no segundo ramo) }
%
\left\{
   \begin{array}{lll}
      |outExpAr . (const X) = i1|\\
      |outExpAr . N = i2 . i1|\\
      |outExpAr . ops = i2 . i2|
  \end{array}
\right.
%
\just\equiv{ Def. ops }
%
\left\{
   \begin{array}{llll}
      |outExpAr . (const X) = i1|\\
      |outExpAr . N = i2 . i1|\\
      |outExpAr . (either bin (uncurry Un)) = i2 . i2 . (either i1 i2)|
  \end{array}
\right.
%
\just\equiv{ Eq-+ }
%
\left\{
   \begin{array}{llll}
      |outExpAr . (const X) = i1|\\
      |outExpAr . N = i2 . i1|\\
      |outExpAr . bin = i2 . i2 . i1|\\
      |outExpAr . (uncurry Un) = i2 . i2 . i2|
  \end{array}
\right.
%
\just\equiv{ Pointwise }
%
\left\{
   \begin{array}{llll}
      |outExpAr (const X) = i1 ()|\\
      |outExpAr (N a) = i2 . i1 (a)|\\
      |outExpAr (Bin o l r) = i2 . i2 . i1 (o, (l, r))|\\
      |outExpAr (Un o e) = i2 . i2 . i2 (o, e)|
  \end{array}
\right.
\qed
\end{eqnarray}

Deste modo, chegamos à expressao final de outExpAr.


\vspace{1cm}
\textbf{recExpAr}


Aplicando a regra:
    |baseExpAr’ g f = baseExpAr id g id f f id f|
em |recExpAr| fica:
\begin{eqnarray}
\start
    |recExpAr id g = baseExpAr' id g|
    %
\just\equiv{equivalente}
%
  |recExpAr id g = baseExpAr id id id g g id g|
\qed
\end{eqnarray}
Chegando a esta definição: 
\begin{code}
recExpAr f =  id -|- (id -|- (id >< (f >< f) -|- id >< f))
\end{code}

\vspace{1cm}
\textbf{g\_eval\_exp}

Tendo a definição de |recExpAr| é possivel obter o seguinte diagrama do catamorfismo de |eval_exp|:\\

\begin{eqnarray*}
\xymatrixcolsep{0.5pc}\xymatrixrowsep{5pc}
\centerline{\xymatrix{
   ExpAr A \ar[d]_-{|cata g_eval_exp|}
                \ar@@/^2pc/ [rr]^-{|out|} & \qquad \cong
&   1 + (A + (BinOp \times (ExpAr A \times ExpAr A)) + (UnOp \times ExpAr A)) \ar[d]^{|id + (id + (id >< (eval_exp >< eval_exp) + (id >< eval_exp))|}
                                     \ar@@/^2pc/ [ll]^-{|in|}
\\
    |a| &  & 1 + (a + ((BinOp \times (a \times a)) + (UnOp \times a))\ar[ll]^-{|g_eval_exp|}
}}
\end{eqnarray*}
Para descobrir o gene |g_eval_exp| usamos o seu tipo e as regras matemáticas.

Portanto:

\begin{code}
g_eval_exp e = either (const e) g_eval1 where
    g_eval1 = either id g_eval2
    g_eval2 = either g_eval_exp3 g_eval_exp4
g_eval_exp3 (a,(b,c)) = if a == Product then b * c else b + c
g_eval_exp4 (a,b) = if a == E then Prelude.exp b  else  -b
\end{code}

\vspace{1cm}
\textbf{optimize\_eval}

Para tirar proveito dos elementos absorventes de cada operação, definimos um hilomorfismo
onde o anamorfismo não altera a estrutura de dados o que permite que o catamorfimo permaneça igual ao gene |g_eval_exp|.
\begin{code}
clean (Bin Product _ (N 0)) = outExpAr $ N 0
clean (Bin Product (N 0) _) = outExpAr $ N 0 
clean x = outExpAr x

gopt a = g_eval_exp a 
\end{code}

\vspace{1cm}
\textbf{sd\_gen}

Tendo a definição de |recExpAr| é possivel obter o seguinte diagrama do catamorfismo de |sd|:

\begin{eqnarray*}
\xymatrixcolsep{0.5pc}\xymatrixrowsep{5pc}
\centerline{\xymatrix{
   ExpAr A \ar[d]_-{|cata sd_gen|}
                \ar@@/^2pc/ [rr]^-{|out|} & \qquad \cong
&   1 + (A + (BinOp \times (ExpAr A \times ExpAr A)) + (UnOp \times ExpAr A)) \ar[d]^{|id + (id + (id >< ((cata sd_gen) >< (cata sd_gen)) + (id >< (cata sd_gen))|}
                                     \ar@@/^2pc/ [ll]^-{|in|}
\\
    |ExpAr A >< ExpAr A| &  & 1 + (A + ((BinOp \times ((ExpAr A)^2 \times (ExpAr A)^2)) + (UnOp \times (ExpAr A)^2))\ar[ll]^-{|sd_gen|}
}}
\end{eqnarray*}
Para descobrir o gene |sd_gene| temos de usar o seu tipo e as regras de derivação conhecidas.

Portanto:

\begin{code}
sd_gen :: Floating a =>
    Either () (Either a (Either (BinOp, ((ExpAr a, ExpAr a), (ExpAr a, ExpAr a))) (UnOp, (ExpAr a, ExpAr a)))) -> (ExpAr a, ExpAr a)
sd_gen = either g_sd1 (either g_sd2 (either g_sd_gen4 g_sd_gen5)) where
    g_sd1 _ = (X, N 1)
    g_sd2 a = (N a, N 0)
    
g_sd_gen4 (o,((exp1,exp2),(exp3,exp4))) = if o == Product then (Bin Product exp1 exp3, Bin Sum (Bin Product exp1 exp4) (Bin Product exp2 exp3)) 
                                            else (Bin Sum exp1 exp3, Bin Sum exp2 exp4)
g_sd_gen5 (o,(exp1,exp2)) = if o == E then (Un o exp1, Bin Product (Un o exp1) exp2)
                              else (Un o exp1, Un o exp2)

\end{code}

\vspace{20cm}
\textbf{ad\_gen}

\begin{eqnarray*}
\xymatrixcolsep{0.5pc}\xymatrixrowsep{5pc}
\centerline{\xymatrix{
   ExpAr A \ar[d]_-{|cata ad_gen|}
                \ar@@/^2pc/ [rr]^-{|out|} & \qquad \cong
&   1 + (A + (BinOp \times (ExpAr A \times ExpAr A)) + (UnOp \times ExpAr A)) \ar[d]^{|id + (id + (id >< ((cata ad_gen) >< (cata ad_gen)) + id >< (cata ad_gen)))|}
                                     \ar@@/^2pc/ [ll]^-{|in|}
\\
    |A >< A| &  & 1 + (A + ((BinOp \times ((ExpAr A)^2 \times (ExpAr A)^2)) + (UnOp \times (ExpAr A)^2))\ar[ll]^-{|ad_gen|}
}}
\end{eqnarray*}

Para calcular o valor da derivada de uma expressão nesse ponto, sem manipular a expressão original através do 
método de \emph{Automatic differentiation} temos que definir um gene do catamorfismo que crie um par com o valor original 
e o valor da derivada no ponto. Utilizando o diagrama e as regras matemáticas chega-se à definição:

\begin{code}
ad_gen d = either g_ad1 (either g_ad2 (either g_ad3 g_ad4)) where
    g_ad1 = const (d,1)
    g_ad2 a = (a, 0)
g_ad3 (o,((e1,e2),(e3,e4))) = if o == Product then (e1*e3, e1*e4 + e2*e3)
                                            else (e1 + e3, e2 + e4)
g_ad4 (o,(e1,e2)) = if o == E then (Prelude.exp e1, (Prelude.exp e1) * e2)
                               else  (negate e1, negate e2)
\end{code}

\subsection*{Problema 2}
Definir
\begin{code}
loop (c,k,s) = (c*k `div` s,k+4,s+1)
inic = (1,2,2)
prj (c,k,s) = c 
\end{code}
por forma a que
\begin{code}
cat = prj . for loop inic
\end{code}
seja a função pretendida.
\textbf{NB}: usar divisão inteira.
Apresentar de seguida a justificação da solução encontrada.

\paragraph{}	
A função pode ser definida recursivamente como se deriva a seguir:

\paragraph{}
$
C_{n+1} = \frac{(2(n+1))!}{(n+2)! (n+1)! } \iff C_{n+1} = \frac{(2n+2)(2n+1)2n!}{(n+2)(n+1)! (n+1)n! } \iff C_{n+1} = \frac{(2n+2)(2n+1)}{(n+2)(n+1) } \times C_n \iff C_{n+1} = \frac{(2(n+1)(2n+1)}{(n+2)(n+1) } \times C_n \iff C_{n+1} = \frac{4n+2}{n+2} \times C_n
$

\paragraph{}
A partir daqui podemos definir 3 funções: \textit{c}, \textit{k} e \textit{s} tal que:
\paragraph{}

$c \; 0 = 1$

$c_{n+1} = c_n * \frac {k_n} {s_n}$

\paragraph{}

$k \; 0 = 2$

$k_n = 4n+2 \iff k_{n+1} = 4n + 4 + 2 k_{n+1} = k_n + 4$

\paragraph{}

$s \; 0 = 2$

$s_n = n +2 \iff s_{n+1} = n+2+1 \iff s_{n+1} = s_n + 1$

\paragraph{}
Sendo a \textit{inic} igual á inicialização das variáveis, ou seja, \textit{inic = (1,2,2)}, \textit{loop} igual ao corpo do ciclo, \textit{loop (c,k,s) = (c*k `div` s,k+4,s+1)} e \textit{prj} a função que dado um triplo devolve o primeiro elemento.


\subsection*{Problema 3}
\\
\textbf{calcLine}
\paragraph{}
Para este exercicio, começamos por desenhar o diagrama que representa este catamorfismo, pelo que
se apresenta em seguida:


\begin{eqnarray*}
\xymatrix@@C=2cm{
    |NPoint|
           \ar[d]_-{|cata g = calcLine|}
&
    |1 + Q >< NPoint|
           \ar[d]^{|id + id >< calcLine|}
           \ar[l]_-{|in|}
\\
     |NPoint -> (OverTime NPoint)|
&
     |1 + Q >< (NPoint -> OverTime NPoint)|
           \ar[l]^-{|g|}
}
\end{eqnarray*}


Deste modo, tendo o diagrama e sabendo que calcLine é um catamorfimo de um either, temos que o seu gene é |g = either g1 g2|.
\\
\\
Para g1, através da ajuda do ghci, determinamos que é do tipo |[Rational] -> Float -> [Rational]| e sabemos que para este caso
o resultado será sempre uma lista vazia. Podemos então inferir que para quaisquer que sejam os dois argumentos, o resultado será sempre
o mesmo: |g1 _ _ = nil|.
\\
\\
Para g2, através do código fornecido nos anexos, reparamos que num trecho da função auxiliar é-nos fornecida uma função que
se adequa ao caso do g2, sendo que temos um par que vai para o mesmo tipo do resultado deste catamorfismo: 
|(Rational, NPoint -> OverTime NPoint) -> (NPoint -> OverTime NPoint)|.
Assim, recorremos a esta função para calcular g2, obtendo assim o segundo elemento do either que compõe o catamorfismo.
\\
\\

\begin{code}
calcLine :: NPoint -> (NPoint -> OverTime NPoint)
calcLine = cataList h where
   h = either g1 g2
g1 _ _ = nil
g2 (d,f) l = case l of
       []     -> nil
       (x:xs) -> \z -> concat $ (sequenceA [singl . linear1d d x, f xs]) z
\end{code}
\\
\textbf{deCasteljau}
\begin{code}
deCasteljau :: [NPoint] -> OverTime NPoint
deCasteljau = hyloAlgForm alg coalg where
   coalg = undefined
   alg = undefined

hyloAlgForm = undefined
\end{code}


Para este caso, sabemos que teríamos que partir de que um hilomorfismo é a composição dos combinadores catamorfismo e anamorfismo,
pelo que inicialmente se constrói a estrutura (anamorfismo) e depois se consome a estrutura criada (catamorfismo). Porém, não
conseguimos progredir na resolução deste problema até chegar a uma solução para o mesmo.

\subsection*{Problema 4}


\vspace{5mm}
\underline{Solução para listas não vazias:}
\begin{code}
avg = p1.avg_aux
\end{code}

\begin{code}
avg_aux = cataList (either (const b) q) where
  b = (1 , 0)
  q (h, (avg, lng)) = ((h + (avg * lng)) / (succ lng), (succ lng))
\end{code}

\textbf{NOTA:} Neste caso, uma vez que estamos a trabalhar com listas não vazias, utilizamos 
|in = [singl,cons]| em vez de |in = [nil, cons]|.

O diagrama correspondente a este exercício traduz-se no seguinte:

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |A+|
           \ar[d]_-{|cata g|}
&
    |A + A >< A|
           \ar[d]^{|id + id >< (cata g)|}
           \ar[l]_-{|inList|}
\\
     |A >< N|
&
     |A + A >< (N >< N)|
           \ar[l]^-{|g|}
}
\end{eqnarray*}


Pelo enunciado sabemos que:

|avg_aux = cata (either b q)| e que |avg_aux = split avg length|.

Deste modo, podemos inferir que |split avg length = cata (either b q)|.

Portanto torna-se necessário traduzir este either num split, para que seja possivel aplicar a Lei da Recursividade Mútua (Fokkinga).



\begin{eqnarray}
\start
|either b q|
%
\just\equiv{ Reflexão-x }
%
|(split p1 p2) . (either b q)|
%
\just\equiv{ Fusão-x }
%
| split (p1 . (either b q), p2 . (either b q))| 
%
\just\equiv{ Fusão-+ }
%
|split (either (p1 . b) (p1 . q)) (either (p2 . b) (p2 . q))|
\qed
\end{eqnarray}

Deste modo, conseguimos aplicar diretamente a Lei da Recursividade Mútua (tal como sugerido), uma vez que sabemos que:


|avg_aux = split avg length| é equivalente a |split avg length = cata ((either (p1 . b) (p1 . q)) (either (p2 . b) (p2 .q)))|

\begin{eqnarray}
\start
%
\just\equiv{ Fokkinga }
%
        |lcbr(
		avg . in = either (p1 . b) (p1 . q) . F (split avg length)
	)(
		length . in = either (p2 . b) (p2 . q) . F(split avg length)
	)|
%
\just\equiv{ Def. in; Ff = id + id x f }
%
        |lcbr(
		avg . (either singl cons) = (either (p1 . b) (p1 . q)) . (id + id >< (split avg length))
	)(
		length . (either singl cons) = (either (p2 . b) (p2 . q)) . (id + id >< (split avg length))
	)|
%
\just\equiv{ Fusão-+; Absorção-+ }
%
        |lcbr(
		(either (avg . singl) (avg . cons)) = either (p1 . b) (p1 . q . (id >< (split avg length)))
	)(
		(either (length . singl) (length . cons)) = either (p2 . b) (p2 . q . (id >< (split avg length)))
	)|
%
\just\equiv{ Eq-+ }
%
\left\{
   \begin{array}{llll}
      |avg . singl = p1 . b|\\
      |avg . cons = p1 . q . (id >< (split avg length))|\\
      |length . singl = p2 . b|\\
      |lenght . cons = p2 . q . (id >< (split avg length))|
  \end{array}
\right.
%
\just\equiv{ Pointwise }
%
\left\{
   \begin{array}{llll}
      |avg . singl l = (p1 . b) l|\\
      |avg . cons (h, t) = p1 . q . (id >< (split avg length)) (h, t)|\\
      |length . singl l = (p2 . b) l|\\
      |lenght . cons (h, t) = p2 . q . (id >< (split avg length)) (h, t)|
  \end{array}
\right.
%
\just\equiv{ Assoc-comp; Def. cons }
%
\left\{
   \begin{array}{llll}
      |avg . singl l = p1 . (b l)|\\
      |avg (h : t) = p1 . q . (id h, (split avg length) t)|\\
      |length . singl l = p2 . (b l)|\\
      |lenght (h : t) = p2 . q . (id h, (split avg length) t)|
  \end{array}
\right.
%
\just\equiv{ Def-split }
%
\left\{
   \begin{array}{llll}
      |avg . singl l = p1 . (b l)|\\
      |avg . cons (h : t) = p1 (q (h, (avg t, length t)))|\\
      |length . singl l = p2 . (b l)|\\
      |lenght . cons (h : t) = p2 (q (h, (avg t, length t)))|
  \end{array}
\right.
\qed
\end{eqnarray}

Após chegar a este ponto, é possível inferir que temos que tomar |b| e |q| como pares.
Assim, temos |b = (1,0)| e |q (h, (avg, lng)) = ((h + (avg * lng)) / (succ lng), (succ lng))|.

Note-se que para |q| utilizámos o cálculo da média ponderada para o primeiro elemento do par e o incremento do length para o segundo.


\vspace{1cm}

\underline{Solução para árvores de tipo \LTree:}
\begin{code}
avgLTree = uncurry (/) . (split (p1 . cataLTree gene ) (p2 . cataLTree gene )) where
    h1 = id
    h2 = uncurry (+) . (p1 >< p1)
    k1 = (const 1)
    k2 = uncurry (+) . (p2 >< p2)
    b = split h1 k1
    q = split h2 k2
    gene = (either b q)
\end{code}


Para este exercicio, resolvemos utilizar um |split sum length|, uma vez que nos facilita o cálculo e, deste modo
apenas temos que efetuar a divisão entre os membros deste split para obter a média.


O diagrama correspondente a este exercício traduz-se no seguinte:

\begin{eqnarray*}
\xymatrix@@C=2cm{
    |LTree A|
           \ar[d]_-{|cataLTree g|}
&
    |A + (LTree A x LTree A)|
           \ar[d]^{|id + (cataLTree g) >< (cataLTree g)|}
           \ar[l]_-{|in|}
\\
     |A >< N|
&
     |A + (A >< N) x (A >< N)|
           \ar[l]^-{|g|}
}
\end{eqnarray*}


Assim, passamos a demonstrar os cálculos:

\begin{eqnarray}
\start
    |lcbr(
        sum . in = h . F(split sum length)
    )(
        len . in = k . F (split sum length)
    )|
%
\just\equiv{ |h = (either h1 h2)|; |k = (either k1 k2)|; Ff = id + f x f }
%
    |lcbr(
        sum . in = (either h1 h2) . (id + (split sum length) x (split sum length))
    )(
        len . in = (either k1 k2) . (id + (split sum length) x (split sum length)0)
    )|
%
\just\equiv{ Absorção-+; Def. in; Eq-+ }
%
\left\{
   \begin{array}{llll}
      |sum . Leaf = h1|\\
      |sum . Fork = h2 . ((split sum length) x (split sum length))|\\
      |length . Leaf = k1|\\
      |lenght . Fork = k2 . ((split sum length) x (split sum length))|
  \end{array}
\right.
\qed
\end{eqnarray}

Neste ponto, é preciso ter em conta o objetivo de cada ramo. \hfill \break
- Para o primeiro ramo, sabemos que o somatório de uma folha é o proprio valor (dividir por 1). \hfill \break
- Para o segundo ramo, temos que somar os valores dos somatórios decorrentes de cada ramo. \hfill \break
- Para o terceiro ramo, sabemos que o tamanho de uma arvore com apenas uma folha é 1. \hfill \break
- Finalmente, para o quarto ramo, queremos atualizar o length, somando os length's das duas arvores descendentes do nodo em questão.

\vspace{5mm}
Deste modo, conseguimos obter os valores para h1, h2, k1 e k2. \hfill \break
Posteriormente, temos que ter em conta que no final do cálculo temos |split (either h1 h2) (either k1 k2)|, mas
sendo o gene um either, temos que aplicar a Lei da Troca como meio de obter um either de splits, ficando então
|either (split h1 k1) (split h2 k2)|, sendo |b = (split h1 k1)| e |q = (split h2 k2)|.

Por fim, para obter o avg, temos apenas que efetuar a divisão do somatório pelo tamanho, recorrendo ao |uncurry (/)|.







\subsection*{Problema 5}
Inserir em baixo o código \Fsharp\ desenvolvido, entre \verb!\begin{verbatim}! e \verb!\end{verbatim}!:

\begin{verbatim}
\end{verbatim}

%----------------- Fim do anexo com soluções dos alunos ------------------------%

%----------------- Índice remissivo (exige makeindex) -------------------------%

\printindex

%----------------- Bibliografia (exige bibtex) --------------------------------%

\bibliographystyle{plain}
\bibliography{cp2021t}

%----------------- Fim do documento -------------------------------------------%
\end{document}