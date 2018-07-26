ECHO=
LOCAL=`pwd`
SCHEMA=/home/lou/Public/WG1/distantreading.github.io/Schema/eltec-1.rng
CORPUS=$(LOCAL)/Eltec
CORPUSHDR=/home/lou/Public/corpHeaderStart.txt
REPORTER=/home/lou/Public/WG1/Sampler/reporter.xsl
CONVERTOR=../vwwp2eltec.xsl

CURRENT=`pwd`

convert:
	cd $(LOCAL)/Orig; for f in VAB*.xml ; do \
	echo $$f; \
	saxon $$f $(CONVERTOR) -o:../Eltec/$$f.eltec ;\
	done; cd $(CURRENT);

validate:
	cd $(CORPUS); for f in *.eltec ; do \
		echo $$f; \
		jing  $(SCHEMA) \
		$$f ; done; cd $(CURRENT);

driver:
	echo rebuild driver file
	cp $(CORPUSHDR) $(CORPUS)_driver.tei;\
		for f in $(CORPUS)/*.eltec ; do \
		echo "<xi:include href='$$f'/>" >> $(CORPUS)_driver.tei; \
	done; echo "</teiCorpus>" >> $(CORPUS)_driver.tei

schema: 
	echo rebuild schemas from ODD
	cd /home/lou/Public/WG1/
	teitoodd --localsource=/home/lou/Public/TEI/P5/p5subset.xml eltec.xml eltec-compiled.xml
	teitorelaxng  --localsource=/home/lou/Public/TEI/P5/p5subset.xml eltec-0.xml distantreading.github.io/Schema/eltec-0.rng
	teitorelaxng  --localsource=/home/lou/Public/TEI/P5/p5subset.xml eltec-1.xml distantreading.github.io/Schema/eltec-1.rng
	teitohtml --odd --localsource=/home/lou/Public/TEI/P5/p5subset.xml eltec-0.xml distantreading.github.io/Schema/eltec-0.html
	teitohtml --odd --localsource=/home/lou/Public/TEI/P5/p5subset.xml eltec-1.xml distantreading.github.io/Schema/eltec-1.html
	cd $(CURRENT)
report:
	echo report on corpus balance
	saxon -xi $(CORPUS)_driver.tei $(REPORTER) -o:balanceReport.html
