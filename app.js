const fs = require("fs");
const http = require("http");

// Fungsi untuk membaca file konfigurasi
const loadConfig = (filePath) => {
  try {
    const configData = fs.readFileSync(filePath, "utf8");
    const config = {};
    configData.split("\n").forEach((line) => {
      const [key, value] = line.split("=");
      if (key && value) {
        config[key.trim()] = value.trim();
      }
    });
    return config;
  } catch (error) {
    console.error("Error reading configuration file:", error.message);
    process.exit(1);
  }
};

// Fungsi untuk menjalankan aplikasi
const startApp = (config, apiUrl) => {
  console.log("Starting application with the following configuration:");
  console.log(config);

  // Simulasi request ke API eksternal
  http.get(apiUrl, (res) => {
    let data = "";

    // Mengumpulkan data dari response
    res.on("data", (chunk) => {
      data += chunk;
    });

    // Proses data setelah selesai
    res.on("end", () => {
      console.log("Received data from API:");
      console.log(data);
      console.log("Application started successfully.");
    });
  }).on("error", (err) => {
    console.error("Error fetching API data:", err.message);
  });
};

// Main
const configFilePath = "./data.conf";
const apiUrl = process.argv[2];

if (!apiUrl) {
  console.error("API URL is required as a command-line argument.");
  process.exit(1);
}

const config = loadConfig(configFilePath);
startApp(config, apiUrl);
