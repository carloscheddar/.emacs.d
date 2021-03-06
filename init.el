(require 'package)

;;Add package repositories
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/")
    '("tromey" . "http://tromey.com/elpa/"))
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;;Add quack to scheme-mode
(require 'quack)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(quack-default-program "racket"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;Setup enhance ruby mode
(setq enh-ruby-program "~/.rvm/rubies/default/bin/ruby")
(require 'enh-ruby-mode)

;; Rake files are ruby, too, as are gemspecs, rackup files, etc.

(add-to-list 'auto-mode-alist '(".rb" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("\\.ru$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Capfile$" . enh-ruby-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile$" . enh-ruby-mode))

;;Add rhtml-mode to read html.erb files
(add-to-list 'load-path "~/.emacs.d/elpa/rhtml")
(require 'rhtml-mode)

;;Open .json files with json-mode
(add-to-list 'auto-mode-alist '(".json" . json-mode))

;;Add related css files like .scss to css-mode
(add-to-list 'auto-mode-alist '(".css" . css-mode))

;;Add powerline
;;Current colors to add to powerline.el: 
;;active1, inactive2 = #C64E3A; active2, inactive1 = #BFBFBF
(powerline-center-theme)

;;Add Parenthesis Highlight
(setq show-paren-style 'parenthesis)
(show-paren-mode)

;;Add a function to "Beautify" json files from http://irreal.org/blog/?p=354
(defun json-format ()
  (interactive)
  (save-excursion
    (shell-command-on-region (mark) (point) "python -m json.tool" (buffer-name) t)))

;; Added Goto-line short-cut key from http://www.stylesen.org/emacs_goto_line
(global-set-key "\C-l" 'goto-line)
