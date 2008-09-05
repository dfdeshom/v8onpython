from distutils.core import setup
from distutils.extension import Extension
from Cython.Distutils import build_ext

setup(
      name = "V8",
        ext_modules=[
        Extension("v8onpython", ["v8onpython.pyx"],
                  language="c++",
                  libraries = ["v8"],
                  library_dirs=['v8-src'],
                  include_dirs=['v8-src/include'],
                  )
        
        ],
      
      cmdclass = {'build_ext': build_ext}
      )
