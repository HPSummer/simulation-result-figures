# Content-led layouts

| Content | Useful arrangement | Main safeguard |
|---|---|---|
| State/input response | Related states above applied inputs; common time axis | Distinguish requested and applied input; avoid mixed units |
| Multi-axis error | One variable family per panel, component color mapping | Separate tracking and estimation errors |
| Constraints | Response with limit/reference and, if useful, margin | Show violations; a sampled trace is not a continuous-time proof |
| Switching/event logic | Discrete mode/trigger trace aligned to response | Preserve event time; do not interpolate modes |
| Transient and steady state | Full trace plus labeled inset or adjacent zoom | Full trace remains visible; identify zoom units/window |
| Paired ablation | Paired points plus representative full trajectories | Same seed/config except stated intervention |
| Monte Carlo | Individual outcomes/ECDF/quantile band as appropriate | n is independent runs; include failures |
| Optimization | Objective and constraint residual versus evaluation/time | Distinguish best-so-far from current; show budget/termination |
| Parameter sweep | Curves or heatmap with physical axis units | Keep missing/infeasible cells visible |
| Frequency response/noise | Log axes where valid, labeled PSD/ASD | Disclose estimator and usable frequency range |
| Pareto result | Feasible points with objective units and directions | Do not connect unrelated points to imply attainability |

The helper scripts implement generic styling/export only. Domain-specific plots and metrics are created from the current project's data using these recipes. Do not require a six-panel layout or an inset for every plot.
