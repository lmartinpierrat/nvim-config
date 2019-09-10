Require Clangd to be installed for autocompletion



# Q language coloring syntax support

The best way I found so far is to install vim-polyglot via Plug, go to the downloaded sources and add vim-qkdb-syntax

diff --git a/build b/build
index 28c584d..18b8cc1 100755
--- a/build
+++ b/build
@@ -251,6 +251,7 @@ PACKS="
   python-compiler:aliev/vim-compiler-python
   python-indent:Vimjas/vim-python-pep8-indent
   python:vim-python/python-syntax
+  q:andrew-christianson/vim-qkdb-syntax
   qmake:artoj/qmake-syntax-vim
   qml:peterhoeg/vim-qml
   r-lang:vim-scripts/R.vim

