# Profiles and journal overrides

These are configurable starting points, not publisher certification.

| Property | classic | minimal |
|---|---|---|
| Role | Engineering time responses, states and inputs | Comparisons, ablations, compact result summaries |
| Font | Times New Roman; report unavailable-font fallback | Arial; report fallback |
| Math | Consistent with text where supported | Consistent, legible math |
| Box | Four sides | Left/bottom axes |
| Grid | Light, thin major grid | Off unless it assists quantitative reading |
| Lines | 1.0 pt starting value | 1.1 pt starting value |
| Labels/ticks | 9/8 pt starting values | 9/8 pt starting values |
| Color | Blue, vermilion, bluish green, purple, orange, gray | Same semantic mapping |
| Size | 180 × 110 mm starting value | Same; adjust to actual column width |

Defaults are not fixed journal requirements. Use fewer panels or larger height rather than shrinking text to fit. At target scale, verify tick labels, superscripts, legend and inset labels. Do not infer equivalent font size from screen zoom.

## Journal adaptation procedure

For research keyword analysis, candidate selection and actual article-figure inspection, follow [journal-learning.md](journal-learning.md). Keep extracted settings in the current project's [task profile](task-profile.md), not this file.

1. Identify exact journal and submission stage; consult current official author/artwork guide when adapting for submission.
2. Record URL/access date and distinguish required dimensions/formats from optional visual suggestions.
3. Apply overrides for column width, maximum height, allowed fonts, minimum text size, line weights, color space and accepted file formats. Leave unspecified values configurable.
4. Render at actual target dimensions and inspect again. If the guide is inaccessible, label settings provisional rather than importing a different journal's requirements.

Implement learned settings locally: MATLAB helpers can set the base profile before explicit handle-level overrides; Python can nest a task-specific `matplotlib.rc_context` inside the base context. Pass final dimensions to the export helper. Layout and semantic method mappings must be reflected in plotting code, not merely described in a report. Do not modify the shared helper or permanent defaults just to satisfy one project's journal. Validate only the selected backend, not both, for a single project's output.

Possible targets include aerospace, control, signal processing and multidisciplinary journals. They are selected by the current task; none is hard-coded as the sole output destination. Nature-style font/grid suggestions belong to a distinct profile, not an unconditional override of engineering plots.

## Backend parity

Share physical dimensions, palette, semantic mapping, approximate font size and line weight. MATLAB and Matplotlib may differ in font metrics, math rendering and subplot padding: require visual consistency, not pixel identity. MATLAB TeX/LaTeX math may be outlined on export; FIG preserves objects, but verify PDF text separately. Python SVG uses text nodes; equations may still mix text and paths.

Use a task-local mapping such as method key → label/color/line/marker. Check more than six methods explicitly; choose meaningful grouping or small multiples instead of silently cycling indistinguishable styles. Sequential quantities use perceptually ordered color maps; signed residuals can use a centered diverging map. Never use categorical colors to imply quantitative order.
