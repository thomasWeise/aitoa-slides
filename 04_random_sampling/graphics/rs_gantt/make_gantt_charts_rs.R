library(aitoaEvaluate);

files <- c("rs_la24_0x9c1440c4792d2a02.txt",
           "rs_yn4_0xf782d9a4b7fd686d.txt",
           "rs_swv15_0x8b05976455625347.txt",
           "rs_abz7_0x4d76e0390b366999.txt");
makespan.1rs <- c(1814L, 2039L, 6563L, 1326L);

width <- 6;
height <- 3;
mar <- c(1.6, 1.6, 0.51, 0.15);

for(i in seq_along(files)) {
  file <- files[[i]];
  components <- unname(unlist(strsplit(file, "_", fixed=TRUE)));
  name <- paste(c("gantt", components[1L:2L]), sep="_", collapse="_");

  data <- aitoa.load.result.from.log.file(file);

  gantt <- aitoa.jssp.parse.result(data$best.y);

  for(type in c("svg", "pdf")) {
    aitoa.graphic(name=paste0(name, "_", makespan.1rs[[i]]),
                  type=type, width=width, height=height, body={
      aitoaEvaluate::aitoa.plot.gantt(gantt,
          center.label = paste0(components[[2L]], " / ", as.integer(data$best.f)), mar=mar,
          xlim=c(0L, makespan.1rs[[i]]));
    });
  }
}
