;; Set the package installation directory so that packages aren't stored in the
;; ~/.emacs.d/elpa path
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; Initialize the package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

;; Install dependencies
(package-install 'htmlize)

;; Load the publishing system
(require 'ox-publish)

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "money-site"
	     :recursive t
	     :base-directory "./money"
	     :publishing-directory "./public"
	     :publishing-function 'org-html-publish-to-html
	     :with-author nil
	     :with-title nil
	     :with-creator nil
	     :with-toc nil
	     :html-validation-link nil
	     :time-stamp-file nil
	     :section-numbers nil)))

;; Generate the site output
(org-publish-all t)
