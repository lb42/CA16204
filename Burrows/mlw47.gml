.sr docfile = &sysfnam. ;.sr docversion = 'Draft';.im teigmlp1
<!-- TEI Doc. No: TEI ML W47                                    -->
<!-- Title: Tra(ns)ducing Burrows' Austen                       -->
<!-- Drafted: Lou Burnard                                       -->
<!-- ********************************************************** -->
<!-- Revision History (add lines at top)                        -->
<!-- Date      Who    What                                      -->
<!-- 28 Jul 92 LK     created Script file                       -->
<!-- 19 Aug 91 LB     revised into final version                -->
<!-- 15 Aug 91 LB     drafted preliminary version               -->
<!-- ********************************************************** -->
<!--                                                            -->
.* Document proper begins.
.sr docdate '19 August 1991'
<gdoc sec=&security.>
<include file=teiblank>
<frontm>
<titlep>
<title stitle="TEI &docfile. Tra(ns)ducing Burrows' Austen">Tra(ns)ducing Burrows' Austen
<author>Lou Burnard
<docnum>TEI &docfile.
<date>&docdate.
</titlep>
<!>
<abstract>
This paper describes the encoding scheme used for the
electronic texts of Jane Austen's six novels prepared by
Professor John Burrows at the University of Newcastle, in
terms of the textual features which that markup identifies. A
TEI-like transduction for the scheme is proposed, and Spitbol
source code for a program which implements the transduction
provided.
</abstract>
</frontm>
<!>
<body>
<h1>Burrows' Austen
<p>John Burrows' <cit>Computation into Criticism</cit> (Oxford,
Clarendon Pr, 1987) has received wide and well-merited
critical acclaim for the sophistication of its analysis
of Jane Austen's style, due in no small part to statistics
obtained by the analysis of an exceptionally carefully
prepared and encoded electronic text of the novels. This
text, which is to be republished by Oxford Electronic
Publishing, uses an encoding scheme devised by Burrows and
his associates, which has also been used for a variety of other
texts prepared at the University of Newcastle exploring further application
of Burrows' methods, for example in
English Renaissance drama.  The scheme was devised to
facilitate the production of word form counts, categorised
along various dimensions, using traditional concordancing and
indexing software such as the Oxford Concordance Program.
These counts are then used as input for more sophisticated
special purpose statistical analysis programs developed by
Burrows and his associates.<fn>References to various
Burrows publications to be supplied</fn>
<p>Burrows' Austen texts are transcribed from the Oxford
Illustrated Edition of R.W.Chapman (London, 3rd edn, 1933),
still widely regarded as among the best available critical
editions of Austen's work. The prefatory matter, textual
notes and other appendixes of Chapman's edition are not
included, but their lineation and pagination are carefully
preserved. An example of the format, taken from
<cit>Mansfield Park</cit>, is given in Appendix I. A number
of characteristics are immediately apparent:
<ul>
<li>The text is organised as a series of records, each of which
contains an initial string of codes (Burrows uses the term
<q>panel</q>), followed by some text, generally (but not
always) that of a complete printed line in the original.
<li>The text  contains various special tags delimited by the
character $. A few other special characters (notably / % and *)
are used to control tokenization of the text.
<li>The spacing and indentation of the original is not
recoverable from the encoded form. Some ancillary matter
such as running headings etc. is also omitted.
</ul>
I discuss each of these
characteristics in turn below, in a
spirit of objective summary rather than critical assessment,
let it be clearly understood.
<h2>1.1  The reference panel
<p>The function of the reference panel is to identify where in a
particular text the text occupying the rest of the input
record is to be found, and also to categorise it. (One of the
most interesting features of Burrows' analysis derives from
the ability his encoding provides to distinguish passages of
texts in the novel spoken by different characters or
attributed to the inner monologue of different characters.)
<p>Some typical reference panels look like this:
<xmp>
<![ CDATA [
     101:003,08['  ]|
     102:010,12[G  ]|
     102:008,20@g   |
]]>
</xmp>
Each contains the following items, reading left to right:
<ol>
<li>Current volume number within the work in question (one
digit)
<li>Current chapter number within this volume (two digits)
<li>A colon
<li>Current page number within the work in question: Chapman
numbers pages consecutively throughout the work,
disregarding volume divisions (three digits)
<li>A comma
<li>Number of this line on the printed page, disregarding any
running titles. Line-numbering starts at one, for the first line
on each new page in the Chapman edition. (two digits)
<li>A code indicating whether the current line consists of
direct speech (including narrative) or indirect speech,
mediated by the narrator. This is either a left square bracket
(direct) or a commercial at sign (indirect).
<li>A code indicating the character by whom the current line
is spoken. This will be either a single apostrophe, as in the
example above, which indicates that the line is to be read as
the direct speech of the narrator, or one of a series of
alphabetic codes defined for each character in the work.
These codes may be up to three characters in length and are
terminated by a closing square bracket (except, apparently,
for indirect speech).
<li>Uppercase alphabetic codes are used when a character's
speech is presented directly; lowercase when it is presented
indirectly, for example as internal monologue --- where the
narrator, in Burrows' phrase, <q>speaks with another's
voice</q>. This distinction is additionally implied by the @
code described above.
<li>A vertical bar followed by a single space closes the panel.
</ol>
Lists of the codes used for individual speakers are provided
in Burrows' published works and in separate files provided
with the original electronic text. The codes are not entirely
arbitrary: <q>...the heroine of each novel is identified as $A$,
the hero as $B$, the other speakers by similar prefixes, and
the non-speakers by a further series begining at
$ZA$</q><fn><cit>Computation into Criticism</cit>,
p.9</fn>. The full list for <cit>Mansfield Park</cit> is reproduced
in Appendix 1.
<h2>1.2.  Embedded codes
<p>Within the lines of text further encoding may be
distinguished, signalled by the use of the special characters /
and $. Sequences enclosed by these characters appear more
or less arbitrarily within or across line boundaries. The
characters * and # are also used with a special sense. Their
functions are listed below.
<gl>
<gt>Word class codes
<gd>These are numeric codes delimited
by dollar signs and suffixed to certain words for purposes of
disambiguation, as in the following:
<xmp>
  a man who$6#1$ lived to$4$ a very advanced age...
  To$9$ be sure it is: and, indeed, it strikes me that$3$...
</xmp>
Ten major categories of word codes are defined, with a
further subdivision (marked off by the sharp sign) for
particular word senses or types of usage in some cases, as
further discussed below. Note that word codes are attached
<emph>only</emph> to words regarded by Burrows as
homographs, for example nominal or verbal senses of words
such as <q>act</q>, or to distinguish different senses of a
noun such as <q>ball</q>. A list of such homographs is
provided in the documentation for each text.
<gt>Name prefixes
<gd>These are alphabetic codes also
delimited by dollar signs but prefixed to the phrases
denoting names of characters in the novels wherever they
appear, as in the following line:
<xmp>
 $SS#G$Mrs%*John*Dashwood did not at all approve of what
</xmp>
The name codes used for this purpose are identical with those
used to identify speakers within the reference panel, except
that in the body of the text, each speaker code carries a
prefix comprising a two byte code for the text concerned
(<q>SS</q> i.e. <cit>Sense and Sensibility</cit> in the above
example) and the sharp sign #.
<gt>Separator codes
<gd>The special characters percent (%)
and asterisk (*) are used to represent full stops not to be
regarded as sentence terminators and spaces not to be
regarded as word terminators respectively. The name above
provides examples of both; they may also be found outside
names however, as in <q>any*thing</q> <q>7000*l%</q> (i.e.
<q>&pound;7000</q>).
<gt>Special characters etc.
<gd> A small number of
typographically distinct features have been encoded using
other special purpose characters, as follows:
</gl>
<ul>
<li>The long dash
is represented by two or more
consecutive tilde signs
<li>Italicised words and phrases are delimited by / characters
<li>Opening and closing quotes are not distinguished but marked
uniformly by a single " mark. Nested quotation marks (represented by
single quotation marks in Chapman) are represented by a pair of " marks;
again no distinction is made between opening and closing quote marks.
<li>Accented letters in foreign words or phrases are marked
with special characters following the accented letter. For
example, <q>te^te-a``-te^te</q>  and
<q>protege''e</q> appear as
<xmp>
teˆte*a`teˆte
protege=e
</xmp>
respectively.
</ul>
<h1>TEI equivalences
<p>For most of the distinctions itemised in the previous
section, a TEI equivalent is not hard to identify. Structural
divisions of the novels, such as volumes, chapters and page or
line breaks can be directly translated into the appropriate
TEI tag, the absence of paragraph divisions being the only
serious omission. Likewise, translation of the code sequences
used for accents, typographic highlighting, dashes and
quotation marks into the appropriate entity references
poses no serious conceptual difficulties.  A brief summary
follows:
<gl>
<gt>accents
<gd>The sequence <term>letter</term>= is translated to
&amp.<term>letter</term>acute;.
The sequence <term>letter</term> is translated to
.br
&amp.<term>letter</term>circ;. The sequence <term>letter</term>` is
translated
to &amp.<term>letter</term>grave;.
<gt>spacing
<gd>The character * is replaced by the entity
reference <term>&amp.space</term>, except when it appears within a
delimited phrase such as name, in which case it is translated
to a real space. The character % is replaced by the entity
reference <term>&amp.point</term>.
<gt>quotes
<gd>The single character " is replaced by the entity
reference <term>&amp.odq</term> (for <q>open direct quote</q>) or by
<term>&amp.cdq</term> (for <q>close direct quote</q>) as appropriate.
Two adjacent " marks however are replaced by the entity reference
<term>&amp.onq</term> (for <q>open nested quote</q>) or by
<term>&amp.cnq</term> (for <q>close nested quote</q>) as appropriate.
</gl>
Other changes required, and performed by the Spitbol
program in Appendix 2, are discussed below.
<h2>2.1.  Structural tags
<p>A number of additional features are required at the start of
each text for TEI conformance, notably a TEI header. A skeleton for
these, together with various preliminaries needed for SGML conformance
(notably a DTD subset containing the required entity declarations) is
generated by the program. The two letter code associated with each text
is used as the value of an <att>id</att> attribute attached to the
<tag>text</tag> that surrounds the whole work. The TEI structural tags
<tag>div0</tag> and <tag>div1</tag> are used to mark volume and chapter
divisions. They are inserted at each point that
the first three digits of the reference panel change. In each
case, the number supplied in the reference panel becomes the
value of the <att>n</att> attribute, while the value of the
<att>name</att> attribute is set to <q>vol</q> or
<q>chap</q> as appropriate. The <att>id</att> attribute is not
set.
<p>Burrows' markup effectively organises the text as a series of
speeches, reflecting his interest in the language of Austen's
characters. While appropriate for his analytic purposes, these
subdivisions are probably less apt for the general case, since
some of the units so delimited are very short (for example,
narrative intrusions such as <q>he said</q>) while others are
very long.  Below the chapter level, a choice must therefore
be made among the following possibilities:
<ol>
<li>pages, divided into lines
<li>paragraphs, divided into lines or sentences
<li>speeches, divided into lines or sentences
</ol>
Whichever of these is
chosen as the main hierarchy, the
boundaries of the others can be preserved by empty
<tag>milestone</tag> tags, as proposed in the TEI's
<cit>Guidelines</cit>.<fn>See <cit>Guidelines
for the Encoding and Interchange of Machine-Readable Texts </cit>edited by
C.M. Sperberg-McQueen and Lou Burnard, version 1.1, 1990; pp 95-7</fn>
<h2>2.2.  Line or sentence breaks?
<p>As noted above, the original electronic text is organised to
correspond closely with the printed text. The line-breaks of
Chapman's edition are preserved carefully, so that for any
word occurrence a page, line, chapter and volume reference
can be found on the same record. The only minor exception to
this rule occurs where words are hyphenated across a
linebreak, such words being silently moved to the line on
which they begin; the hyphenation point in such cases is not
marked.
<p>Orthographic sentences, by contrast, are not explicitly
marked in the text, though they could probably be detected
automatically, a process made somewhat more reliable by
the removal of ambiguous full stops in Burrows' markup.
However, Austen's use of exclamation marks and queries
makes the process far from non-controversial while Burrows'
own comments<fn>See <cit>Computation into
Criticism</cit>, appendix A.</fn> suggest that the
sentence may not be a well-defined structural unit.
Defining the typographic line as a structural unit has the
attraction of enabling precise reference information to be
attached automatically to almost every word by the SGML
parser, while the units thus defined are at least non-controversial,
if of limited significance.
<p>An SGML encoded text need not repeat reference
information which is attached to structural elements, since an
SGML-aware processor by definition must know the context
within which a given element occurs.  For example, a chapter
within a volume need carry only a chapter number, the volume
number being inherited.  Whether typographic lines are regarded as
structural units (in which case a tag such as <tag>tl</tag> for
<q>typographic line</q> would be appropriate<fn>The obvious choice
<tag>l</tag> is used in the current guidelines for a metrical verse line;
<tag>line</tag>is another possibility, but rather long for a tag repeated
many times in the text</fn>) or as marking only segment boundaries (in
which case another milestone tag <tag>lb</tag> or <tag>line.break</tag>
could be used), the <att>n</att> attribute of the
<tag>lb</tag> (or <tag>tl</tag>) tag must carry both page and line
numbers, in order to minimise the amount of sequential scanning a
processor must carry out to determine the exact location of a point in the text.
<h2>2.3.  Pages, speeches or paragraphs?
<p>Neither speeches nor paragraphs nest conveniently within
pages. The page is also rather too large a unit for convenient
delimiting of context and has no obvious analytic function. Moreover, by
supplying explicit page-numbers as part of
the <att>n</att> attribute for <tag>lb</tag> elements, the
need to retain the page number for reference purposes is
largely obviated. However, it is not inconceivable that some
kinds of processing will want to process the text as a series
of pages. For that reason, we retain the page divisions,
marking them simply with an empty tag <tag>pb</tag> (for <q>page
break</q>) at the logical head of each page.   This tag also
takes an <att>n</att> attribute, in this case specifying the page
number.
<p>We are left with a choice between organising the text as a
series of paragraphs or as a series of speeches. As noted
above, the current electronic text lends itself most readily
to the latter, while common TEI practice would suggest the
former.  Paragraph breaks are easy and non-controversial (if
tedious) to identify in the original printed text; adding them
to the electronic text would have to be done by hand. On the
assumption that the cost of doing this is felt to be
worthwhile, speech divisions have been represented by
empty <tag>qb</tag> tags.
<p>These empty tags, exactly analogous to <tag>pb</tag> tags,
mark points in the narrative where the speaker or implied
speaker changes; the narrator being regarded as a speaker
for this purpose.  As with the page-break tags, they could be
automatically converted to scoped <tag>speech</tag> tags
within a concurrent hierarchy, if this was felt necessary. An
attribute <att>sp</att> is used to identify the speaker. The value
used is made by concatenating the two character identifier of
the text with the single character codes used in Burrows'
original. An additional attribute <att>mode</att>, with values
<q>direct</q> or <q>indirect</q>, is used to identify whether
the speech is direct or authorial. Note that this simplifies
slightly on the original scheme, in which indirect speech is
encoded both by the use of an at sign and by the use of lower
case rather than upper case identifiers; attribute values are
not generally case-sensitive in SGML name tokens, which is
another reason for preferring this method. Addition of the
text code to the speaker code facilitates linkage between
characters referred to in the text and their speeches.
<h1>Phrase level tagging
<p>Only two phrase level tags are needed: one to indicate words
or phrases italicised  in the original and the other for proper
names. Unfortunately, italics are used for foreign words as
well as for emphasised words, although the latter greatly
predominate. This usage is also inconsistent: In <cit>Mansfield
Park</cit>, for example, the phrase <q>te^te-a``-te^te</q> appears three
times, but is italicised only once.  The tag <tag>hi</tag> is therefore
used for all italicised words or phrases. A manual pass through the text
would be necessary to distinguish emphasis from foreign words.
<p>The proper names of characters referred to within the text
are marked with the tag <tag>name</tag> (rather than the
longer <tag>propname type=personal</tag> suggested by the
Guidelines) --- Burrows does not tag place names as such.
An attribute <att>code</att> is supplied for all names, the value
of which is the name code, as discussed above in connexion
with speaker tags. The various parts of a person's name are
enclosed within this tag, provided that they are marked as
parts of it by use of the <q>non-space</q> characters.
<h1>Word level tagging
<p>A choice must be made as to the treatment of the
embedded codes used by Burrows to disambiguate word-senses.
One possibility might be to regard these all as
instances of a special category of token, say
<q>homograph</q> or <q>ambiguity</q>, and to tag each with a
tag such as <tag>h</tag>, supplying a code derived from that
assigned by Burrows as the value of an attribute called, say,
<att>resolution</att>. The other is to encode the resolution of
the ambiguity directly, using the methods currently being
worked on by the Linguistic Analysis workgroup of the TEI.
The former requires an extension to the TEI Guidelines, while
the latter introduces some conceptual difficulties, since (for
example), nouns will only be tagged as such when they happen
to be confusible with verbs, and, moreover, the part of
speech analysis adequate to Burrows' purposes falls rather
short of the full formal rigour of that currently proposed by
the Linguistic Analysis workgroup.
<p>The method proposed here inclines to the second alternative.
The word class codes are translated into entity references,
made up by concatenating the numeric codes used with the
letter <q>H</q> (for homograph). A set of entity declarations
for each code used in a given text is generated as part of the
DTD subset prefixed to each text: this can be edited by its
user simply to suppress the word class codes or to replace
them with an arbitrary expansion in a given run. That
expansion might be, for example <q>[noun]</q> for a simple
concordance run, or the full feature structure syntax
proposed by the TEI Work Group.
<p>The following table summarises the word class codes used by
Burrows.
<gl>
<gt>$0$
<gd>Noun (proper or common), nominal sense
<gt>$1$
<gd>verb, verbal sense
<gt>$2$
<gd>adjective, prenominal sense
<gt>$3$
<gd>conjunction, conjunctional function
<gt>$4$
<gd>preposition, prepositional phrase
<gt>$5$
<gd>adverb and anophoric particle, verbal particle
<gt>$6$
<gd>pronoun (demonstrative, posessive, relative or
interrogative)
<gt>$7$
<gd>ejaculation
<gt>$8$
<gd>idiomatic phrase or collocation
<gt>$9$
<gd>infinitive particle or <q>mixed category</q>
</gl>
<p>
Word class codes consist of one or two numbers from the above list; if
there are two, they are separated by a sharp sign (replaced by a dot
when forming the entity name). When a numeric code
contains a second, modifying, number it
sometimes has the second sense given in the list above. In
the case of simple word sense ambiguation however, such as
the two senses of <q>ball</q> as a spherical object and a
dance, the second number is chosen arbitrarily. In such cases, recourse
to the supplied lists of distinguished homographs is necessary
to determine whether <q>ball&amp.H1.1</q> is the dance or the object.
</body>
<!>
</gdoc>
