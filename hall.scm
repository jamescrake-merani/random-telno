(hall-description
  (name "random-phone-number")
  (prefix "")
  (version "0.1")
  (author "James Crake-Merani")
  (copyright (2022))
  (synopsis "")
  (description "")
  (home-page "")
  (license gpl3+)
  (dependencies `())
  (skip ())
  (files (libraries
           ((directory
              "random-phone-number"
              ((scheme-file "common")))))
         (tests ((directory "tests" ())))
         (programs
           ((directory
              "scripts"
              ((in-file "random-phone-number")))))
         (documentation
           ((org-file "README")
            (symlink "README" "README.org")
            (text-file "COPYING")))
         (infrastructure
           ((scheme-file "guix")
            (text-file ".gitignore")
            (scheme-file "hall")))))
