lualatex -halt-on-error ./ups.tex 
lualatex -halt-on-error ./block.tex
lualatex --jobname=123456 -halt-on-error ./lock.tex 
