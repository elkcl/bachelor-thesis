#figure(
  {
    show grid.cell.where(x: 0): set text(size: 15pt, weight: "bold")
    show grid.cell.where(x: 0): it => {
      let (body, ..fields) = it.fields()
      if body.func() == rotate { return it }
      body = rotate(-90deg, reflow: true, body)
      return grid.cell(body, ..fields)
    }
    grid(
      stroke: (x, y) => if x == 0 {
        (right: 0.7pt + gray)
      },
      inset: 5pt,
      columns: (auto, auto),
      align: horizon,
      [syz-mkfs], include "tables/syz-mkfs-30min.typ",
      [syz-idr], include "tables/syz-idr-30min.typ",
      [syz-both], include "tables/syz-both-30min.typ",
    )
  },
  caption: [Статистика покрытия после 30 мин работы фаззеров],
) <syz-30min-table>

#figure(
  {
    show grid.cell.where(x: 0): set text(size: 15pt, weight: "bold")
    show grid.cell.where(x: 0): it => {
      let (body, ..fields) = it.fields()
      if body.func() == rotate { return it }
      body = rotate(-90deg, reflow: true, body)
      return grid.cell(body, ..fields)
    }
    grid(
      stroke: (x, y) => if x == 0 {
        (right: 0.7pt + gray)
      },
      inset: 5pt,
      columns: (auto, auto),
      align: horizon,
      [syz-mkfs], include "tables/syz-mkfs-1d.typ",
      [syz-idr], include "tables/syz-idr-1d.typ",
      [syz-both], include "tables/syz-both-1d.typ",
    )
  },
  caption: [Статистика покрытия после 1 дня работы фаззеров],
) <syz-1d-table>

#figure(
  {
    show grid.cell.where(x: 0): set text(size: 15pt, weight: "bold")
    show grid.cell.where(x: 0): it => {
      let (body, ..fields) = it.fields()
      if body.func() == rotate { return it }
      body = rotate(-90deg, reflow: true, body)
      return grid.cell(body, ..fields)
    }
    grid(
      stroke: (x, y) => if x == 0 {
        (right: 0.7pt + gray)
      },
      inset: 5pt,
      columns: (auto, auto),
      align: horizon,
      [syz-mkfs], include "tables/syz-mkfs-7d.typ",
      [syz-idr], include "tables/syz-idr-7d.typ",
      [syz-both], include "tables/syz-both-7d.typ",
    )
  },
  caption: [Статистика покрытия после 7 дней работы фаззеров],
) <syz-7d-table>

