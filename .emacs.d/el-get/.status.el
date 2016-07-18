((ag status "installed" recipe
     (:name ag :description "A simple ag frontend, loosely based on ack-and-half.el." :type github :pkgname "Wilfred/ag.el" :depends
	    (dash s)))
 (bundler status "installed" recipe
	  (:name bundler :description "Interact with Bundler from Emacs" :website "https://github.com/tobiassvn/bundler.el" :type github :pkgname "tobiassvn/bundler.el"))
 (cl-lib status "installed" recipe
	 (:name cl-lib :builtin "24.3" :type elpa :description "Properly prefixed CL functions and macros" :url "http://elpa.gnu.org/packages/cl-lib.html"))
 (coffee-mode status "installed" recipe
	      (:name coffee-mode :website "http://ozmm.org/posts/coffee_mode.html" :description "Emacs Major Mode for CoffeeScript" :type github :pkgname "defunkt/coffee-mode" :features coffee-mode :prepare
		     (progn
		       (add-to-list 'auto-mode-alist
				    '("\\.coffee$" . coffee-mode))
		       (add-to-list 'auto-mode-alist
				    '("Cakefile" . coffee-mode)))))
 (company-mode status "installed" recipe
	       (:name company-mode :website "http://company-mode.github.io/" :description "Modular in-buffer completion framework for Emacs" :type github :pkgname "company-mode/company-mode"))
 (company-web status "installed" recipe
	      (:name company-web :description "Company-web is an alternative emacs plugin for autocompletion in html-mode, web-mode, jade-mode, slim-mode and use data of ac-html. It uses company-mode." :website "https://github.com/osv/company-web" :type github :pkgname "osv/company-web"))
 (dash status "installed" recipe
       (:name dash :description "A modern list api for Emacs. No 'cl required." :type github :pkgname "magnars/dash.el"))
 (eimp status "installed" recipe
       (:name eimp :description "Emacs Image Manipulation Package" :website "https://mph-emacs-pkgs.alioth.debian.org/EimpEl.html" :type http :url "https://alioth.debian.org/scm/viewvc.php/*checkout*/mph-emacs-pkgs/elisp/eimp.el?root=mph-emacs-pkgs" :localname "eimp.el"))
 (eiv status "installed" recipe
      (:name eiv :auto-generated t :type emacswiki :description "emacs image viewer" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/eiv.el"))
 (el-get status "installed" recipe
	 (:name el-get :website "https://github.com/dimitri/el-get#readme" :description "Manage the external elisp bits and pieces you depend upon." :type github :branch "master" :pkgname "dimitri/el-get" :info "." :compile
		("el-get.*\\.el$" "methods/")
		:features el-get :post-init
		(when
		    (memq 'el-get
			  (bound-and-true-p package-activated-list))
		  (message "Deleting melpa bootstrap el-get")
		  (unless package--initialized
		    (package-initialize t))
		  (when
		      (package-installed-p 'el-get)
		    (let
			((feats
			  (delete-dups
			   (el-get-package-features
			    (el-get-elpa-package-directory 'el-get)))))
		      (el-get-elpa-delete-package 'el-get)
		      (dolist
			  (feat feats)
			(unload-feature feat t))))
		  (require 'el-get))))
 (epl status "installed" recipe
      (:name epl :description "EPL provides a convenient high-level API for various package.el versions, and aims to overcome its most striking idiocies." :type github :pkgname "cask/epl"))
 (erlang-mode status "installed" recipe
	      (:name erlang-mode :description "Major mode for editing and running Erlang" :type http :url "http://www.erlang.org/download/contrib/erlang.el" :prepare
		     (progn
		       (add-to-list 'auto-mode-alist
				    '("\\.erl$" . erlang-mode)))))
 (erlware-mode status "installed" recipe
	       (:name erlware-mode :description "Major modes for editing and running Erlang" :type builtin :depends erlang-mode))
 (f status "installed" recipe
    (:name f :website "https://github.com/rejeep/f.el" :description "Modern API for working with files and directories in Emacs" :depends
	   (s dash)
	   :type github :pkgname "rejeep/f.el"))
 (flx status "installed" recipe
      (:name flx :description "Fuzzy matching with good sorting in ido" :type github :pkgname "lewang/flx"))
 (flymake-easy status "installed" recipe
	       (:name flymake-easy :type github :description "Helpers for easily building flymake checkers" :pkgname "purcell/flymake-easy" :website "http://github.com/purcell/flymake-easy"))
 (flymake-ruby status "installed" recipe
	       (:name flymake-ruby :type github :description "A flymake handler for ruby-mode files" :pkgname "purcell/flymake-ruby" :website "http://github.com/purcell/flymake-ruby" :depends
		      (flymake-easy)
		      :features flymake-ruby :post-init
		      (add-hook 'ruby-mode-hook 'flymake-ruby-load)))
 (goto-chg status "installed" recipe
	   (:name goto-chg :description "Goto the point of the most recent edit in the buffer." :type emacswiki :features goto-chg))
 (haml-mode status "installed" recipe
	    (:name haml-mode :description "Major mode for editing Haml files" :type github :pkgname "nex3/haml-mode"))
 (hide-comnt status "installed" recipe
	     (:type github :pkgname "emacsmirror/hide-comnt" :name hide-comnt :description "Hide/show comments in code." :type emacsmirror))
 (ido-better-flex status "installed" recipe
		  (:name ido-better-flex :description "A better flex (fuzzy) algorithm for Ido" :type github :pkgname "vic/ido-better-flex"))
 (ido-vertical-mode status "installed" recipe
		    (:name ido-vertical-mode :type github :pkgname "rson/ido-vertical-mode.el" :description "makes ido-mode display vertically"))
 (image+ status "installed" recipe
	 (:name image+ :website "https://github.com/mhayashi1120/Emacs-imagex" :description "Image manipulate extensions for Emacs" :type github :pkgname "mhayashi1120/Emacs-imagex"))
 (image-dired+ status "installed" recipe
	       (:name image-dired+ :website "https://github.com/mhayashi1120/Emacs-image-diredx" :description "Image-dired extensions" :type github :pkgname "mhayashi1120/Emacs-image-diredx"))
 (inf-mongo status "installed" recipe
	    (:name inf-mongo :description "Run a MongoDB shell process in a buffer." :type github :pkgname "tobiassvn/inf-mongo"))
 (inf-ruby status "installed" recipe
	   (:name inf-ruby :description "Inferior Ruby Mode - ruby process in a buffer." :type github :pkgname "nonsequitur/inf-ruby"))
 (inflections status "installed" recipe
	      (:name inflections :description "Convert english words between singular and plural" :type elpa))
 (markdown-mode status "installed" recipe
		(:name markdown-mode :description "Major mode to edit Markdown files in Emacs" :website "http://jblevins.org/projects/markdown-mode/" :type git :url "git://jblevins.org/git/markdown-mode.git" :prepare
		       (add-to-list 'auto-mode-alist
				    '("\\.\\(md\\|mdown\\|markdown\\)\\'" . markdown-mode))))
 (package status "installed" recipe
	  (:name package :description "ELPA implementation (\"package.el\") from Emacs 24" :builtin "24" :type http :url "http://repo.or.cz/w/emacs.git/blob_plain/ba08b24186711eaeb3748f3d1f23e2c2d9ed0d09:/lisp/emacs-lisp/package.el" :shallow nil :features package :post-init
		 (progn
		   (let
		       ((old-package-user-dir
			 (expand-file-name
			  (convert-standard-filename
			   (concat
			    (file-name-as-directory default-directory)
			    "elpa")))))
		     (when
			 (file-directory-p old-package-user-dir)
		       (add-to-list 'package-directory-list old-package-user-dir)))
		   (setq package-archives
			 (bound-and-true-p package-archives))
		   (mapc
		    (lambda
		      (pa)
		      (add-to-list 'package-archives pa 'append))
		    '(("ELPA" . "http://tromey.com/elpa/")
		      ("melpa" . "http://melpa.org/packages/")
		      ("gnu" . "http://elpa.gnu.org/packages/")
		      ("marmalade" . "http://marmalade-repo.org/packages/")
		      ("SC" . "http://joseito.republika.pl/sunrise-commander/"))))))
 (pkg-info status "installed" recipe
	   (:name pkg-info :description "Provide information about Emacs packages." :type github :pkgname "lunaryorn/pkg-info.el" :depends
		  (dash epl)))
 (projectile status "installed" recipe
	     (:name projectile :description "Project navigation and management library for Emacs." :type github :pkgname "bbatsov/projectile" :depends
		    (dash s f pkg-info)))
 (projectile-rails status "installed" recipe
		   (:name projectile-rails :type github :pkgname "asok/projectile-rails" :description "Minor mode for Rails projects based on projectile-mode" :depends
			  (projectile inflections inf-ruby f rake)))
 (rake status "installed" recipe
       (:name rake :description "Run rake commands" :type github :pkgname "asok/rake" :depends
	      (f dash cl-lib)))
 (rbenv status "installed" recipe
	(:name rbenv :description "Emacs integration for rbenv" :type github :pkgname "senny/rbenv.el" :compile "rbenv.el"))
 (rspec-mode status "installed" recipe
	     (:name rspec-mode :description "Enhance ruby-mode for RSpec" :type github :pkgname "pezra/rspec-mode" :features rspec-mode))
 (s status "installed" recipe
    (:name s :description "The long lost Emacs string manipulation library." :type github :pkgname "magnars/s.el"))
 (scss-mode status "installed" recipe
	    (:name scss-mode :description "Major mode for editing SCSS files(http://sass-lang.com)" :type github :pkgname "antonj/scss-mode" :features scss-mode))
 (thumbs-xmas status "installed" recipe
	      (:name thumbs-xmas :auto-generated t :type emacswiki :description "Thumbnails previewer for images files" :website "https://raw.github.com/emacsmirror/emacswiki.org/master/thumbs-xmas.el"))
 (traverselisp status "installed" recipe
	       (:name traverselisp :auto-generated t :type emacswiki :description "walk through directories and perform actions on files." :website "https://raw.github.com/emacsmirror/emacswiki.org/master/traverselisp.el"))
 (undo-tree status "installed" recipe
	    (:name undo-tree :description "Treat undo history as a tree" :website "http://www.dr-qubit.org/emacs.php" :type git :url "http://www.dr-qubit.org/git/undo-tree.git/"))
 (web-mode status "installed" recipe
	   (:name web-mode :description "emacs major mode for editing PHP/JSP/ASP HTML templates (with embedded CSS and JS blocks)" :type github :pkgname "fxbois/web-mode"))
 (xterm-color status "installed" recipe
	      (:name xterm-color :type github :pkgname "atomontage/xterm-color" :description "ANSI & xterm-256 color text property translator for Emacs"))
 (yaml-mode status "installed" recipe
	    (:name yaml-mode :description "Simple major mode to edit YAML file for emacs" :type github :pkgname "yoshiki/yaml-mode"))
 (yard-mode status "installed" recipe
	    (:name yard-mode :description "Yet another Ruby Documentation mode" :type github :pkgname "pd/yard-mode.el")))
