import os

exec(
    open(
        os.path.dirname(os.path.abspath(__file__)) + "/.format/.cmake-format.py"
    ).read()
)

with section("markup"):
    enable_markup = False
