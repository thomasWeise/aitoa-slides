library(aitoaEvaluate);

files <- c("ea_16384+16384@0d0_nswap_sequence_abz7_0x08e0b3b7d9c80621.txt",
           "ea_16384+16384@0d0_nswap_sequence_la24_0x1a369a5e836c08bf.txt",
           "ea_16384+16384@0d0_nswap_sequence_swv15_0xc9094ffb5338f941.txt",
           "ea_16384+16384@0d0_nswap_sequence_yn4_0xf22c9afc59583b0f.txt");

makespan.hcrn   <- c(732L, 974L, 3826L, 1110L);
makespan.eanocr <- c(707L, 967L, 3728L, 1061L);

width <- 6;
height <- 3;
mar <- c(1.6, 1.6, 0.51, 0.15);

for(i in seq_along(files)) {
  file <- files[[i]];
  components <- unname(unlist(strsplit(file, "_", fixed=TRUE)));
  name <- paste(c("gantt_ea_nocr", components[5L]), sep="_", collapse="_");

  data <- aitoa.load.result.from.log.file(file);

  gantt <- aitoa.jssp.parse.result(data$best.y);

  for(type in c("svg", "pdf")) {
    aitoa.graphic(name=paste0(name, "_", makespan.hcrn[[i]]),
                  type=type, width=width, height=height, body={
      aitoaEvaluate::aitoa.plot.gantt(gantt,
          center.label = paste0(components[[5L]], " / ", as.integer(data$best.f)), mar=mar,
          xlim=c(0L, makespan.hcrn[[i]]));
    });
    aitoa.graphic(name=paste0(name, "_", makespan.eanocr[[i]]),
                  type=type, width=width, height=height, body={
      aitoaEvaluate::aitoa.plot.gantt(gantt,
                                      center.label = paste0(components[[5L]], " / ", as.integer(data$best.f)), mar=mar,
                                      xlim=c(0L, makespan.eanocr[[i]]));
    });
  }
}
