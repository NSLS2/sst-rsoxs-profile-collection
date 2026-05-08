import pytest
from IPython import get_ipython

ip = get_ipython()

def test_re_is_not_overwritten(ns):
    RE = ns["RE"]
    bl = ns["bl"]
    assert RE is bl.run_engine
