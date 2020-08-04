library(aitoaEvaluate);

files <- c("1rs_yn4_0x3cc5468fbe824783.txt",
           "1rs_swv15_0xec0784494d4f1fed.txt",
           "1rs_la24_0x74f03edeac508bfb.txt",
           "1rs_abz7_0xc5cbcf2ad309798b.txt");

width <- 6;
height <- 3;
mar <- c(1.6, 1.6, 0.51, 0.15);

for(file in files) {
  components <- unname(unlist(strsplit(file, "_", fixed=TRUE)));
  name <- paste(c("gantt", components[1L:2L]), sep="_", collapse="_");

  data <- aitoa.load.result.from.log.file(file);

  gantt <- aitoa.jssp.parse.result(data$best.y);

  for(type in c("svg", "pdf")) {
    aitoa.graphic(name=name, type=type, width=width, height=height, body={
      aitoaEvaluate::aitoa.plot.gantt(gantt,
          center.label = paste0(components[[2L]], " / ", as.integer(data$best.f)), mar=mar);
    });
  }
}
