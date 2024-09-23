channels-lock.scm: channels.scm
	guix time-machine -C channels.scm -- describe -f channels > channels-lock.scm

target:
	mkdir -p target

target/guix-time-marker: target channels-lock.scm
	guix pull -C channels-lock.scm
	touch $@

GUIX=guix
GUIX_LOAD_PATH=-L src/guile
GUIX_SUBSTITUTES=--substitute-urls="https://substitutes.nonguix.org https://ci.guix.gnu.org"

.PHONY: clean
clean:
	rm -rf target

.PHONY: repl
repl:
	$(GUIX) repl $(GUIX_LOAD_PATH)

HOME_CONFIG_FILE=home-configuration.scm

.PHONY: home/container
home/container: target/guix-time-marker
	$(GUIX) home $(GUIX_LOAD_PATH) $(GUIX_SUBSTITUTES) container $(HOME_CONFIG_FILE)

.PHONY: home/reconfigure
home/reconfigure: target/guix-time-marker
	$(GUIX) home $(GUIX_LOAD_PATH) $(GUIX_SUBSTITUTES) reconfigure $(HOME_CONFIG_FILE)
