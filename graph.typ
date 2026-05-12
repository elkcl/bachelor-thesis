#import "@preview/lilaq:0.6.0" as lq
#let graph(title, ylabel, xs, data) = lq.diagram(
  title: title,
  xaxis: (
    subticks: none,
    ticks: xs.enumerate(),
  ),
  ylabel: ylabel,
  width: 12cm,
  height: 6.5cm,
  lq.bar(
    // label: [30 мин],
    range(1),
    width: 1/4,
    x => data.at(xs.at(x)).at(0)
  ),
  lq.bar(
    label: [30 мин],
    width: 1/4,
    offset: -1/4,
    range(1, xs.len()),
    x => data.at(xs.at(x)).at(0)
  ),
  lq.bar(
    label: [1 день],
    width: 1/4,
    offset: 0,
    range(1, xs.len()),
    x => data.at(xs.at(x)).at(1)
  ),
  lq.bar(
    label: [7 дней],
    width: 1/4,
    offset: 1/4,
    range(1, xs.len()),
    x => data.at(xs.at(x)).at(2)
  ),
)

