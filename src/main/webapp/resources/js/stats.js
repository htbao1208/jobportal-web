/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function randColor() {
    return 'hsla(' + (Math.random() * 360) + ', 80%, 50%, 0.5)';
}

function seekerChart(id, seekerLabels = [], seekerInfor = []) {
    let colors = [];
    for (let i = 0; i < seekerLabels.length; i++)
        colors.push(randColor());

    const data = {
        labels: seekerLabels,
        datasets: [{
                label: 'Statistics of candidates by career ',
                data: seekerInfor,
                backgroundColor: colors,
                hoverOffset: 4
            }]
    };

    const config = {
        type: 'pie',
        data: data
    };
    
    let ctx = document.getElementById(id).getContext("2d");
    new Chart(ctx, config);
}