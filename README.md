# Automatic Report LaTeX Project

This folder contains a DOCX-to-LaTeX conversion of `../Automatic_report.docx`.

- `main.tex`: clean assembly file; it inputs the cover, TOC, front matter, and every section file in order.
- `preamble.tex`: page layout, hyperlinks, image support, and table settings.
- `latexmkrc`: tells Overleaf/UiTiOt-style editors to compile with XeLaTeX.
- `sections/00_front_matter/`: cover, acknowledgements, summary, and list pages.
- `sections/01_mo_dau/`: chapter 1 and its subsection/subsubsection files.
- `sections/01_co_so_ly_thuyet/`: chapter 2 and its subsection/subsubsection files.
- `sections/03_phuong_phap_thuc_hien/`: chapter 3, tool descriptions, and automatic/manual activity tables.
- `sections/04_chuong_4_thuc_nghiem_danh_gia_va_thao_luan/`: chapter 4 source files.
- `sections/05_chuong_5_ket_luan_va_huong_phat_trien/`: chapter 5 source files.
- `sections/appendix_phu_luc_a/`: appendix source.
- `sections/_generated/body_full.tex`: full generated Pandoc body kept as a reference, not used directly by `main.tex`.
- `images/`: extracted images from the DOCX.
- `filters/latex-cleanup.lua`: Pandoc cleanup filter used for this conversion.
- `build.ps1`: local build helper using the portable Tectonic engine in `../tools/tectonic/`.
- `TABLE_AUDIT.md`: table-count and build-validation notes.

Build from Command Prompt:

```bat
build.bat
```

Build from PowerShell:

```powershell
powershell -ExecutionPolicy Bypass -File .\build.ps1
```

The conversion was generated with Pandoc and validated with Tectonic. The DOCX has 11 tables; the active LaTeX project has 12 bordered `longtable` blocks including the abbreviation list. All tables stay in normal portrait orientation and use full text width. The generated PDF is `main.pdf`.

On UiTiOt/Overleaf, set the compiler to XeLaTeX if it is not selected automatically. XeLaTeX uses Times New Roman when that font is available on the server; otherwise it falls back to TeX Gyre Termes. If the server insists on pdfLaTeX, the project falls back to Vietnamese-compatible Times-style fonts so it can still produce a PDF.
