manylinux for PyPy
==================
.. image:: https://travis-ci.org/pypy/manylinux.svg?branch=master
    :target: https://travis-ci.org/pypy/manylinux

`Docker image`_ for building PyPy manylinux_ wheels.

This image extends the official manylinux image by installing PyPy. For now,
the only supported platform is ``x86_64``.

.. _`Docker image`: https://hub.docker.com/r/pypywheels/manylinux2010-pypy_x86_64
.. _manylinux: https://github.com/pypa/manylinux

At the moment of writing, this image provide the two following versions of
PyPy:

- PyPy2.7 7.1.1

- PyPy3.6 7.1.1

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
7.1.1. You can use whatever fits best in your build system:

- ``/opt/pypy/pypy2.7-7.1.1/bin/pypy``

- ``/opt/pypy/pypy2.7-7.1.1/bin/python``

- ``/opt/python/pp271-pypy_41/bin/pypy``

- ``/opt/python/pp271-pypy_41/bin/python``

Similarly, these are the commands to run PyPy 3.6, version 7.1.1:

- ``/opt/pypy/pypy3.6-7.1.1/bin/pypy``

- ``/opt/pypy/pypy3.6-7.1.1/bin/python``

- ``/opt/python/pp371-pypy3_71/bin/pypy``

- ``/opt/python/pp371-pypy3_71/bin/python``


PEP 425 Compatibility tags
---------------------------

``pp271-pypy_41`` and ``pp371-pypy3_71`` are the `PEP 425`_ compliant
compatibility tag. In particular:

- ``pp`` stands for PyPy (as opposed to ``cp`` which is CPython)

- ``271`` and ``371`` mean "Python [2|3]", "PyPy 7.1.x".

- ``pypy_41`` and ``pypy3_71`` are the binary ABI tags for the relevant
  version of PyPy. You can probably ignore them.

.. _`PEP 425`: https://www.python.org/dev/peps/pep-0425/
