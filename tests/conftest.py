import pytest

@pytest.fixture(scope="session")
def ns(request):
    ip = get_ipython()
    return ip.user_ns

@pytest.fixture(scope="session")
def RE(ns):
    return ns["RE"]

@pytest.fixture(scope="session")
def db(ns):
    return ns["tiled_writing_client"]