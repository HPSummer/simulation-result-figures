# Proportional acceptance checks

1. Data: lengths/units/window and plotted values checked against the saved source; no display processing silently used for metrics.
2. Meaning: method/component mapping consistent; bands/replicates explained; absent or failed results retained honestly.
3. Layout: no clipped axes, legends or inset labels; readable at final dimensions; line styles work without color; shared scales appropriate.
4. Export: measure actual PDF size and PNG pixels/DPI; open the rendered export. Check embedded fonts/selectable text where promised. Dense artwork may contain raster layers; report that specifically.
5. Reuse: source and data references resolve; output parameters recorded; no global session changes or accidental overwrite.
6. Privacy: no private identities, manuscript identifiers or private reference paths in reusable skill files, code comments, examples or metadata. Public tool/journal names and public source credits are allowed.
7. Journal learning: selected target matches the user's instruction; article identity and publication venue verified; visual claims link to inspected figure/page identifiers; official rules, observations and design decisions are distinct. Disclose inaccessible figures and limited sampling.
8. Application: compare exported figures with the task profile and evidence plan. A journal label or saved profile does not prove the plotting code applied the settings. Confirm that style adaptation did not alter data, evaluation windows, limits, uncertainty meaning or inclusion of failures.

Automated checks cannot prove perceptual quality or physical correctness. Record what was inspected visually versus mechanically. Do not declare every file inspected at full resolution based only on a contact sheet.

Defaults: vector PDF + 300 dpi PNG preview. SVG/FIG and higher raster resolution are optional or journal-driven. For MATLAB exports on older releases, explicitly disclose dimension/export limitations instead of changing backend.

Measure dimensions rather than trusting requested values. Exporters can round PDF bounds to whole points; report the actual size and judge it against the target tolerance. Do not label a rounded size exact, or silently loosen a publisher's dimension requirement.
