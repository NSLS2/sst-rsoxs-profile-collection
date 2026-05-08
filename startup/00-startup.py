## profile_collection is a "bootstrapping" mechanism that triggers the rsoxs package and other beamline codebase to be loaded into the beamline computers.
## profile_collection is located in .ipython, which is separate from the rest of the beamline codebase (e.g., the rsoxs package).  It isan IPython profile, not a normal "python package".
## The rsoxs package should not be placed in this same ~/.ipython directory, nor should the contents of profile_collection be consolidated into the rsoxs package.  This has been attempted before and does not work.
## Configuration files (e.g., devices.toml, regions.toml) belong in this codebase.  It is easier to find the location of an IPython Profile such as profile_collection, but harder to locate these configuration files from the rsoxs package.

## Goal is to keep this file and generally profile_collection package as minimal as possible such that main changes here would be made by NSLS II DSSI (e.g., changing Kafka), and DSSI would not have to edit rsoxs package.


## 20250130 - adding in capabilities from configure_base that are no longer used after recent code upgrade
## Needs to be imported before alignment_local.py, I think
import matplotlib.pyplot as plt
import bluesky.callbacks as bc
from bluesky.callbacks import *
from bluesky.utils import ProgressBarManager
from bluesky_queueserver import is_re_worker_active





## Uses this package: https://github.com/xraygui/nbs-bl
## Gives the path to profile_collection directory and looks for devices.toml file
## This should replace any hardware imports from sst_hw, sst_base, and rsoxs.  rsoxs.Functions imports may have to stay until some of the functions are rewritten to become compliant with data security upgrades.
from nbs_bl.printing import run_report
from nbs_bl.configuration import load_and_configure_everything

run_report(__file__)
plt.ion()
load_and_configure_everything()


'''
# sst code  # Common code
# from sst_base.archiver import *
from rsoxs.devices.cameras import configure_cameras
from rsoxs.plans.rsoxs import *
from rsoxs.plans.run_acquisitions import *
from rsoxs.plans.custom_acquisitions_commissioning import *
from rsoxs.plans.custom_acquisitions_liquids import *
from rsoxs.plans.custom_acquisitions_broadband import *
from rsoxs.configuration_setup.configuration_load_save import *
from rsoxs.configuration_setup.configurations_instrument import *
from rsoxs.alignment.fiducials import *
from rsoxs.alignment.energy_calibration import *
from rsoxs.alignment.m3 import *

## Eliot's old code
from rsoxs.HW.cameras import * ## 20250131 - temporary solution to using crosshairs, need a better long-term solution
from rsoxs.Functions.alignment import *
from rsoxs.Functions.alignment_local import *
from rsoxs.Functions.magics import *
'''

if not is_re_worker_active(): ## If not running queueserver, run these
    from rsoxs.Functions.magics import *
    pbar_manager = ProgressBarManager()
    RE.waiting_hook = pbar_manager
