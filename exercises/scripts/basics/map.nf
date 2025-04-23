params.inputdir = "${projectDir}/../../test_data/txts"	

Channel
    .fromPath("${params.inputdir}/{t0001,t0002,t0003}*.txt")
    .set {my_files}

my_files.view()

// select first two elements of the channel

my_files
    .collect()
    .map{
                ["my id", it[0], it[1] ]
}.view()
