# Simulation Result Figures

A reusable Codex skill for presenting existing simulation and numerical results as consistent, editable scientific figures. MATLAB is preferred for new workflows; established Python projects retain their backend.

面向跨项目仿真结果呈现：分析研究关键词与证据需求，学习目标期刊中相关论文的实际图件，再将适合当前数据的风格应用到绘图代码。

## What it does

- Organizes time responses, tracking/estimation errors, constraints, ablations, convergence, ensembles and spectra according to their scientific purpose.
- Provides classic engineering and minimal academic base styles.
- Extracts research concepts and, when requested, helps identify a target journal.
- Inspects actual article figures and official author guides, distinguishing requirements, sampled conventions and local design choices.
- Maintains consistent method/component encodings and checks physical dimensions, labels, export quality and evidence boundaries.
- Keeps task-specific research information and learned profiles in the project, outside the reusable skill.

Journal learning uses the host agent's available search and document-viewing tools. This repository does not contain a standalone crawler, automatic journal classifier or a guarantee of publisher compliance.

## Install as a skill

Download or clone this repository, then place the directory under your Codex skills folder so that the layout is:

```text
~/.codex/skills/simulation-result-figures/SKILL.md
```

Use the configured skills location if your environment overrides that default. Preserve any existing local modifications when updating. If the skill is not yet listed, refresh the skill list or open a new chat.

Example request:

> Use $simulation-result-figures to analyze the research context, learn relevant target-journal figure conventions, and plot the existing results. Preserve the project's plotting backend.

中文示例：

> 使用 $simulation-result-figures，分析当前研究内容，学习目标期刊中相关论文的结果图风格，并使用已有数据绘图。

If no journal is specified, ordinary plotting uses a generic profile. Journal-specific learning can propose candidates and wait for selection, or select a target if the user expressly delegates that choice.

## Helpers and dependencies

| Backend | Dependencies | Helpers |
|---|---|---|
| MATLAB | MATLAB; bundled explicit-size exporter requires R2025a or newer | `srf_style.m`, `srf_export.m`, `srf_demo.m` |
| Python | Python, NumPy, Matplotlib with constrained-layout support | `srf_plot.py` |

The helpers are optional building blocks, not a mandatory data schema. All code comments are in English. No external style package or LaTeX installation is required by the examples.

Run the clearly labeled synthetic layout demonstrations from the repository root:

```matlab
addpath('scripts');
srf_demo('demo-output', 'classic');
srf_demo('demo-output', 'minimal');
```

```shell
python scripts/srf_plot.py demo-output --profile classic
python scripts/srf_plot.py demo-output --profile minimal
```

Choose a new output directory or filename for repeated exports: helpers protect existing outputs. MATLAB creates PDF/PNG/FIG demo files; Python creates PDF/PNG/SVG demo files. The examples are layout fixtures, not physical simulations or research evidence.

## Workflow and documentation

1. Establish the data, metric and figure contract.
2. If requested, analyze research keywords and resolve the target journal.
3. Inspect a bounded set of relevant article figures and official requirements.
4. Save a task-local study/profile and apply it in the actual plotting source.
5. Inspect exported figures and report scientific and formatting limitations.

Start with [SKILL.md](SKILL.md). Detailed references:

- [Research-aware journal learning](references/journal-learning.md)
- [Task-local study and profile](references/task-profile.md)
- [Base styles and journal overrides](references/profiles.md)
- [Data and evidence](references/data-and-evidence.md)
- [Content-led figure recipes](references/figure-recipes.md)
- [Quality checks](references/qa.md)
- [Public design and API sources](references/sources.md)

## Validation and limits

The base helpers were exercised with MATLAB R2026a and a local Python/Matplotlib environment using both style profiles. Checks covered representative PDF renders, PNG output, selectable PDF text, Python SVG text, physical dimensions, overwrite protection, and preservation of unrelated MATLAB figures. MATLAB PDF bounds can be rounded to whole points; inspect actual export size against the target's requirements.

The journal-learning instructions received structural and workflow review. A complete live literature-to-plot trial is task-dependent and is not claimed by the synthetic demos. The supplied recipes guide domain-specific implementation; they are not prebuilt plotting functions for every figure type.

This skill does not authorize new simulation, training or optimization. It does not infer scientific success from visual polish, treat time samples as independent replicates, or change metrics and constraints to imitate reference figures.

Private manuscript text, unpublished results and local paths must not be sent to public search without authorization. Keep project-specific references and learned profiles out of shared skill files. No private research data or manuscript examples are distributed in this repository.
