manylinux-pypy
===============

.. image:: https://travis-ci.org/antocuni/manylinux-pypy.svg?branch=master
    :target: https://travis-ci.org/antocuni/manylinux-pypy

Docker image for building PyPy manylinux_ wheels.

This image extends the official manylinux image by installing PyPy. For now,
the only supported platform is ``x86_64``.

.. manylinux: https://github.com/pypa/manylinux

At the moment of writing, this image provide the two following versions of
PyPy:

  - PyPy2.7 7.1.1

  - PyPy3.6 7.1.1

The various PyPy versions are installed inside ``/opt/pypy/``, and they are
also symlinked to ``/opt/python``. Moreover, each installation of PyPy
contains also a ``python`` symlink; all the following commands are equivalent
and run the PyPy interpreter, you can use whatever fits best in your build
system:

  - ``/opt/pypy/pypy2.7-7.1.1/bin/pypy``

  - ``/opt/pypy/pypy2.7-7.1.1/bin/python``

  - ``/opt/python/pp271-pypy_41/bin/pypy``

  - ``/opt/python/pp271-pypy_41/bin/python``
