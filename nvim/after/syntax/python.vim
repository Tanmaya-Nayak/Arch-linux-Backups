" Separate builtin types from builtin functions
syn keyword pythonBuiltinType str int float bool bytes complex
      \ list dict tuple set frozenset
      \ type object super classmethod staticmethod property
      \ Exception BaseException ValueError TypeError KeyError
      \ IndexError AttributeError RuntimeError StopIteration
      \ NotImplementedError OSError IOError FileNotFoundError

hi! link pythonBuiltinType PythonTypeHL
