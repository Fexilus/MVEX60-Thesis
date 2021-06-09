# Automatic generation of code appendix

The code appendix is generated using [Sphinx](https://www.sphinx-doc.org/en/master/).
Due to design decisions in Sphinx, its LaTeX-generator only generates entire documents.
Additionally, the generated LaTeX documents depend on a custom .sty file.
In this file, both the structure and style are defined simultaneously.
Therefore, it is not viable to use that package in this thesis, which has its own style.

Instead, the text-generator is used, and the LaTeX markup is done by hand.
To build the .txt file used to create `../computer-algebra.tex`, use
    
    sphinx-build -b text source build

in this folder, while in a python environment with both [Sphinx](https://pypi.org/project/Sphinx/) and this thesis' [symmetries package](https://github.com/Fexilus/MVEX60-Code) installed.
The file `./build/index.txt` will contain the non-markup:ed text.
