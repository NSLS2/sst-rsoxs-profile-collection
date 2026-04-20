import pytest
from nbs_bl.plans.scans import nbs_count, nbs_energy_scan

def test_nbs_count(RE, db):
    RE(nbs_count(10))
    run = db[-1]
    assert run.start['plan_name'] == "nbs_count"
    assert run.primary['data']['time'].shape == (10,)

def test_nbs_energy_scan(RE, db):
    RE(nbs_energy_scan(300, 1.0, 305, dwell=1.0))
    run = db[-1]
    assert run.primary['data']['time'].shape == (6,)