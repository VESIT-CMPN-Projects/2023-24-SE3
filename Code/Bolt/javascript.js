document.getElementById('registrationForm').addEventListener('submit', function(event) {
    event.preventDefault();

    // Retrieve form data
    const formData = new FormData(event.target);

    // Create JSON object from form data
    const jsonData = {};
    formData.forEach((value, key) => {
      jsonData[key] = value;
    });

    // Log JSON data to console (You can send this data to server-side script for further processing)
    console.log(jsonData);

    // You can add AJAX call here to send data to server-side script for processing

    // Clear form fields after submission
    event.target.reset();
  });
