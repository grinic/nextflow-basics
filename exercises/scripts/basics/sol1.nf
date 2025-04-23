params.inputdir = "${projectDir}/../../test_data/txts"	

Channel
    .fromPath("${params.inputdir}/{t0001,t0002,t0003}*.txt")
    .set {my_files}

my_files
    .collect()
    .view()

// You can also write it as: my_files.collect().view()

my_files
    .combine(my_files)
    .view()

