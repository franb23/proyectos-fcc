let price = 19.5; // Example price for testing
let cid = [
    ["PENNY", 0.5],
    ["NICKEL", 0],
    ["DIME", 0],
    ["QUARTER", 0],
    ["ONE", 0],
    ["FIVE", 
function calculateChange(price, cash) {
    let change = cash - price; // Calculate the change

 
    if (change < 0) {
        alert("Customer does not have enough money to purchase the item");
        return;
    }

 
    if (change === 0) {
        document.getElementById("change-due").textContent = "No change due - customer paid with exact cash";
        return;
    }

    let changeArr = []; // Array to store the change to return
    let totalCid = 0; // Total cash in drawer

  
    for (let i = 0; i < cid.length; i++) {
        totalCid += cid[i][1];
    }

   
    if (totalCid < change) {
        document.getElementById("change-due").textContent = "Status: INSUFFICIENT_FUNDS";
        return;
    }


    for (let i = cid.length - 1; i >= 0; i--) {
        let coinValue;
        let coinName = cid[i][0];
        let coinAmount = cid[i][1];

        // Assign value according to the denomination
        switch (coinName) {
            case "PENNY": coinValue = 0.01; break;
            case "NICKEL": coinValue = 0.05; break;
            case "DIME": coinValue = 0.10; break;
            case "QUARTER": coinValue = 0.25; break;
            case "ONE": coinValue = 1; break;
            case "FIVE": coinValue = 5; break;
            case "TEN": coinValue = 10; break;
            case "TWENTY": coinValue = 20; break;
            case "ONE HUNDRED": coinValue = 100; break;
        }

        let coinTotal = coinAmount / coinValue;

     
        if (change >= coinValue) {
            let coinsToReturn = Math.min(Math.floor(change / coinValue), coinTotal); // Determine how many coins to return
            change -= coinsToReturn * coinValue; // Reduce the remaining change
            change = Math.round(change * 100) / 100; // Round to two decimal places

            // If coins to return, add to the array
            if (coinsToReturn > 0) {
                changeArr.push([coinName, coinsToReturn * coinValue]);
            }
        }
    }

  
    if (change > 0) {
        document.getElementById("change-due").textContent = "Status: INSUFFICIENT_FUNDS";
        return;
    }


    let changeText = "Status: OPEN"; // Change status
    // Check if totalCid is equal to the total change due
    if (Math.abs(totalCid - (cash - price)) < 0.01) {
        changeText = "Status: CLOSED"; // The drawer is closed
        changeArr = cid; // Return the entire cash in drawer as change
    }

   
    changeArr.forEach(coin => {
        if (coin[1] > 0) {
            changeText += ` ${coin[0]}: $${coin[1].toFixed(2)}`; // Format the output
        }
    });

    document.getElementById("change-due").textContent = changeText; // Show the change in the HTML
}


document.getElementById("purchase-btn").addEventListener("click", function() {
    let cash = parseFloat(document.getElementById("cash").value); // Get the cash provided
    calculateChange(price, cash); // Call the function to calculate change
});