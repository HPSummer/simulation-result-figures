# Task-local study and plotting profile

Keep artifacts in the current project's existing work/output convention. Reuse an existing figure contract if it can hold these fields; do not create redundant reports. A concise `style-study.md` plus a small `figure-profile.json` is sufficient when a machine-readable configuration is useful. The shared skill contains this contract only, never populated project records.

## Study record

| Section | Minimum contents |
|---|---|
| Research brief | Generic keywords, evidence needs, supplied versus inferred meaning |
| Target | Selected journal, source of selection/user delegation, submission stage |
| Official guidance | Direct URL, accessed date, applicable requirements and unknowns |
| Article inventory | Verified citation/identifier, venue/year, version, relevance, access scope |
| Figure observations | Article key, figure/page, visual feature, exact/approximate/unknown |
| Decision table | Figure family, adopted setting, official/observed/design class, supporting source keys, reason |
| Limitations | Inaccessible sources, conflicting observations, small sample and provisional choices |
| Application | Output figure IDs, actual dimensions, checks performed, remaining deviations |

Do not add complete article text or screenshots merely to make a larger report. Reuse source access links/local authorized paths in private records as needed.

## Machine-readable profile contract

Use JSON or a native project structure; do not introduce a schema framework solely for this workflow. Suggested fields:

- `profile_id`, `backend` (`matlab` or `python`), `base_style` (`classic` or `minimal`).
- `target`: journal, stage, selection status (`user_selected`, `delegated`, or `generic`); never apply an unselected candidate as if approved.
- `sources`: keyed official/article records with URL, access date and actual inspection scope.
- `settings`: each value with unit where needed, evidence class (`official_requirement`, `observed_convention`, `design_decision`), supporting source keys and verified/approximate/provisional status.
- `figure_families`: layout, axes/scales, legend strategy, insets, and band semantics; keep scientific transformations in the data contract, not hidden in style settings.
- `method_map` / `component_map`: separate stable keys, labels, colors, line styles and optional markers.
- `overrides`: explicit per-figure exceptions and reason; preserve cross-figure consistency where meaningful.
- `outputs`: physical dimensions, formats, raster resolution and editability expectations.
- `limitations`: unresolved requirements and unsupported inferences.

Use `null`/unknown for unavailable evidence, not invented numerical defaults disguised as measurements. Defaults may be filled as design decisions. Keep the profile small enough for the actual task.

## Application checks

1. Required source keys resolve; official claims have official sources; visual claims have inspected figure identifiers.
2. Exact settings are distinguishable from visual estimates; requirements and optional conventions do not silently overwrite each other.
3. Method keys resolve consistently across figures and are not remapped by plotting order.
4. The plotting source actually reads the profile or explicitly applies its settings in a local configuration block.
5. Exported size, fonts/labels, limits and key layout choices match the intended settings, or deviations are recorded.
6. A populated task profile is never installed into the shared skill directory.
