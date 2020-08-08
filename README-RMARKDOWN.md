rgantt
======

![](http://www.r-pkg.org/badges/version/rgantt)

This package is to create a gantt chart(bar chart that illustrates a
project schedule) with desired data.frame.

This package can create an interactive gantt chart in R. It is a wrapper
of Javascript library [Frappe Gantt](https://github.com/frappe/gantt)

Installation
------------

Dev version (Not on CRAN yet)

    devtools::install_github("frankzhangsyd/rgantt") 

Introduction
------------

Simply create a data frame with `id` `start` `end` `name` `progress`
`dependecies` columns. Then pass this data frame into `rgantt()`
function.

    df <- data.frame(
      stringsAsFactors = FALSE,
                    id = c("Task 0","Task 1","Task 2",
                           "Task 3","Task 4","Task 5","Task 6"),
                 start = c("2020-08-07","2020-08-08",
                           "2020-08-08","2020-08-10","2020-08-14","2020-08-15",
                           "2020-08-17"),
                   end = c("2020-08-14","2020-08-11",
                           "2020-08-11","2020-08-13","2020-08-14","2020-08-16",
                           "2020-08-17"),
                  name = c("Redesign website",
                           "Write new content","Upgrade systeme","Apply new styles","Review",
                           "Deploy","Go Live!"),
              progress = c(37L, 75L, 75L, 23L, 21L, 61L, 32L),
          dependencies = c(NA,"Task 0","Task 0",
                           "Task 1, Task 2","Task 3",NA,"Task 5")
    )

The easiest way to start is copying code above and modify your version!

    knitr::kable(df)

<table>
<thead>
<tr class="header">
<th style="text-align: left;">id</th>
<th style="text-align: left;">start</th>
<th style="text-align: left;">end</th>
<th style="text-align: left;">name</th>
<th style="text-align: right;">progress</th>
<th style="text-align: left;">dependencies</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td style="text-align: left;">Task 0</td>
<td style="text-align: left;">2020-08-07</td>
<td style="text-align: left;">2020-08-14</td>
<td style="text-align: left;">Redesign website</td>
<td style="text-align: right;">37</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="even">
<td style="text-align: left;">Task 1</td>
<td style="text-align: left;">2020-08-08</td>
<td style="text-align: left;">2020-08-11</td>
<td style="text-align: left;">Write new content</td>
<td style="text-align: right;">75</td>
<td style="text-align: left;">Task 0</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Task 2</td>
<td style="text-align: left;">2020-08-08</td>
<td style="text-align: left;">2020-08-11</td>
<td style="text-align: left;">Upgrade systeme</td>
<td style="text-align: right;">75</td>
<td style="text-align: left;">Task 0</td>
</tr>
<tr class="even">
<td style="text-align: left;">Task 3</td>
<td style="text-align: left;">2020-08-10</td>
<td style="text-align: left;">2020-08-13</td>
<td style="text-align: left;">Apply new styles</td>
<td style="text-align: right;">23</td>
<td style="text-align: left;">Task 1, Task 2</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Task 4</td>
<td style="text-align: left;">2020-08-14</td>
<td style="text-align: left;">2020-08-14</td>
<td style="text-align: left;">Review</td>
<td style="text-align: right;">21</td>
<td style="text-align: left;">Task 3</td>
</tr>
<tr class="even">
<td style="text-align: left;">Task 5</td>
<td style="text-align: left;">2020-08-15</td>
<td style="text-align: left;">2020-08-16</td>
<td style="text-align: left;">Deploy</td>
<td style="text-align: right;">61</td>
<td style="text-align: left;">NA</td>
</tr>
<tr class="odd">
<td style="text-align: left;">Task 6</td>
<td style="text-align: left;">2020-08-17</td>
<td style="text-align: left;">2020-08-17</td>
<td style="text-align: left;">Go Live!</td>
<td style="text-align: right;">32</td>
<td style="text-align: left;">Task 5</td>
</tr>
</tbody>
</table>

    library(rgantt)
    rgantt(df)
