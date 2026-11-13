"""Local scientific plotting styles and guarded exports; no simulation."""
from contextlib import contextmanager
from pathlib import Path
import warnings
import matplotlib as mpl
from matplotlib import font_manager

COLORS = ['#0072B2', '#D55E00', '#009E73', '#CC79A7', '#E69F00', '#666666']
LINES = ['-', '--', '-.', ':']

@contextmanager
def style(profile='classic'):
    """Set temporary defaults for figures created inside the context."""
    if profile not in ('classic', 'minimal'):
        raise ValueError('profile must be classic or minimal')
    font = 'Times New Roman' if profile == 'classic' else 'Arial'
    try:
        font_manager.findfont(font, fallback_to_default=False)
    except ValueError:
        warnings.warn(f'{font} unavailable; using DejaVu Sans', stacklevel=2)
        font = 'DejaVu Sans'
    params = {'font.family': font, 'font.size': 9, 'axes.labelsize': 9,
              'axes.titlesize': 9, 'xtick.labelsize': 8, 'ytick.labelsize': 8,
              'legend.fontsize': 8, 'legend.frameon': False, 'axes.linewidth': .65,
              'lines.linewidth': 1.1, 'axes.grid': profile == 'classic',
              'grid.alpha': .15, 'grid.linewidth': .5,
              'axes.spines.top': profile == 'classic',
              'axes.spines.right': profile == 'classic',
              'xtick.direction': 'in', 'ytick.direction': 'in',
              'pdf.fonttype': 42, 'svg.fonttype': 'none',
              'figure.facecolor': 'white', 'axes.facecolor': 'white',
              'mathtext.fontset': 'stix' if profile == 'classic' else 'dejavusans'}
    with mpl.rc_context(params):
        yield

def export(fig, stem, size_mm=(180, 110), svg=False):
    """Export without tight cropping, preserving physical page dimensions."""
    if len(size_mm) != 2 or any(not (0 < v < float('inf')) for v in size_mm):
        raise ValueError('size_mm must contain two positive finite dimensions')
    stem = Path(stem)
    paths = [Path(str(stem)+'.'+e) for e in (['pdf','png','svg'] if svg else ['pdf','png'])]
    if any(p.exists() for p in paths):
        raise FileExistsError('Choose a new stem; existing output is protected')
    stem.parent.mkdir(parents=True, exist_ok=True)
    fig.set_size_inches(*(v/25.4 for v in size_mm))
    fig.canvas.draw()
    with mpl.rc_context({'pdf.fonttype':42, 'svg.fonttype':'none', 'savefig.bbox':None}):
        for p in paths:
            fig.savefig(p, dpi=300, facecolor='white', bbox_inches=None)
    return paths

def demo(output_dir, profile='classic'):
    """Synthetic layout fixture, never a scientific result."""
    import numpy as np
    import matplotlib.pyplot as plt
    t = np.linspace(0, 12, 241)
    y = [np.exp(-t/3)*np.cos(t), .7*np.exp(-t/4)*np.sin(t)]
    with style(profile):
        fig, axes = plt.subplots(1, 2, figsize=(180/25.4,85/25.4), layout='constrained')
        try:
            for panel, ax in enumerate(axes):
                for j, values in enumerate(y):
                    ax.plot(t, values if panel==0 else abs(values)+.001,
                            color=COLORS[j], linestyle=LINES[j], label=f'Case {j+1}')
                if panel: ax.set_yscale('log')
                ax.set(xlabel='Time (s)', ylabel='Normalized response (-)',
                       title=f'({chr(97+panel)}) Synthetic demonstration')
                ax.legend(loc='upper right')
            return export(fig, Path(output_dir)/f'python_{profile}', (180,85), svg=True)
        finally:
            plt.close(fig)

if __name__ == '__main__':
    mpl.use('Agg')
    import argparse
    parser = argparse.ArgumentParser(description='Create labeled synthetic style fixtures')
    parser.add_argument('output_dir')
    parser.add_argument('--profile', choices=['classic','minimal'], default='classic')
    args = parser.parse_args()
    for result in demo(args.output_dir, args.profile):
        print(result)
