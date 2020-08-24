library(aitoaEvaluate);

files <- c("eac_4+4@0d05_nswap_sequence_abz7_0x793f5c5a1c414096.txt",
           "eac_4+4@0d05_nswap_sequence_la24_0xc283eafd3379759a.txt",
           "eac_4+4@0d05_nswap_sequence_swv15_0xec0784494d4f1fed.txt",
           "eac_4+4@0d05_nswap_sequence_yn4_0xf2dc486d3363f3e4.txt");

makespan.eacr <- c(702L, 967L, 3632L, 1053L);
makespan.eac  <- c(690L, 961L, 3224L, 1037L);

width <- 6;
height <- 3;
mar <- c(1.6, 1.6, 0.51, 0.15);

for(i in seq_along(files)) {
  file <- files[[i]];
  components <- unname(unlist(strsplit(file, "_", fixed=TRUE)));
  name <- paste(c("gantt_eac", components[5L]), sep="_", collapse="_");

  data <- aitoa.load.result.from.log.file(file);

  gantt <- aitoa.jssp.parse.result(data$best.y);

  for(type in c("svg", "pdf")) {
    aitoa.graphic(name=paste0(name, "_", makespan.eacr[[i]]),
                  type=type, width=width, height=height, body={
      aitoaEvaluate::aitoa.plot.gantt(gantt,
          center.label = paste0(components[[5L]], " / ", as.integer(data$best.f)), mar=mar,
          xlim=c(0L, makespan.eacr[[i]]));
    });
    aitoa.graphic(name=paste0(name, "_", makespan.eac[[i]]),
                  type=type, width=width, height=height, body={
      aitoaEvaluate::aitoa.plot.gantt(gantt,
                                      center.label = paste0(components[[5L]], " / ", as.integer(data$best.f)), mar=mar,
                                      xlim=c(0L, makespan.eac[[i]]));
    });
  }
}
