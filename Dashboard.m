% ดึงข้อมูลจากไฟล์ CSV
data = readtable('sensor_data.csv');

mq7 = data.MQ7;        % โหลดข้อมูลจากคอลัมน์ MQ7
mq135 = data.MQ135;
temp = data.Temperature;  
humidity = data.Humidity;    

% สร้างและแสดง UI
app = design; % สร้าง instance ของ App (ไฟล์ .mlapp ที่ออกแบบใน App Designer)

% อัปเดตค่าใน Gauge ตามข้อมูลจากไฟล์ .csv ในลูป
for i = 1:height(data)
    % อัปเดตค่า MQ-7 จากข้อมูล .csv ใน gauge ชื่อ MQ7Gauge ของ app
    app.MQ7Gauge.Value = mq7(i); 
    
    % อัปเดตค่า MQ-135 จากข้อมูล .csv ใน gauge ชื่อ MQ135Gauge ของ app
    app.MQ135Gauge.Value = mq135(i); 

    % อัปเดตค่า Temperature จากข้อมูล .csv ใน gauge ชื่อ TemperatureGauge ของ app
    app.TemperatureGauge.Value = temp(i);

    % อัปเดตค่า Temperature จากข้อมูล .csv ใน gauge ชื่อ TemperatureGauge ของ app
    app.HumidityGauge.Value = humidity(i);
    
    % อัปเดตข้อความใน Label สำหรับ MQ7
    app.MQ7Label.Text = ['MQ-7:',num2str(mq7(i)),' PPM'];
    app.MQ135Label.Text = ['MQ-135:',num2str(mq135(i)),' PPM'];
    app.TemperatureLabel.Text = ['Temp:',num2str(temp(i)),'°C'];
    app.HumidityLabel.Text = ['Humidity:',num2str(humidity(i)),'%'];

    % แสดงค่าใน Command Window
    disp(['MQ-7: ', num2str(mq7(i)),'PPM']);
    disp(['MQ-135: ', num2str(mq135(i)),'PPM']);
    disp(['Temperature: ', num2str(temp(i)),'°C']);
    disp(['Humidity: ', num2str(humidity(i)),'%']);

    % หน่วงเวลาสักครู่ก่อนอัปเดตครั้งถัดไป
    pause(1); % อัปเดตทุก 1 วินาที (ปรับตามต้องการ)
end