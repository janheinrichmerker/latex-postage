.DEFAULT_GOAL := install
PACKAGE = postage

texlive-update:
	tlmgr update --all

dependencies-install: texlive-update
	tlmgr update --all
	tlmgr install latex 

install: dependencies-install
	latexmk -outdir=$(PACKAGE) $(PACKAGE).dtx -pdf
	cp $(PACKAGE)/$(PACKAGE).sty $(PACKAGE).sty
	cp $(PACKAGE).dtx $(PACKAGE)/$(PACKAGE).dtx

ctan: install
	zip $(PACKAGE) $(PACKAGE)/README.md $(PACKAGE)/LICENSE.txt $(PACKAGE)/$(PACKAGE).dtx $(PACKAGE)/mluexercise.ins $(PACKAGE)/$(PACKAGE).pdf