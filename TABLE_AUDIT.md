# Table Conversion Audit

Source: `../Automatic_report.docx`

Conversion result:

- DOCX tables found: 11
- LaTeX `longtable` blocks generated from DOCX: 11
- Active bordered `longtable` blocks in the project: 12
- Wide tables wrapped in landscape pages: 0
- Bordered grid tables: 12
- Extracted images: 2
- LaTeX errors: 0
- Missing-character warnings: 0
- PDF build result: `main.pdf`, 34 pages

DOCX table structure:

| Table | Rows | Max cells | Vertical merges | Grid spans |
|---:|---:|---:|---:|---:|
| 1 | 6 | 3 | 0 | 0 |
| 2 | 9 | 2 | 0 | 0 |
| 3 | 92 | 4 | 91 | 0 |
| 4 | 7 | 4 | 0 | 0 |
| 5 | 6 | 4 | 0 | 0 |
| 6 | 7 | 4 | 0 | 0 |
| 7 | 6 | 4 | 0 | 0 |
| 8 | 92 | 4 | 91 | 0 |
| 9 | 18 | 4 | 18 | 0 |
| 10 | 92 | 4 | 91 | 0 |
| 11 | 16 | 4 | 10 | 0 |

Notes:

- Pandoc preserved all source tables as LaTeX `longtable` environments.
- The project adds one extra bordered longtable for `DANH MỤC TỪ VIẾT TẮT`.
- The cleanup filter converts heading-styled text inside table cells into bold cell text, avoiding invalid-looking section headings inside tables.
- Every table uses vertical rules, horizontal rules, and an outer border.
- Every table remains portrait and uses the full text width.
- Empty `longtable` footer rules were removed so table bottoms use the normal final-row `\\` plus `\hline` pattern without detached footer lines or vertical overhangs.
- In the Chapter 3 activity tables, the `Phần` column is grouped by section number; internal row separators use `\cline{2-4}` so the `Phần` cell is split only at sections 1, 2, 3, 4, 5, and 6.
- Wide tables still produce normal underfull-cell layout warnings because the source contains narrow columns and long technical text. These are layout warnings, not table-loss or build failures.
