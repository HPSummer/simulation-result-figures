---
name: simulation-result-figures
description: Present existing simulation and numerical results as editable scientific figures. Analyze research keywords, identify candidate journals when needed, and learn from relevant published figures to adapt layouts and styles. Use for responses, errors, constraints, ablations, convergence, ensembles, and spectra; prefer MATLAB while preserving existing Python workflows.
---

# Simulation Result Figures

Create cross-project scientific result figures from existing data. Default to the classic engineering profile; adapt structure to the evidence and technical export settings to the target journal. This skill contains no personal identity, private manuscript references, private paths, or project-specific conclusions.

## Scope and routing

- Follow an explicitly selected backend. Otherwise retain the project's plotting backend; if none exists, prefer MATLAB. Use Python for an established Python workflow. Do not silently switch when a runtime is unavailable: report the blocker and deliver the appropriate source.
- Present existing results; this skill does not authorize new simulation, optimization, training, installation of dependencies, or changes to the scientific model. Missing results remain missing. Synthetic data are allowed only for clearly labeled layout demonstrations, kept separate from research outputs.
- For an existing figure, make targeted changes and preserve user edits. Work on a new derivative unless overwrite is authorized. Never change all open figures or global graphics defaults.
- Use the bundled helpers when useful; they are small styling/export utilities, not a mandatory data framework. Do not force existing projects into their interface.

## Minimum figure contract

Infer from files and task context before asking questions. Record briefly with the output:
1. Scientific question and what each panel demonstrates.
2. Data files and variable mapping, units/frame, sampling time, method names and run/seed identities.
3. Metric formula and window; independent replicate count; uncertainty-band meaning.
4. Selected backend/profile, physical figure size, intended journal if any, and requested outputs.

Read [data-and-evidence.md](references/data-and-evidence.md) for metric and statistics rules; [figure-recipes.md](references/figure-recipes.md) for content-dependent layout. Resolve only ambiguity that could change the scientific meaning; infer reversible layout choices.

## Research-aware journal learning

When asked to adapt to research content or a target journal, read [journal-learning.md](references/journal-learning.md). Extract the research object, methods, contribution, validation setting, metrics and relevant figure types from available task materials. Build focused search terms and inspect actual figures from relevant articles, alongside the official author guide. A title, abstract, search snippet or publisher name is not visual evidence.

If the journal is already specified, proceed without asking again. If journal-specific adaptation is requested but no target is selected, propose a small evidence-based shortlist and obtain the user's selection before applying a journal-specific profile; meanwhile prepare the data contract and generic figures. A user may explicitly delegate the choice. Do not force journal selection for ordinary plotting or cosmetic edits.

Keep official requirements, sampled visual observations and design decisions separate. Save the study and a task-local profile using [task-profile.md](references/task-profile.md), then apply the selected settings in the actual plotting code. The profile alone is not the deliverable. Reuse a valid task-local study; avoid repeated searches for unchanged figures.

Research keywords, private material identifiers, article-specific figure notes and learned profiles belong in the current project's working/output directories, never in this shared skill. Only reusable procedures and public general-purpose documentation belong here.

## Style and consistency

Read [profiles.md](references/profiles.md). Use `classic` or `minimal`, then apply the task-local journal/figure-type overrides. A journal is not a universal visual template. For submission compliance, apply mandatory requirements first; if they conflict with the user's explicit design choice, explain the conflict and preserve that choice unless the user authorizes changing it, labeling the result noncompliant where necessary. Sampled conventions are optional and never override scientific meaning. Do not claim compliance based on a preset name.

Keep a method-to-color/line/marker mapping across the entire figure set, independent of plotting order. Keep coordinate-component encoding separate from method encoding; avoid using the same legend to encode both. Use line styles or markers as well as colors. Only link scales across genuinely comparable panels; do not force position, velocity and inputs onto one axis.

Choose dimensions before polishing. Inspect at final printed size, including inset labels. Avoid excessive tiny panels; use shared legends when unambiguous, and place insets away from meaningful transients. Grid, box and font choices are profile options, not scientific invariants.

## Implement and export

- MATLAB: use `scripts/srf_style.m` after plotting and `scripts/srf_export.m` on the explicitly supplied figure. Follow the example in `scripts/srf_demo.m`; it generates only a labeled synthetic demonstration. Local functions and cleanup preserve the active session. Do not clear the workspace, close unrelated figures or persist paths/defaults.
- Python: use `scripts/srf_plot.py` with a local style context. Pass method styles explicitly for multi-method sets. Preserve project conventions, avoid global rcParams changes, and close only figures owned by the operation.
- Minimum useful delivery: vector PDF, PNG preview, plotting source and a link to the numeric source or exported table. Add MATLAB FIG or text-editable SVG when useful/requested. Do not generate every format automatically. Dense rasterized layers are acceptable if disclosed and axes/text remain vector.
- Use relative paths/configurable output roots in reusable code; absolute private paths do not belong in the skill or examples. Do not embed author/manuscript identifiers in figure metadata.
- Built-in demos are validation fixtures, never evidence of a method's performance.

## Verify and deliver

Read [qa.md](references/qa.md). Check dimensions, labels, legends, meaningful limits, log-scale admissibility, source-data agreement and actual text editability. Inspect exported previews and at least representative PDF renders; fix clipping/overlap before delivery. A passing static validator does not establish visual quality or scientific validity.

When real data are available, compare plotted values/metrics to their source with tolerances appropriate to numerical conversion. Never call time samples independent replicates. Distinguish completed checks, unperformed checks and scientific limitations. Keep verification proportional: no new simulation for cosmetic edits.

Delivery should identify files, metric/processing choices and material limitations concisely. For journal learning, include the selected journal, actual inspection coverage, adopted conventions and unresolved requirements, with links to the task-local study/profile. Do not claim a journal-wide style from a small sample. Public design/API sources are in [sources.md](references/sources.md); they are not runtime dependencies.
