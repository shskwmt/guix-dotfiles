(define-module (hikizan packages base)
  #:use-module (gnu packages)
  #:export (base-packages))

(define base-packages
  (map specification->package
       (list "make"
	     "curl"
	     "jq"
	     "ripgrep"
	     "openssh"
	     "git"
	     "docker-cli"
	     "docker"
	     "google-chrome-stable")))
