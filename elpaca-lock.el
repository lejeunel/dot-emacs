((annalist :source "elpaca-menu-lock-file" :recipe
	   (:package "annalist" :fetcher github :repo
		     "noctuid/annalist.el" :files
		     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		      "doc/*.texinfo" "lisp/*.el" "docs/dir"
		      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		      (:exclude ".dir-locals.el" "test.el" "tests.el"
				"*-test.el" "*-tests.el" "LICENSE"
				"README*" "*-pkg.el"))
		     :source "MELPA" :protocol https :inherit t :depth
		     treeless :ref
		     "e1ef5dad75fa502d761f70d9ddf1aeb1c423f41d"))
 (cond-let
   :source "elpaca-menu-lock-file" :recipe
   (:package "cond-let" :fetcher github :repo "tarsius/cond-let"
	     :files
	     ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
	      "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
	      "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
	      "docs/*.texinfo"
	      (:exclude ".dir-locals.el" "test.el" "tests.el"
			"*-test.el" "*-tests.el" "LICENSE" "README*"
			"*-pkg.el"))
	     :source "MELPA" :protocol https :inherit t :depth
	     treeless :ref "09ebf1caa81c99677ce74091a23b48a28d53bcd9"))
 (consult :source "elpaca-menu-lock-file" :recipe
	  (:package "consult" :repo "minad/consult" :fetcher github
		    :files
		    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		     "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		     "doc/*.texinfo" "lisp/*.el" "docs/dir"
		     "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		     (:exclude ".dir-locals.el" "test.el" "tests.el"
			       "*-test.el" "*-tests.el" "LICENSE"
			       "README*" "*-pkg.el"))
		    :source "MELPA" :protocol https :inherit t :depth
		    treeless :ref
		    "da62326326b9b121edb46b0f31adb2569e4e896a"))
 (dash :source "elpaca-menu-lock-file" :recipe
       (:package "dash" :fetcher github :repo "magnars/dash.el" :files
		 ("dash.el" "dash.texi") :source "MELPA" :protocol
		 https :inherit t :depth treeless :ref
		 "fb443e7a6e660ba849cafcd01021d9aac3ac6764"))
 (direnv :source "elpaca-menu-lock-file" :recipe
	 (:package "direnv" :fetcher github :repo
		   "wbolster/emacs-direnv" :files
		   ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		    "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		    "doc/*.texinfo" "lisp/*.el" "docs/dir"
		    "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		    (:exclude ".dir-locals.el" "test.el" "tests.el"
			      "*-test.el" "*-tests.el" "LICENSE"
			      "README*" "*-pkg.el"))
		   :source "MELPA" :protocol https :inherit t :depth
		   treeless :host github :ref
		   "c0bf3b81c7a97e2a0d06d05495e86848254fcc1f"))
 (doom-modeline :source "elpaca-menu-lock-file" :recipe
		(:package "doom-modeline" :repo
			  "seagle0128/doom-modeline" :fetcher github
			  :files
			  ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			   "*.texinfo" "doc/dir" "doc/*.info"
			   "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			   "docs/dir" "docs/*.info" "docs/*.texi"
			   "docs/*.texinfo"
			   (:exclude ".dir-locals.el" "test.el"
				     "tests.el" "*-test.el"
				     "*-tests.el" "LICENSE" "README*"
				     "*-pkg.el"))
			  :source "MELPA" :protocol https :inherit t
			  :depth treeless :ref
			  "20de9feaa0ba3cb498cb9b06de9877ab41928747"))
 (elisp-refs :source "elpaca-menu-lock-file" :recipe
	     (:package "elisp-refs" :repo "Wilfred/elisp-refs"
		       :fetcher github :files
		       (:defaults (:exclude "elisp-refs-bench.el"))
		       :source "MELPA" :protocol https :inherit t
		       :depth treeless :ref
		       "541a064c3ce27867872cf708354a65d83baf2a6d"))
 (elpaca :source
   "elpaca-menu-lock-file" :recipe
   (:source nil :protocol https :inherit ignore :depth 1 :repo
	    "https://github.com/progfolio/elpaca.git" :ref
	    "ba0d884338f2aef107602951671a67742b83c829" :files
	    (:defaults "elpaca-test.el" (:exclude "extensions"))
	    :build (:not elpaca--activate-package) :package "elpaca"))
 (elpaca-use-package :source "elpaca-menu-lock-file" :recipe
		     (:package "elpaca-use-package" :wait t :repo
			       "https://github.com/progfolio/elpaca.git"
			       :files
			       ("extensions/elpaca-use-package.el")
			       :main
			       "extensions/elpaca-use-package.el"
			       :build (:not elpaca--compile-info)
			       :source "Elpaca extensions" :protocol
			       https :inherit t :depth treeless :ref
			       "ba0d884338f2aef107602951671a67742b83c829"))
 (embark :source "elpaca-menu-lock-file" :recipe
	 (:package "embark" :repo "oantolin/embark" :fetcher github
		   :files ("embark.el" "embark-org.el" "embark.texi")
		   :source "MELPA" :protocol https :inherit t :depth
		   treeless :ref
		   "1371a1e33e3a3d96557beb28dccf1fa762f6ae22"))
 (embark-consult :source "elpaca-menu-lock-file" :recipe
		 (:package "embark-consult" :repo "oantolin/embark"
			   :fetcher github :files
			   ("embark-consult.el") :source "MELPA"
			   :protocol https :inherit t :depth treeless
			   :ref
			   "1371a1e33e3a3d96557beb28dccf1fa762f6ae22"))
 (evil :source "elpaca-menu-lock-file" :recipe
       (:package "evil" :repo "emacs-evil/evil" :fetcher github :files
		 (:defaults "doc/build/texinfo/evil.texi"
			    (:exclude "evil-test-helpers.el"))
		 :source "MELPA" :protocol https :inherit t :depth
		 treeless :ref
		 "b06f644bdb5b06c6ac46c11b0259f15ac9ffd5da"))
 (evil-collection :source "elpaca-menu-lock-file" :recipe
		  (:package "evil-collection" :fetcher github :repo
			    "emacs-evil/evil-collection" :files
			    (:defaults "modes") :source "MELPA"
			    :protocol https :inherit t :depth treeless
			    :ref
			    "bb5eb2ae1e77f87979571d4ad3357f38e932dfb5"))
 (f :source "elpaca-menu-lock-file" :recipe
    (:package "f" :fetcher github :repo "rejeep/f.el" :files
	      ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
	       "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
	       "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
	       "docs/*.texinfo"
	       (:exclude ".dir-locals.el" "test.el" "tests.el"
			 "*-test.el" "*-tests.el" "LICENSE" "README*"
			 "*-pkg.el"))
	      :source "MELPA" :protocol https :inherit t :depth
	      treeless :ref "931b6d0667fe03e7bf1c6c282d6d8d7006143c52"))
 (goto-chg :source "elpaca-menu-lock-file" :recipe
	   (:package "goto-chg" :repo "emacs-evil/goto-chg" :fetcher
		     github :files
		     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		      "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		      "doc/*.texinfo" "lisp/*.el" "docs/dir"
		      "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		      (:exclude ".dir-locals.el" "test.el" "tests.el"
				"*-test.el" "*-tests.el" "LICENSE"
				"README*" "*-pkg.el"))
		     :source "MELPA" :protocol https :inherit t :depth
		     treeless :ref
		     "72f556524b88e9d30dc7fc5b0dc32078c166fda7"))
 (helpful :source "elpaca-menu-lock-file" :recipe
	  (:package "helpful" :repo "Wilfred/helpful" :fetcher github
		    :files
		    ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		     "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		     "doc/*.texinfo" "lisp/*.el" "docs/dir"
		     "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		     (:exclude ".dir-locals.el" "test.el" "tests.el"
			       "*-test.el" "*-tests.el" "LICENSE"
			       "README*" "*-pkg.el"))
		    :source "MELPA" :protocol https :inherit t :depth
		    treeless :ref
		    "03756fa6ad4dcca5e0920622b1ee3f70abfc4e39"))
 (ht :source "elpaca-menu-lock-file" :recipe
     (:package "ht" :fetcher github :repo "Wilfred/ht.el" :files
	       ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
		"doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
		"lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
		"docs/*.texinfo"
		(:exclude ".dir-locals.el" "test.el" "tests.el"
			  "*-test.el" "*-tests.el" "LICENSE" "README*"
			  "*-pkg.el"))
	       :source "MELPA" :protocol https :inherit t :depth
	       treeless :ref
	       "1c49aad1c820c86f7ee35bf9fff8429502f60fef"))
 (llama :source "elpaca-menu-lock-file" :recipe
	(:package "llama" :fetcher github :repo "tarsius/llama" :files
		  ("llama.el" ".dir-locals.el") :source "MELPA"
		  :protocol https :inherit t :depth treeless :ref
		  "ec1d4ef02f5572fc5aff3f62d3e7ef791f444456"))
 (lsp-mode :source "elpaca-menu-lock-file" :recipe
	   (:package "lsp-mode" :repo "emacs-lsp/lsp-mode" :fetcher
		     github :files (:defaults "clients/*.*") :source
		     "MELPA" :protocol https :inherit t :depth
		     treeless :host github :ref
		     "514e256ab23f5e39fec98b56862fc49eab6e6510"))
 (lsp-pyright :source "elpaca-menu-lock-file" :recipe
	      (:package "lsp-pyright" :repo "emacs-lsp/lsp-pyright"
			:fetcher github :files
			("*.el" "*.el.in" "dir" "*.info" "*.texi"
			 "*.texinfo" "doc/dir" "doc/*.info"
			 "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			 "docs/dir" "docs/*.info" "docs/*.texi"
			 "docs/*.texinfo"
			 (:exclude ".dir-locals.el" "test.el"
				   "tests.el" "*-test.el" "*-tests.el"
				   "LICENSE" "README*" "*-pkg.el"))
			:source "MELPA" :protocol https :inherit t
			:depth treeless :host github :ref
			"3756ff971797ae04fc43ca29c66ba4d854eff038"))
 (lsp-ui :source "elpaca-menu-lock-file" :recipe
	 (:package "lsp-ui" :repo "emacs-lsp/lsp-ui" :fetcher github
		   :files (:defaults "lsp-ui-doc.html" "resources")
		   :source "MELPA" :protocol https :inherit t :depth
		   treeless :host github :ref
		   "8547cd6abf3b474b3111911bc8ee1452afdfec8f"))
 (lv :source "elpaca-menu-lock-file" :recipe
     (:package "lv" :repo "abo-abo/hydra" :fetcher github :files
	       ("lv.el") :source "MELPA" :protocol https :inherit t
	       :depth treeless :ref
	       "59a2a45a35027948476d1d7751b0f0215b1e61aa"))
 (magit :source "elpaca-menu-lock-file" :recipe
	(:package "magit" :fetcher github :repo "magit/magit" :files
		  ("lisp/magit*.el" "lisp/git-*.el" "docs/magit.texi"
		   "docs/AUTHORS.md" "LICENSE" ".dir-locals.el"
		   (:exclude "lisp/magit-section.el"))
		  :source "MELPA" :protocol https :inherit t :depth
		  treeless :ref
		  "0b0947114542b39aec45c4fc0ef5a3b8fbec2e84"))
 (magit-section :source "elpaca-menu-lock-file" :recipe
		(:package "magit-section" :fetcher github :repo
			  "magit/magit" :files
			  ("lisp/magit-section.el"
			   "docs/magit-section.texi"
			   "magit-section-pkg.el")
			  :source "MELPA" :protocol https :inherit t
			  :depth treeless :ref
			  "0b0947114542b39aec45c4fc0ef5a3b8fbec2e84"))
 (marginalia :source "elpaca-menu-lock-file" :recipe
	     (:package "marginalia" :repo "minad/marginalia" :fetcher
		       github :files
		       ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			"*.texinfo" "doc/dir" "doc/*.info"
			"doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			"docs/dir" "docs/*.info" "docs/*.texi"
			"docs/*.texinfo"
			(:exclude ".dir-locals.el" "test.el"
				  "tests.el" "*-test.el" "*-tests.el"
				  "LICENSE" "README*" "*-pkg.el"))
		       :source "MELPA" :protocol https :inherit t
		       :depth treeless :ref
		       "8a07e869577e0b8582db2528b08ec295d0405bb7"))
 (markdown-mode :source "elpaca-menu-lock-file" :recipe
		(:package "markdown-mode" :fetcher github :repo
			  "jrblevin/markdown-mode" :files
			  ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			   "*.texinfo" "doc/dir" "doc/*.info"
			   "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			   "docs/dir" "docs/*.info" "docs/*.texi"
			   "docs/*.texinfo"
			   (:exclude ".dir-locals.el" "test.el"
				     "tests.el" "*-test.el"
				     "*-tests.el" "LICENSE" "README*"
				     "*-pkg.el"))
			  :source "MELPA" :protocol https :inherit t
			  :depth treeless :ref
			  "b524618c3ed28906a7522482727f121428ce7e2e"))
 (modus-themes :source "elpaca-menu-lock-file" :recipe
	       (:package "modus-themes" :fetcher github :repo
			 "protesilaos/modus-themes" :files
			 ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			  "*.texinfo" "doc/dir" "doc/*.info"
			  "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			  "docs/dir" "docs/*.info" "docs/*.texi"
			  "docs/*.texinfo"
			  (:exclude ".dir-locals.el" "test.el"
				    "tests.el" "*-test.el"
				    "*-tests.el" "LICENSE" "README*"
				    "*-pkg.el"))
			 :source "MELPA" :protocol https :inherit t
			 :depth treeless :ref
			 "8b4e9d9ccd876b8477d41a9021d23a7afb771bec"))
 (nerd-icons :source "elpaca-menu-lock-file" :recipe
	     (:package "nerd-icons" :repo
		       "rainstormstudio/nerd-icons.el" :fetcher github
		       :files (:defaults "data") :source "MELPA"
		       :protocol https :inherit t :depth treeless :ref
		       "f262828f5f0e15d1d0189081bb30a67ddfaaf341"))
 (nerd-icons-completion :source "elpaca-menu-lock-file" :recipe
			(:package "nerd-icons-completion" :repo
				  "rainstormstudio/nerd-icons-completion"
				  :fetcher github :files
				  ("*.el" "*.el.in" "dir" "*.info"
				   "*.texi" "*.texinfo" "doc/dir"
				   "doc/*.info" "doc/*.texi"
				   "doc/*.texinfo" "lisp/*.el"
				   "docs/dir" "docs/*.info"
				   "docs/*.texi" "docs/*.texinfo"
				   (:exclude ".dir-locals.el"
					     "test.el" "tests.el"
					     "*-test.el" "*-tests.el"
					     "LICENSE" "README*"
					     "*-pkg.el"))
				  :source "MELPA" :protocol https
				  :inherit t :depth treeless :ref
				  "63a6b3f1eb98bb381c86a1658ac401c8967079b8"))
 (nerd-icons-dired :source "elpaca-menu-lock-file" :recipe
		   (:package "nerd-icons-dired" :repo
			     "rainstormstudio/nerd-icons-dired"
			     :fetcher github :files
			     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			      "*.texinfo" "doc/dir" "doc/*.info"
			      "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			      "docs/dir" "docs/*.info" "docs/*.texi"
			      "docs/*.texinfo"
			      (:exclude ".dir-locals.el" "test.el"
					"tests.el" "*-test.el"
					"*-tests.el" "LICENSE"
					"README*" "*-pkg.el"))
			     :source "MELPA" :protocol https :inherit
			     t :depth treeless :ref
			     "311d50d167a4432546d8c6a9fbc2a23754a3e1ea"))
 (orderless :source "elpaca-menu-lock-file" :recipe
	    (:package "orderless" :repo "oantolin/orderless" :fetcher
		      github :files
		      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		       "doc/*.texinfo" "lisp/*.el" "docs/dir"
		       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		       (:exclude ".dir-locals.el" "test.el" "tests.el"
				 "*-test.el" "*-tests.el" "LICENSE"
				 "README*" "*-pkg.el"))
		      :source "MELPA" :protocol https :inherit t
		      :depth treeless :ref
		      "9cf1c90e2501566ceba59f3220b4630995004efd"))
 (persp-projectile :source "elpaca-menu-lock-file" :recipe
		   (:package "persp-projectile" :repo
			     "bbatsov/persp-projectile" :fetcher
			     github :files
			     ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			      "*.texinfo" "doc/dir" "doc/*.info"
			      "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			      "docs/dir" "docs/*.info" "docs/*.texi"
			      "docs/*.texinfo"
			      (:exclude ".dir-locals.el" "test.el"
					"tests.el" "*-test.el"
					"*-tests.el" "LICENSE"
					"README*" "*-pkg.el"))
			     :source "MELPA" :protocol https :inherit
			     t :depth treeless :host github :ref
			     "4e374d7650c7e041df5af5ac280a44d4a4ec705a"))
 (perspective :source "elpaca-menu-lock-file" :recipe
	      (:package "perspective" :fetcher github :repo
			"nex3/perspective-el" :files
			("*.el" "*.el.in" "dir" "*.info" "*.texi"
			 "*.texinfo" "doc/dir" "doc/*.info"
			 "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			 "docs/dir" "docs/*.info" "docs/*.texi"
			 "docs/*.texinfo"
			 (:exclude ".dir-locals.el" "test.el"
				   "tests.el" "*-test.el" "*-tests.el"
				   "LICENSE" "README*" "*-pkg.el"))
			:source "MELPA" :protocol https :inherit t
			:depth treeless :host github :ref
			"bdd14b96faa54807a4f822d4ddea1680f1bfd6c7"))
 (projectile :source "elpaca-menu-lock-file" :recipe
	     (:package "projectile" :fetcher github :repo
		       "bbatsov/projectile" :files
		       ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			"*.texinfo" "doc/dir" "doc/*.info"
			"doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			"docs/dir" "docs/*.info" "docs/*.texi"
			"docs/*.texinfo"
			(:exclude ".dir-locals.el" "test.el"
				  "tests.el" "*-test.el" "*-tests.el"
				  "LICENSE" "README*" "*-pkg.el"))
		       :source "MELPA" :protocol https :inherit t
		       :depth treeless :ref
		       "9325c45e0fd96d5421e75ad901a91ee5353e10ad"))
 (queue :source "elpaca-menu-lock-file" :recipe
	(:package "queue" :repo
		  ("https://github.com/emacsmirror/gnu_elpa" . "queue")
		  :branch "externals/queue" :files
		  ("*" (:exclude ".git")) :source "GNU ELPA" :protocol
		  https :inherit t :depth treeless :ref
		  "f986fb68e75bdae951efb9e11a3012ab6bd408ee"))
 (s :source "elpaca-menu-lock-file" :recipe
    (:package "s" :fetcher github :repo "magnars/s.el" :files
	      ("*.el" "*.el.in" "dir" "*.info" "*.texi" "*.texinfo"
	       "doc/dir" "doc/*.info" "doc/*.texi" "doc/*.texinfo"
	       "lisp/*.el" "docs/dir" "docs/*.info" "docs/*.texi"
	       "docs/*.texinfo"
	       (:exclude ".dir-locals.el" "test.el" "tests.el"
			 "*-test.el" "*-tests.el" "LICENSE" "README*"
			 "*-pkg.el"))
	      :source "MELPA" :protocol https :inherit t :depth
	      treeless :ref "dda84d38fffdaf0c9b12837b504b402af910d01d"))
 (shrink-path :source "elpaca-menu-lock-file" :recipe
	      (:package "shrink-path" :fetcher gitlab :repo
			"bennya/shrink-path.el" :files
			("*.el" "*.el.in" "dir" "*.info" "*.texi"
			 "*.texinfo" "doc/dir" "doc/*.info"
			 "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			 "docs/dir" "docs/*.info" "docs/*.texi"
			 "docs/*.texinfo"
			 (:exclude ".dir-locals.el" "test.el"
				   "tests.el" "*-test.el" "*-tests.el"
				   "LICENSE" "README*" "*-pkg.el"))
			:source "MELPA" :protocol https :inherit t
			:depth treeless :ref
			"c14882c8599aec79a6e8ef2d06454254bb3e1e41"))
 (spinner :source "elpaca-menu-lock-file" :recipe
	  (:package "spinner" :repo
		    ("https://github.com/Malabarba/spinner.el"
		     . "spinner")
		    :files ("*" (:exclude ".git")) :source "GNU ELPA"
		    :protocol https :inherit t :depth treeless :ref
		    "d4647ae87fb0cd24bc9081a3d287c860ff061c21"))
 (transient :source "elpaca-menu-lock-file" :recipe
	    (:package "transient" :fetcher github :repo
		      "magit/transient" :files
		      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		       "doc/*.texinfo" "lisp/*.el" "docs/dir"
		       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		       (:exclude ".dir-locals.el" "test.el" "tests.el"
				 "*-test.el" "*-tests.el" "LICENSE"
				 "README*" "*-pkg.el"))
		      :source "MELPA" :protocol https :inherit t
		      :depth treeless :ref
		      "1d2710c7f8bba962bfbe6502d76158c2150840c1"))
 (treesit-auto :source "elpaca-menu-lock-file" :recipe
	       (:package "treesit-auto" :fetcher github :repo
			 "renzmann/treesit-auto" :files
			 ("*.el" "*.el.in" "dir" "*.info" "*.texi"
			  "*.texinfo" "doc/dir" "doc/*.info"
			  "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			  "docs/dir" "docs/*.info" "docs/*.texi"
			  "docs/*.texinfo"
			  (:exclude ".dir-locals.el" "test.el"
				    "tests.el" "*-test.el"
				    "*-tests.el" "LICENSE" "README*"
				    "*-pkg.el"))
			 :source "MELPA" :protocol https :inherit t
			 :depth treeless :ref
			 "016bd286a1ba4628f833a626f8b9d497882ecdf3"))
 (undo-tree :source "elpaca-menu-lock-file" :recipe
	    (:package "undo-tree" :repo
		      ("https://gitlab.com/tsc25/undo-tree"
		       . "undo-tree")
		      :files ("*" (:exclude ".git")) :source
		      "GNU ELPA" :protocol https :inherit t :depth
		      treeless :ref
		      "2bf5e230f1d11df7bbd9d8c722749e34482bc458"))
 (vertico :source "elpaca-menu-lock-file" :recipe
	  (:package "vertico" :repo "minad/vertico" :files
		    (:defaults "extensions/vertico-*.el") :fetcher
		    github :source "MELPA" :protocol https :inherit t
		    :depth treeless :ref
		    "17c629087ea23466b10fd0dd4ecce53e17a810e3"))
 (which-key :source "elpaca-menu-lock-file" :recipe
	    (:package "which-key" :repo "justbur/emacs-which-key"
		      :fetcher github :files
		      ("*.el" "*.el.in" "dir" "*.info" "*.texi"
		       "*.texinfo" "doc/dir" "doc/*.info" "doc/*.texi"
		       "doc/*.texinfo" "lisp/*.el" "docs/dir"
		       "docs/*.info" "docs/*.texi" "docs/*.texinfo"
		       (:exclude ".dir-locals.el" "test.el" "tests.el"
				 "*-test.el" "*-tests.el" "LICENSE"
				 "README*" "*-pkg.el"))
		      :source "MELPA" :protocol https :inherit t
		      :depth treeless :ref
		      "38d4308d1143b61e4004b6e7a940686784e51500"))
 (with-editor :source "elpaca-menu-lock-file" :recipe
	      (:package "with-editor" :fetcher github :repo
			"magit/with-editor" :files
			("*.el" "*.el.in" "dir" "*.info" "*.texi"
			 "*.texinfo" "doc/dir" "doc/*.info"
			 "doc/*.texi" "doc/*.texinfo" "lisp/*.el"
			 "docs/dir" "docs/*.info" "docs/*.texi"
			 "docs/*.texinfo"
			 (:exclude ".dir-locals.el" "test.el"
				   "tests.el" "*-test.el" "*-tests.el"
				   "LICENSE" "README*" "*-pkg.el"))
			:source "MELPA" :protocol https :inherit t
			:depth treeless :ref
			"87a384a0e59260cca41ca8831d98e195b1ec8ada")))
