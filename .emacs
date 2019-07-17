; Remove menu-bar
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

;; MELPA
(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("elpa" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/"))
(package-initialize)

(setq package-selected-packages '(zoom alchemist ansi bundler cargo company deadgrep flycheck flycheck-css-colorguard flycheck-dialyzer flycheck-elixir flycheck-elm flycheck-golangci-lint flycheck-haskell flycheck-ocaml flycheck-rust flymake-ruby fold-this fontawesome fzf go-guru go-mode haml-mode haskell-mode inf-ruby json-mode json-reformat racer rbenv rspec-mode rust-mode rust-playground sass-mode smex web-mode xterm-color yard-mode zerodark-theme))

(package-install-selected-packages)

;; Window Management
(zoom-mode)
(global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1)))

;; Set backup directory
(setq backup-directory-alist `(("." . "~/.emacs_backups")))

;; Zero Dark custom mode-line
(zerodark-setup-modeline-format)

;; Define TAB size
(setq default-tab-width 2)

;; Fira code
;; Font
(set-frame-font "Fira Mono")
(add-to-list 'default-frame-alist '(font . "Fira Mono"))
;; This works when using emacs --daemon + emacsclient
(add-hook 'after-make-frame-functions (lambda (frame) (set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")))
;; This works when using emacs without server/client
(set-fontset-font t '(#Xe100 . #Xe16f) "Fira Code Symbol")
;; I haven't found one statement that makes both of the above situations work, so I use both for now

(defconst fira-code-font-lock-keywords-alist
  (mapcar (lambda (regex-char-pair)
            `(,(car regex-char-pair)
              (0 (prog1 ()
                   (compose-region (match-beginning 1)
                                   (match-end 1)
                                   ;; The first argument to concat is a string containing a literal tab
                                   ,(concat "	" (list (decode-char 'ucs (cadr regex-char-pair)))))))))
          '(("\\(www\\)"                   #Xe100)
            ("[^/]\\(\\*\\*\\)[^/]"        #Xe101)
            ("\\(\\*\\*\\*\\)"             #Xe102)
            ("\\(\\*\\*/\\)"               #Xe103)
            ("\\(\\*>\\)"                  #Xe104)
            ("[^*]\\(\\*/\\)"              #Xe105)
            ("\\(\\\\\\\\\\)"              #Xe106)
            ("\\(\\\\\\\\\\\\\\)"          #Xe107)
            ("\\({-\\)"                    #Xe108)
            ("\\(\\[\\]\\)"                #Xe109)
            ("\\(::\\)"                    #Xe10a)
            ("\\(:::\\)"                   #Xe10b)
            ("[^=]\\(:=\\)"                #Xe10c)
            ("\\(!!\\)"                    #Xe10d)
            ("\\(!=\\)"                    #Xe10e)
            ("\\(!==\\)"                   #Xe10f)
            ("\\(-}\\)"                    #Xe110)
            ("\\(--\\)"                    #Xe111)
            ("\\(---\\)"                   #Xe112)
            ("\\(-->\\)"                   #Xe113)
            ("[^-]\\(->\\)"                #Xe114)
            ("\\(->>\\)"                   #Xe115)
            ("\\(-<\\)"                    #Xe116)
            ("\\(-<<\\)"                   #Xe117)
            ("\\(-~\\)"                    #Xe118)
            ("\\(#{\\)"                    #Xe119)
            ("\\(#\\[\\)"                  #Xe11a)
            ("\\(##\\)"                    #Xe11b)
            ("\\(###\\)"                   #Xe11c)
            ("\\(####\\)"                  #Xe11d)
            ("\\(#(\\)"                    #Xe11e)
            ("\\(#\\?\\)"                  #Xe11f)
            ("\\(#_\\)"                    #Xe120)
            ("\\(#_(\\)"                   #Xe121)
            ("\\(\\.-\\)"                  #Xe122)
            ("\\(\\.=\\)"                  #Xe123)
            ("\\(\\.\\.\\)"                #Xe124)
            ("\\(\\.\\.<\\)"               #Xe125)
            ("\\(\\.\\.\\.\\)"             #Xe126)
            ("\\(\\?=\\)"                  #Xe127)
            ("\\(\\?\\?\\)"                #Xe128)
            ("\\(;;\\)"                    #Xe129)
            ("\\(/\\*\\)"                  #Xe12a)
            ("\\(/\\*\\*\\)"               #Xe12b)
            ("\\(/=\\)"                    #Xe12c)
            ("\\(/==\\)"                   #Xe12d)
            ("\\(/>\\)"                    #Xe12e)
            ("\\(//\\)"                    #Xe12f)
            ("\\(///\\)"                   #Xe130)
            ("\\(&&\\)"                    #Xe131)
            ("\\(||\\)"                    #Xe132)
            ("\\(||=\\)"                   #Xe133)
            ("[^|]\\(|=\\)"                #Xe134)
            ("\\(|>\\)"                    #Xe135)
            ("\\(\\^=\\)"                  #Xe136)
            ("\\(\\$>\\)"                  #Xe137)
            ("\\(\\+\\+\\)"                #Xe138)
            ("\\(\\+\\+\\+\\)"             #Xe139)
            ("\\(\\+>\\)"                  #Xe13a)
            ("\\(=:=\\)"                   #Xe13b)
            ("[^!/]\\(==\\)[^>]"           #Xe13c)
            ("\\(===\\)"                   #Xe13d)
            ("\\(==>\\)"                   #Xe13e)
            ("[^=]\\(=>\\)"                #Xe13f)
            ("\\(=>>\\)"                   #Xe140)
            ("\\(<=\\)"                    #Xe141)
            ("\\(=<<\\)"                   #Xe142)
            ("\\(=/=\\)"                   #Xe143)
            ("\\(>-\\)"                    #Xe144)
            ("\\(>=\\)"                    #Xe145)
            ("\\(>=>\\)"                   #Xe146)
            ("[^-=]\\(>>\\)"               #Xe147)
            ("\\(>>-\\)"                   #Xe148)
            ("\\(>>=\\)"                   #Xe149)
            ("\\(>>>\\)"                   #Xe14a)
            ("\\(<\\*\\)"                  #Xe14b)
            ("\\(<\\*>\\)"                 #Xe14c)
            ("\\(<|\\)"                    #Xe14d)
            ("\\(<|>\\)"                   #Xe14e)
            ("\\(<\\$\\)"                  #Xe14f)
            ("\\(<\\$>\\)"                 #Xe150)
            ("\\(<!--\\)"                  #Xe151)
            ("\\(<-\\)"                    #Xe152)
            ("\\(<--\\)"                   #Xe153)
            ("\\(<->\\)"                   #Xe154)
            ("\\(<\\+\\)"                  #Xe155)
            ("\\(<\\+>\\)"                 #Xe156)
            ("\\(<=\\)"                    #Xe157)
            ("\\(<==\\)"                   #Xe158)
            ("\\(<=>\\)"                   #Xe159)
            ("\\(<=<\\)"                   #Xe15a)
            ("\\(<>\\)"                    #Xe15b)
            ("[^-=]\\(<<\\)"               #Xe15c)
            ("\\(<<-\\)"                   #Xe15d)
            ("\\(<<=\\)"                   #Xe15e)
            ("\\(<<<\\)"                   #Xe15f)
            ("\\(<~\\)"                    #Xe160)
            ("\\(<~~\\)"                   #Xe161)
            ("\\(</\\)"                    #Xe162)
            ("\\(</>\\)"                   #Xe163)
            ("\\(~@\\)"                    #Xe164)
            ("\\(~-\\)"                    #Xe165)
            ("\\(~=\\)"                    #Xe166)
            ("\\(~>\\)"                    #Xe167)
            ("[^<]\\(~~\\)"                #Xe168)
            ("\\(~~>\\)"                   #Xe169)
            ("\\(%%\\)"                    #Xe16a)
            ;;("\\(x\\)"                     #Xe16b)
            ("[^:=]\\(:\\)[^:=]"           #Xe16c)
            ("[^\\+<>]\\(\\+\\)[^\\+<>]"   #Xe16d)
            ("[^\\*/<>]\\(\\*\\)[^\\*/<>]" #Xe16f))))

(defun add-fira-code-symbol-keywords ()
  "Add fira code ligatures."
  (font-lock-add-keywords nil fira-code-font-lock-keywords-alist))

(add-hook 'prog-mode-hook
          #'add-fira-code-symbol-keywords)

;; Comment/Uncomment key bindings
(global-set-key (kbd "C-c c") 'comment-or-uncomment-region)
(defadvice comment-or-uncomment-region (before slick-comment activate compile)
  "When called interactively with no active region, comment a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
	   (line-beginning-position 2)))))

;;================================================================
;;  Plugin changes
;;================================================================
(require 'ido-vertical-mode)
(ido-vertical-mode 1)
;; Magit Call (magit)
(global-set-key (kbd "C-c g") 'magit-status)

;; Company (Code completion)
(require 'company)
;; Company Complete binding
(add-hook 'after-init-hook 'global-company-mode)
(global-set-key (kbd "C-c TAB") 'company-complete)

;; Flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; FoldThis
(global-set-key (kbd "C-c f") 'fold-this)

;; M-x improvement
(global-set-key (kbd "M-x") 'smex)

;; ;; Erlang
;; (setq load-path (cons "/home/bastien/erlang/versions/19.2/lib/tools-2.9/emacs" load-path))
;; (setq erlang-root-dir "/home/bastien/erlang/versions/19.2")
;; (setq exec-path (cons "/home/bastien/erlang/versions/19.2/bin" exec-path))
;; (setq erlang-man-root-dir "/home/bastien/erlang/versions/19.2/man")
;; (require 'erlang-start)

;; (require 'flycheck)
;; (flycheck-define-checker erlang-otp
;;   "An Erlang syntax checker using the Erlang interpreter."
;;   :command ("erlc" "-o" temporary-directory "-Wall"
;; 	    "-I" "../include" "-I" "../../include"
;; 	    "-I" "../../../"
;; 	    "-I" "../_build/default/lib/" source)
;;   :error-patterns
;;   ((warning line-start (file-name) ":" line ": Warning:" (message) line-end)
;;    (error line-start (file-name) ":" line ": " (message) line-end))
;;   :modes (erlang-mode))
;; (add-hook 'erlang-mode-hook
;;           (lambda ()
;;             (flycheck-select-checker 'erlang-otp)
;;             (flycheck-mode)))
;; (push "~/.emacs.d/distel/elisp/" load-path)
;; (require 'distel)
;; (distel-setup)
;; (push "~/.emacs.d/distel-completion/" load-path)
;; (require 'company-distel)
;; (with-eval-after-load 'company
;;   (add-to-list 'company-backends 'company-distel))
;; (add-hook 'erlang-mode-hook
;;           (lambda ()
;;             (setq company-backends '(company-distel))))

(require 'ansi-color)
;; (defun colorize-compilation-buffer ()
;;   (let ((inhibit-read-only t))
;;     (ansi-color-apply-on-region (point-min) (point-max))))
;; (add-hook 'compilation-filter-hook 'colorize-compilation-buffer)
(eval-after-load 'shell
  '(progn
     (autoload 'ansi-color-for-comint-mode-on "ansi-color" nil t)
     (add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on t)
     t))

;; ;;================================================================
;; ;; GDScript (Godot)
;; ;;================================================================
;; (add-to-list 'load-path "~/.emacs.d/godot-gdscript/")
;; (require 'godot-gdscript)
;; (require 'company-godot-gdscript)
;; (eval-after-load "company"
;;   '(progn
;;      (add-to-list 'company-backends 'company-godot-gdscript)))
;; (add-hook 'godot-gdscript-mode-hook 'company-mode)

;;================================================================
;; Golang
;;================================================================
;; Define function to call when go-mode loads
(defun my-go-mode-hook ()
  "Define GO mode hook that gofmt and allow compile."
  (add-hook 'before-save-hook 'gofmt-before-save) ; gofmt before every save
  (if (not (string-match "go" compile-command))   ; set compile command default
      (set (make-local-variable 'compile-command)
           "go build -v; go test -v; go vet"))

  ;; guru settings
  (go-guru-hl-identifier-mode)                    ; highlight identifiers

  ;; Key bindings specific to go-mode
  (local-set-key (kbd "M-.") 'godef-jump)         ; Go to definition
  (local-set-key (kbd "M-*") 'pop-tag-mark)       ; Return from whence you came
  (local-set-key (kbd "M-p") 'compile)            ; Invoke compiler
  (local-set-key (kbd "M-P") 'recompile)          ; Redo most recent compile cmd
  (local-set-key (kbd "M-]") 'next-error)         ; Go to next error (or msg)
  (local-set-key (kbd "M-[") 'previous-error))    ; Go to previous error or msg

;; Connect go-mode-hook with the function we just defined
(add-hook 'go-mode-hook 'my-go-mode-hook)
;; If the go-guru.el file is in the load path, this will load it.
(require 'go-guru)
(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-env "GOPATH")

;; ===============================================================
;; Elixir
;; ===============================================================

(require 'flycheck-mix)
(flycheck-mix-setup)
;; (add-hook 'elixir-mode-hook
;;           (lambda () (add-hook 'before-save-hook 'elixir-format nil t)))

;; ;;================================================================
;; ;; Rails
;; ;;================================================================

;;--- Ruby vanilla mode
;;--- Ruby plugins
;; Use good ruby version (rbenv-mode)
(require 'rbenv)
(global-rbenv-mode)
;; Bind inf-ruby to key (inf-ruby)
(global-set-key (kbd "C-c r q") 'inf-ruby-console-auto)
;; use pry with rspec mode (C-x C-q)
(add-hook 'after-init-hook 'inf-ruby-switch-setup)
;; Activate yard in rb files
(add-hook 'ruby-mode-hook 'yard-mode)
;; ;;--- Rails plugins
;; ;; Projectile for rails
;; (add-hook 'ruby-mode-hook 'projectile-mode)
;; (add-hook 'projectile-mode-hook 'projectile-rails-mode)
(setenv "CMS_API_HOST" "https://api.wttj-new.test")
(setenv "CMS_API_ROOT_PATH" "/api/v1/internal")
(setenv "CMS_API_SSL_SELF_SIGNED" "true")
(setenv "JWT_SECRET" "secret")

(setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
(setq racer-rust-src-path "/home/bastien/dev/rust/src") ;; Rust source code PATH

(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)
(add-hook 'racer-mode-hook #'company-mode)(add-hook 'racer-mode-hook #'company-mode)

(add-hook 'flycheck-mode-hook #'flycheck-rust-setup)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(indent-tabs-mode nil)
 '(package-selected-packages
   (quote
    (zoom alchemist ansi bundler cargo company deadgrep flycheck flycheck-css-colorguard flycheck-dialyzer flycheck-elixir flycheck-elm flycheck-golangci-lint flycheck-haskell flycheck-ocaml flycheck-rust flymake-ruby fold-this fontawesome fzf go-guru go-mode haml-mode haskell-mode inf-ruby json-mode json-reformat racer rbenv rspec-mode rust-mode rust-playground sass-mode smex web-mode xterm-color yard-mode zerodark-theme)))
 '(standard-indent 2)
 '(tab-always-indent t)
 '(tab-width 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
