/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Model;

import java.io.IOException;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.Random;

/**
 *
 * @author Steam
 */
public class EmailHandler {

    public static void sendEMail(String to, String subject, String text) {
        // URL to which the request will be sent
        String url = "https://mail-sender-service.vercel.app/send-email";

        try {
            // Create a URL object
            URL apiUrl = new URL(url);

            // Open a connection to the URL
            HttpURLConnection connection = (HttpURLConnection) apiUrl.openConnection();

            // Set the request method
            connection.setRequestMethod("POST");

            // Enable input/output streams
            connection.setDoOutput(true);

            // Set the content type
            connection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");

            // Prepare the request payload
            String payload = "{\"to\":\"" + to + "\",\"subject\":\"" + subject + "\",\"text\":\"" + text + "\"}";

            // Write the payload to the output stream
            try ( OutputStream os = connection.getOutputStream()) {
                byte[] input = payload.getBytes(StandardCharsets.UTF_8);
                os.write(input, 0, input.length);
            }

            // Get the response code
            int responseCode = connection.getResponseCode();

            // Close the connection
            connection.disconnect();

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static String generateCodeVerify() {
        Random rd = new Random();
        int codeVerify = rd.nextInt(899999) + 100000;

        return String.valueOf(codeVerify);
    }

    public static void main(String[] args) {
        // Thông tin người nhận email
        String toEmail = "";
        String verify = EmailHandler.generateCodeVerify();
        // Chủ đề của email
        String content = "Verifiy";

        // Nội dung email
        String text = verify;

        String htmlContent = "<!DOCTYPE html>\n"
                + "<html>\n"
                + "<head>\n"
                + "    <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n"
                + "</head>\n"
                + "<body style=\"background-color: #b8daff; padding: 20px;\">\n"
                + "    <div class=\"container\">\n"
                + "        <h2 style=\"font-size: 30px;\">Xin Chào!!</h2>\n"
                + "        <p>Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi. Mã xác thực của bạn là:</p>\n"
                + "        <h1 style=\"margin-left: 150px; font-size: 38px; color: red;\">123456</h1>\n"
                + "        <p>Vui lòng nhập mã này vào trang xác thực trên website của chúng tôi để hoàn tất quá trình.</p>\n"
                + "        <p style=\"font-size: 15px;\"><a href=\"http://localhost:9999/onlineshop/verify.jsp\">Quay lại website của chúng tôi</a></p>\n"
                + "        <p>Nếu bạn không yêu cầu mã này, vui lòng bỏ qua email này hoặc liên hệ với bộ phận hỗ trợ của chúng tôi.</p>\n"
                + "        <p>Trân trọng,</p>\n"
                + "        <h2>FBT Shoes Shop</h2>\n"
                + "    </div>\n"
                + "</body>\n"
                + "</html>";

// Xử lý nội dung HTML để chuyển thành text
        String textContent = htmlContent.replaceAll("\\<.*?\\>", "").replaceAll("\\s+", " ");
        System.out.println(textContent);
        EmailHandler.sendEMail(toEmail, content, textContent);

        // Sinh mã xác minh
        String verificationCode = EmailHandler.generateCodeVerify();

        // In ra mã xác minh
        System.out.println("Verification Code: " + verificationCode);
    }
}
