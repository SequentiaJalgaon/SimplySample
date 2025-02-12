function tfs_prod(sfdc, proj, products, cntry, bus) {
    var x = document.getElementById('tfs_product').options.selectedIndex;

    var tfs_prod = document.getElementById('tfs_product').options[x].text;

    var state_id = document.getElementById("state_id").value;

    if(window.XMLHttpRequest) {
        xmlhttpr = new XMLHttpRequest();
    } else {
        xmlhttpr = new ActiveXObject("Microsoft.xmlhttpr");
    }

    xmlhttpr.onreadystatechange = function () {
        if(xmlhttpr.readyState = 4 && xmlhttpr.status == 200) {
            document.getElementById("tfs_reg_stand").innerHTML = xmlhttpr.responseText;
        }
    }

    xmlhttpr.open("POST", encodeURI("tcp_result.php?stateid="+ state_id 
        + "&tfs_prod=" + tfs_prod 
        + "&cntry=" + cntry
        + "&bus=" + bus 
        + "&sfdc=" + sfdc 
        + "&proj=" + proj
        + "&products=" + products 
    ), true);
    xmlhttpr.send();

    return(0);
}