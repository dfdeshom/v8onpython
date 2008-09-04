from distutils.core import setup
from distutils.extension import Extension
from Pyrex.Distutils import build_ext

setup(
      name = "V8",
        ext_modules=[
        Extension("v8module", ["v8onpython.pyx"],
                  language="c++",
                  libraries = ["v8"],
                  library_dirs=['.'],
                  include_dirs=['include'],
                  )
        
        ],
      
      cmdclass = {'build_ext': build_ext}
      )
