(define-module (hikizan services shell)
  #:use-module (gnu services)
  #:use-module (gnu home services shells)
  #:use-module (guix gexp)
  #:export (hikizan-shell-services))

(define hikizan-shell-services
  (list
   (service home-bash-service-type
	    (home-bash-configuration
	     (guix-defaults? #f)
	     (aliases '(("grep" . "grep --color=auto")
			("ll" . "ls -l")
			("ls" . "ls -p --color=auto")))
	     (bashrc (list (local-file "../files/bash/.bashrc" "bashrc")))
	     (bash-profile (list (local-file "../files/bash/.bash_profile" "bash_profile")))))))
