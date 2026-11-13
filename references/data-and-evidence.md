# Data and evidence contract

Use existing MAT, CSV, table, timetable, NumPy or project-native data. A universal file conversion is unnecessary. At minimum resolve:

| Field | Required interpretation |
|---|---|
| Independent axis | Time/iteration/evaluations/frequency, units and sampling |
| Response | Column meaning, units, frame, reference and normalization |
| Method | Stable key and display label, including ON/OFF meaning |
| Run | Seed/case identifier and pairing; independent experimental unit |
| Metric | Formula, reduction axes, evaluation window and sample count |
| Processing | Filtering, smoothing, interpolation, decimation, PSD estimator |
| Provenance | Source file, configuration/code version when available |

Validate lengths/shapes, monotonic time and finite values before plotting. Do not silently sort or discard samples. NaNs can intentionally mark gaps: retain and explain them. Uneven sampling, repeated timestamps and resets require deliberate handling. Convert units once and label the result; retain raw data.

Tracking error, estimation error, residual, norm, per-axis RMS and pooled RMS are different quantities. The mean of per-run RMSE is not pooled RMSE. State which is used. Compare interventions over a common scientifically relevant window; do not choose windows after seeing which method wins.

Keep paired runs paired. Time samples are not independent Monte Carlo replicates. Show individual runs when n is small. Identify bands as SD, quantile, confidence interval or bounds; include n and how computed. Do not manufacture confidence intervals, convergence or significance claims. Retain failed/unfinished runs and explain treatment.

If resampling is needed for comparison, disclose the grid and interpolation. Avoid interpolating discrete mode switches or constraint violations. Decimation must preserve spikes/limits; never compute metrics on display-decimated data unless expressly justified.

For spectra specify sampling, detrending, window, segment length/overlap, one/two-sided convention and PSD versus ASD units. Use a meaningful stationary interval. Missing intervals or short records do not become validated noise-floor claims. No unrequested simulation to obtain missing data.
