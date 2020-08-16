library(aitoaEvaluate);

files <- c("hc_rs_65536_nswap_abz7_0xe1c7ac9ff44c1473.txt",
           "hc_rs_65536_nswap_la24_0x7a5124e4b4858975.txt",
           "hc_rs_65536_nswap_swv15_0x97894f90359b8e6c.txt",
           "hc_rs_65536_nswap_yn4_0xfa259937ac556ede.txt");
makespan.hcr1 <- c(733L, 976L, 3861L, 1115L);
makespan.hcrn <- c(732L, 974L, 3826L, 1110L);

width <- 6;
height <- 3;
mar <- c(1.6, 1.6, 0.51, 0.15);

for(i in seq_along(files)) {
  file <- files[[i]];
  components <- unname(unlist(strsplit(file, "_", fixed=TRUE)));
  name <- paste(c("gantt_hcr", components[3L:5L]), sep="_", collapse="_");

  data <- aitoa.load.result.from.log.file(file);

  gantt <- aitoa.jssp.parse.result(data$best.y);

  for(type in c("svg", "pdf")) {
    aitoa.graphic(name=paste0(name, "_", makespan.hcr1[[i]]),
                  type=type, width=width, height=height, body={
      aitoaEvaluate::aitoa.plot.gantt(gantt,
          center.label = paste0(components[[5L]], " / ", as.integer(data$best.f)), mar=mar,
          xlim=c(0L, makespan.hcr1[[i]]));
    });
    aitoa.graphic(name=paste0(name, "_", makespan.hcrn[[i]]),
                  type=type, width=width, height=height, body={
      aitoaEvaluate::aitoa.plot.gantt(gantt,
                                      center.label = paste0(components[[5L]], " / ", as.integer(data$best.f)), mar=mar,
                                      xlim=c(0L, makespan.hcrn[[i]]));
    });
  }
}
