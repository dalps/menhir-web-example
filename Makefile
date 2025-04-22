main.js: _build/default/main.bc.js
	dune build; \
	cp _build/default/main.bc.js main.js