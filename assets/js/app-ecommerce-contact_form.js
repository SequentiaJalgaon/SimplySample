/**
 * App eCommerce review
 */

'use strict';

// apex-chart
(function () {
  let labelColor;

  if (isDarkStyle) {
    labelColor = config.colors_dark.textMuted;
  } else {
    labelColor = config.colors.textMuted;
  }

  // Visitor Bar Chart
  // --------------------------------------------------------------------
  const visitorBarChartEl = document.querySelector('#reviewsChart'),
    visitorBarChartConfig = {
      chart: {
        height: 160,
        width: 190,
        type: 'bar',
        toolbar: {
          show: false
        }
      },
      plotOptions: {
        bar: {
          barHeight: '75%',
          columnWidth: '40%',
          startingShape: 'rounded',
          endingShape: 'rounded',
          borderRadius: 5,
          distributed: true
        }
      },
      grid: {
        show: false,
        padding: {
          top: -25,
          bottom: -12
        }
      },
      colors: [
        config.colors_label.success,
        config.colors_label.success,
        config.colors_label.success,
        config.colors_label.success,
        config.colors.success,
        config.colors_label.success,
        config.colors_label.success
      ],
      dataLabels: {
        enabled: false
      },
      series: [
        {
          data: [20, 40, 60, 80, 100, 80, 60]
        }
      ],
      legend: {
        show: false
      },
      xaxis: {
        categories: ['M', 'T', 'W', 'T', 'F', 'S', 'S'],
        axisBorder: {
          show: false
        },
        axisTicks: {
          show: false
        },
        labels: {
          style: {
            colors: labelColor,
            fontSize: '13px'
          }
        }
      },
      yaxis: {
        labels: {
          show: false
        }
      },
      responsive: [
        {
          breakpoint: 0,
          options: {
            chart: {
              width: '100%'
            },
            plotOptions: {
              bar: {
                columnWidth: '40%'
              }
            }
          }
        },
        {
          breakpoint: 1440,
          options: {
            chart: {
              height: 150,
              width: 190,
              toolbar: {
                show: false
              }
            },
            plotOptions: {
              bar: {
                borderRadius: 6,
                columnWidth: '40%'
              }
            }
          }
        },
        {
          breakpoint: 1400,
          options: {
            plotOptions: {
              bar: {
                borderRadius: 6,
                columnWidth: '40%'
              }
            }
          }
        },
        {
          breakpoint: 1200,
          options: {
            chart: {
              height: 130,
              width: 190,
              toolbar: {
                show: false
              }
            },
            plotOptions: {
              bar: {
                borderRadius: 6,
                columnWidth: '40%'
              }
            }
          }
        },
        {
          breakpoint: 992,
          chart: {
            height: 150,
            width: 190,
            toolbar: {
              show: false
            }
          },
          options: {
            plotOptions: {
              bar: {
                borderRadius: 5,
                columnWidth: '40%'
              }
            }
          }
        },
        {
          breakpoint: 883,
          options: {
            plotOptions: {
              bar: {
                borderRadius: 5,
                columnWidth: '40%'
              }
            }
          }
        },
        {
          breakpoint: 768,
          options: {
            chart: {
              height: 150,
              width: 190,
              toolbar: {
                show: false
              }
            },
            plotOptions: {
              bar: {
                borderRadius: 4,
                columnWidth: '40%'
              }
            }
          }
        },
        {
          breakpoint: 576,
          options: {
            chart: {
              width: '100%',
              height: '200',
              type: 'bar'
            },
            plotOptions: {
              bar: {
                borderRadius: 6,
                columnWidth: '30% '
              }
            }
          }
        },
        {
          breakpoint: 420,
          options: {
            plotOptions: {
              chart: {
                width: '100%',
                height: '200',
                type: 'bar'
              },
              bar: {
                borderRadius: 3,
                columnWidth: '30%'
              }
            }
          }
        }
      ]
    };
  if (typeof visitorBarChartEl !== undefined && visitorBarChartEl !== null) {
    const visitorBarChart = new ApexCharts(visitorBarChartEl, visitorBarChartConfig);
    visitorBarChart.render();
  }
})();

// Datatable (jquery)
$(document).ready(function () {
  var dt_enquiry_table = $('.datatables-contact');

  if (dt_enquiry_table.length) {
      $.ajax({
          url: contactformenquiryApi,
          type: 'GET',
          dataType: 'json',
          success: function (data) {
              if (data.status && Array.isArray(data.message)) {
                  dt_enquiry_table.DataTable({
                      data: data.message,
                      columns: [
                          { data: 'EnquiryID', title: 'ID' },
                          { data: 'Name', title: 'Name' },
                          { data: 'Mobile', title: 'Contact' },
                          { data: 'Email', title: 'Email' },
                          { data: 'Subject', title: 'Subject' },
                          { data: 'Message', title: 'Message' },
                          { data: 'AddedOn', title: 'Date' }
                      ],
                      order: [[0, 'desc']], // Sort by latest enquiries
                      responsive: true,
                      searching: false,
                      paging: false
                  });
              } else {
                  console.error("Invalid data format from API");
              }
          },
          error: function (xhr, status, error) {
              console.error("Error fetching enquiry data: " + error);
          }
      });
  }
});

