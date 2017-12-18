import nixio as nix
import numpy as np


data = np.load("bunch-o-numbers.npz")["data"]

# create new nix file (overwrite truncates existing file)
nixfile = nix.File.open("mydata.nix", nix.FileMode.Overwrite)
# block: top level data grouping
block = nixfile.create_block("DataBlock", "experiment")
# data array: data storage object
darray = block.create_data_array("raw-01", "raw data", data=data)
time = darray.append_sampled_dimension(0.1)
time.unit = "ms"
darray.append_set_dimension()

# identify regions of interest with start position and length
regionsstart = np.array([13, 45, 63])
regionslength = np.array([2, 2, 2])

roipos = block.create_data_array("roi-positions", "positions",
                                 data=regionsstart)
roiext = block.create_data_array("roi-extents", "extents",
                                 data=regionslength)
mtag = block.create_multi_tag("roi", "regions of interest", roipos)
mtag.extents = roiext
mtag.units = "ms"
mtag.references.append(darray)

nixfile.close()
