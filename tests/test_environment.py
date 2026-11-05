import catboost
import duckdb
import pandas as pd
from pymc_marketing.clv import BetaGeoModel, GammaGammaModel  # noqa: F401


def test_stack_runs():
    frame = duckdb.sql("select 1 as x").df()
    model = catboost.CatBoostRegressor(iterations=1, verbose=False).fit(pd.DataFrame({"x": [0, 1]}), [0, 1])
    assert len(model.predict(frame)) == 1
