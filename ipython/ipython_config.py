c = get_config()
c.InteractiveShellApp.exec_lines = [
    "import numpy as np",
    "np.set_printoptions(formatter={'float': '{: 0.3f}'.format})",
]
