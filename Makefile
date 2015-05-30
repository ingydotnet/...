help:
	@echo 'Targets: doc, test'

doc: ReadMe.pod

ReadMe.pod: doc/DotDotDot.swim
	swim --to=pod --complete --wrap $< > $@

test:
	t=1; \
	  for n in t/*.*sh; do \
	      echo "Running $$n"; $$n || exit $$t; t=$$(($$t + 1)); \
		/bin/echo -e "\e[32m▀▀▀▀▀▀▀▀ Passed: $$n ▀▀▀▀▀▀▀\e[0m"; \
	      done
