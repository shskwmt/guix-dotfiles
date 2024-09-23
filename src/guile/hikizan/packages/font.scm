(define-module (hikizan packages font)
  #:use-module (gnu packages)
  #:export (font-packages))

(define font-packages
  (map specification->package
       (list "fontconfig"
	     "font-adobe-source-han-sans"
	     "font-google-noto"
	     "font-google-noto-sans-cjk")))
