import { Controller } from "@hotwired/stimulus"
import { Chart, registerables } from "chart.js"

Chart.register(...registerables)

// Connects to data-controller="dashboard"
export default class extends Controller {
  initialize() {
    const data = [10, 20, 30, 40, 50, 60, 70];
    const labels = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"];
    const container = document.getElementById("revenueChart");
    
    new Chart(container, {
      type: "line",
      data: {
        labels: labels,
        datasets: [{
          label: "Revenue $",
          data: data,
          borderWidth: 1,
          fill: true
        }]
      },
      optioins: {
        plugins: {
          legend: {
            display: false
          }
        },
        scales: {
          x: {
            grid: {
              display: false
            }
          },
          y: {
            border: {
              dash: [5, 5]
            },
            grid: {
              color: "#dedede"
            },
            beginAtZero: true
          }
        }
      }
    })
  }
}
