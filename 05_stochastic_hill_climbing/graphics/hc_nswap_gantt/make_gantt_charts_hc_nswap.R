library(aitoaEvaluate);

files <- c("hc_nswap_abz7_0xb461441cc3169745.txt",
           "hc_nswap_la24_0xb21a5bf6c72479bf.txt",
           "hc_nswap_swv15_0xcf4d474cf98b73cf.txt",
           "hc_nswap_yn4_0xf782d9a4b7fd686d.txt");

makespan.hc1 <- c(798L, 1086L, 4108L, 1220L);
makespan.hcn <- c(758L, 1016L, 3872L, 1160L);

width <- 6;
height <- 3;
mar <- c(1.6, 1.6, 0.51, 0.15);

for(i in seq_along(files)) {
  file <- files[[i]];
  components <- unname(unlist(strsplit(file, "_", fixed=TRUE)));
  name <- paste(c("gantt_hc", components[2L:3L]), sep="_", collapse="_");

  data <- aitoa.load.result.from.log.file(file);

  gantt <- aitoa.jssp.parse.result(data$best.y);

  for(type in c("svg", "pdf")) {
    aitoa.graphic(name=paste0(name, "_", makespan.hc1[[i]]),
                  type=type, width=width, height=height, body={
      aitoaEvaluate::aitoa.plot.gantt(gantt,
          center.label = paste0(components[[3L]], " / ", as.integer(data$best.f)), mar=mar,
          xlim=c(0L, makespan.hc1[[i]]));
    });
    aitoa.graphic(name=paste0(name, "_", makespan.hcn[[i]]),
                  type=type, width=width, height=height, body={
      aitoaEvaluate::aitoa.plot.gantt(gantt,
                                      center.label = paste0(components[[3L]], " / ", as.integer(data$best.f)), mar=mar,
                                      xlim=c(0L, makespan.hcn[[i]]));
    });
  }
}
