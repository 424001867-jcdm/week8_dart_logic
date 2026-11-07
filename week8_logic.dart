// Week 8: Dart Programming Fundamentals (Part 2) - Logic Problem Set
// Author: John Carlo Macabangon
// Course: PC16 - Mobile Development with Lab (National Teachers College)

String evaluateStockBatch(String itemCode, String quantityStr, double unitPrice) {
  try {
    // Error Handling: try/catch block to prevent crashes from bad input
    int stockQty = int.parse(quantityStr);

    if (stockQty < 0) {
      return "Error: Quantity cannot be negative.";
    }

    double cumulativeValue = 0.0;

    // Loop: Fixed loop repeating a task 3 times for tier calculation
    for (int i = 1; i <= 3; i++) {
      cumulativeValue += (unitPrice * stockQty) / i; 
    }

    // Conditional Logic: if/else statement checking stock thresholds
    String stockStatus;
    if (stockQty >= 10) {
      stockStatus = "Status: Adequate Stock (High Volume Tier)";
    } else if (stockQty > 0) {
      stockStatus = "Status: Low Stock (Restock Recommended)";
    } else {
      stockStatus = "Status: Out of Stock";
    }

    return "Item: $itemCode | $stockStatus | Evaluated Metric Score: PHP ${cumulativeValue.toStringAsFixed(2)}";

  } catch (e) {
    // Graceful error handling: catches format exceptions instead of crashing
    return "Error Caught: Invalid numeric format for stock quantity ('$quantityStr'). Handled gracefully.";
  }
}

void main() {
  print('=============================================');
  print('  PC16 Week 8: Logic & Error Handling Test   ');
  print('=============================================\n');

  print('--- Test 1: Normal Valid Input ---');
  print(evaluateStockBatch('DDR4-RAM-16GB', '12', 2450.50));

  print('\n--- Test 2: Low Stock Threshold Input ---');
  print(evaluateStockBatch('SSD-512GB', '4', 3200.00));

  print('\n--- Test 3: Deliberate Bad Input (Error Handling) ---');
  print(evaluateStockBatch('GPU-RTX-4060', 'twelve_units', 25000.00));

  print('\n=============================================');
  print('          Batch Processing Complete          ');
  print('=============================================');
}
