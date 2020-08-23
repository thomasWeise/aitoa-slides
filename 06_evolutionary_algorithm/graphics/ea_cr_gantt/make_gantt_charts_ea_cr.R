library(aitoaEvaluate);

files <- c("ea_8192+8192@0d05_nswap_sequence_abz7_0x3e18dccfaac019a5.txt",
           "ea_8192+8192@0d05_nswap_sequence_la24_0x4cb3868c10a74d49.txt",
           "ea_8192+8192@0d05_nswap_sequence_swv15_0x27edc6bc766c28a2.txt",
           "ea_8192+8192@0d05_nswap_sequence_yn4_0xbe33a3fb349d2638.txt");

makespan.eanocr <- c(707L, 967L, 3728L, 1061L);
makespan.eacr   <- c(702L, 967L, 3632L, 1053L);

width <- 6;
height <- 3;
mar <- c(1.6, 1.6, 0.51, 0.15);

for(i in seq_along(files)) {
  file <- files[[i]];
  components <- unname(unlist(strsplit(file, "_", fixed=TRUE)));
  name <- paste(c("gantt_ea_cr", components[5L]), sep="_", collapse="_");

  data <- aitoa.load.result.from.log.file(file);

  gantt <- aitoa.jssp.parse.result(data$best.y);

  for(type in c("svg", "pdf")) {
    aitoa.graphic(name=paste0(name, "_", makespan.eanocr[[i]]),
                  type=type, width=width, height=height, body={
      aitoaEvaluate::aitoa.plot.gantt(gantt,
          center.label = paste0(components[[5L]], " / ", as.integer(data$best.f)), mar=mar,
          xlim=c(0L, makespan.eanocr[[i]]));
    });
    aitoa.graphic(name=paste0(name, "_", makespan.eacr[[i]]),
                  type=type, width=width, height=height, body={
      aitoaEvaluate::aitoa.plot.gantt(gantt,
                                      center.label = paste0(components[[5L]], " / ", as.integer(data$best.f)), mar=mar,
                                      xlim=c(0L, makespan.eacr[[i]]));
    });
  }
}
