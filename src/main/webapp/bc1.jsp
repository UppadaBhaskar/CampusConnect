<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Barcode Scanner</title>
    <style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            
        }
        
        .logo{
        width:100px;
        height:100px;
        }

        #reader {
            text-align: center;
            font-size: medium;
            height: 40vh;
            width: 70vw;
            margin-top:40px;
            
            
            
        }
        #html5-qrcode-anchor-scan-type-change{
visibility: hidden;        
        
        }
        #html5-qrcode-select-camera{
        margin-top:5px;
        }
        #html5-qrcode-button-camera-start{
        margin-top:90px;
        }
        #html5-qrcode-button-camera-stop{
        margin-top:20px;}

    </style>
</head>
<body>
<img class="logo" src="assets/delay.png">
    <div id="reader"></div>
    <script src="https://unpkg.com/html5-qrcode"></script>
    <script src="html5-qrcode.min.js"></script>

    <script>
        function onScanSuccess(decodedText, decodedResult) 
        {
            console.log('Barcode data: ' + decodedText);
            
            var xhr = new XMLHttpRequest();
            xhr.open('POST', 'D_M_Serv', true);
            xhr.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
            xhr.onreadystatechange = function() {
                if (xhr.readyState === XMLHttpRequest.DONE && xhr.status === 200) {
                    console.log('Response from servlet:', xhr.responseText);
                }
            };
            console.log('2');
            
            xhr.send('decodedText=' + encodeURIComponent(decodedText));
            
        }

        function onScanFailure(error) {
            console.error('Scanning failed: ' + error);
        }
        
        const config = { fps: 10, qrbox: { width: 250, height: 250 } };
        const html5QrcodeScanner = new Html5QrcodeScanner('reader', config, false);
        html5QrcodeScanner.render(onScanSuccess);
        
        const html5QrCode = new Html5Qrcode('reader');
        html5QrCode.start(onScanSuccess, onScanFailure);
    </script>
    <div id="result"></div>
</body>
</html>
