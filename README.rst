manylinux for PyPy - archived
=============================

.. note::
  **This repo is archived. Please use the official manylinux_ images instead**

Older info
----------

.. image:: https://travis-ci.org/pypy/manylinux.svg?branch=master
    :target: https://travis-ci.org/pypy/manylinux

`Docker image`_ for building PyPy manylinux_ wheels.

This image extends the official manylinux image by installing PyPy. For now,
the only supported platform is ``x86_64``.

.. _`Docker image`: https://hub.docker.com/r/pypywheels/manylinux2010-pypy_x86_64
.. _manylinux: https://github.com/pypa/manylinux

At the moment of writing, this image provide the following versions of
PyPy:

- PyPy2.7 7.3.5

- PyPy3.7 7.3.5

- PyPy3.6 7.3.3

- PyPy2.7 7.2.0

- PyPy3.6 7.2.0

Live example
-------------

`pypy-manylinux-demo`_ is an example project which demonstrate how to build
CPython and PyPy wheels using Travis CI and this image. It is a fork of the
official `python-manylinux-demo`, and shows that building wheels for PyPy is
as easy as changing the image name!

.. _`pypy-manylinux-demo`: https://github.com/pypy/pypy-manylinux-demo
.. _`python-manylinux-demo`: https://github.com/pypa/python-manylinux-demo

How to run PyPy
----------------

The various PyPy versions are installed inside ``/opt/pypy/``, and they are
also symlinked to ``/opt/python``. Moreover, each installation of PyPy
contains also a ``python`` symlink.

All the following commands are equivalent and run the PyPy 2.7, version
7.3.5. You can use whatever fits best in your build system:

- ``/opt/pypy/pypy2.7-7.3.5/bin/pypy``

- ``/opt/pypy/pypy2.7-7.3.5/bin/python``

- ``/opt/python/pp27-pypy_73/bin/pypy``

- ``/opt/python/pp27-pypy_73/bin/python``

Similarly, these are the commands to run PyPy 3.7, version 7.3.5:

- ``/opt/pypy/pypy3.7-7.3.5/bin/pypy``

- ``/opt/pypy/pypy3.7-7.3.5/bin/python``

- ``/opt/python/pp37-pypy37_pp73/bin/pypy``

- ``/opt/python/pp37-pypy37_pp73/bin/python``

The paths for PyPy 7.3.3 Python 3.6 are completely analogous to the ones for 3.7.


PEP 425 Compatibility tags
---------------------------

``pp27-pypy_73`` and ``pp36-pypy36_pp73`` are the `PEP 425`_ compliant
compatibility tag. In particular:

- ``pp`` stands for PyPy (as opposed to ``cp`` which is CPython)

- ``27`` and ``37`` mean "Python 2.7|3.7"

- ``pypy_73`` and ``pypy37_pp73`` (or before PyPy 7.3.0, ``pypy_41`` and
  ``pypy3_71``) are the binary ABI tags for the relevant version of PyPy.
  You can probably ignore them.

Before pip 20 and wheel 0.34, tags looked like ``pp273-pypy_73`` or
``pp373-pypy36_pp73``, where ``273`` and ``373`` mean  "Python [2|3]",
"PyPy 7.3.x". Pre-7.3.0 versions of PyPy do not support pip>=20, and thus
still rely on these old PyPy PEP 425 tags.

.. _`PEP 425`: https://www.python.org/dev/peps/pep-0425/
