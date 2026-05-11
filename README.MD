# Khatam University Thesis LaTeX Template

This is a formal LaTeX template for writing a thesis at **Khatam University**. It follows the university's formatting guidelines and provides a structured starting point for students.

---

## Quick Start

Follow these steps to build the PDF from source:

### 1. Install MiKTeX Console
Download and install [MiKTeX](https://miktex.org/) (complete or basic version).  
Make sure to install necessary packages on-the-fly or manually via the MiKTeX Console.

### 2. Build the Document

Open a terminal/command prompt in the main project directory:

```bash
KhatamThesisTemplate> xelatex -interaction=nonstopmode main.tex
KhatamThesisTemplate> bibtex main
KhatamThesisTemplate> xelatex -interaction=nonstopmode main.tex
KhatamThesisTemplate> xelatex -interaction=nonstopmode main.tex
```

After these commands complete, you will see the output file:

```bash
KhatamThesisTemplate> main.pdf
```

## Project structure

KhatamThesisTemplate/
├── main.tex              % Root document
├── references.bib        % Bibliography file
├── thesis.cls            % Khatam thesis standard settings / Custom class file
├── README.MD             % this file 
├── appendices/           % all apendix files
├── chapters/             % Individual chapter .tex files
├── fonts/                % fonts used in project (don't tuch it!)
├── frontmatter           % frontmatter files including titlepage, dedicarion and etc.
├── images/               % All images, diagrams, plots
└── settings              % overall settings 



## Customization

You can modify the following settings directly in `thesis.cls`:

| Field                     | Command / Variable          | Description                         |
| ------------------------- | --------------------------- | ----------------------------------- |
| Thesis title              | `\thesistitle`              | Your thesis full title              |
| List of abbreviations     | (edit inside `thesis.cls`)  | Define or update abbreviations      |

To customize:

1. Open `thesis.cls` in any text editor.
2. Locate `\thesistitle` and change its value to your thesis title.
3. Find the abbreviations section and modify the list as needed.
4. Recompile using the **Quick Start** steps above.

> **Note:** Do not rename `\thesistitle` unless you also update its usage in `main.tex` or other dependent files.
 
## Contributing
If you improve or fix this template (e.g., updated university logo, corrected margins, better bibliography handling), feel free to share your changes.


## Acknowledgements

We would like to thank the following individuals for their valuable contributions to this project:

- **Ebrahim Tahernezhad** and **Hamid Reza Montaseri** – for providing code that was adapted and used in this template.

Their work has been instrumental in the development of this thesis template.

---

## MIT License

Copyright (c) [2026] [Erfan Karami]

Permission is hereby granted, free of charge, to any person obtaining a copy
of this documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

---

## Contact / Maintainer

- **Name:** [Erfan Karami]
- **Email:** [Erfankarami1515@gmail.com]
- **University:** Khatam University, TeIAS, Department of Computer Science
- **GitHub:** [@Erfansky]