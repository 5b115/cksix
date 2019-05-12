package com.zut.wl.utils.client;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;

import java.io.IOException;

/**
 * @Author xiumu
 * @Date 2019/5/7 8:28
 */
public class ClientUtil {

    private String appKey = "20190428717083245";
    private String appSecret = "209c6979bf26752c7d93a63691aa94feb6df7f49";
    private String accessToken = "";
    private CloseableHttpClient httpClient = null;
    private CloseableHttpResponse httpResponse = null;
    private ObjectMapper objectMapper = new ObjectMapper();
    private JsonNode jsonNode;

    public String getAccessToken() {
        return accessToken;
    }

    /**
     * 关闭网络连接
     * @throws IOException
     */
    private void closeHttp() throws IOException {
        if (httpClient!=null){
            httpClient.close();
        }
        if (httpResponse!=null){
            httpResponse.close();
        }
    }

    /**
     * 发送get请求并将返回值转为json字符串
     * @param urlPath 请求路径
     * @return 返回json数据
     * @throws IOException
     */
    public String executeGet(String urlPath){
        String stringEntity = null;
        try {
            this.httpClient = HttpClients.createDefault();
            HttpGet httpGet = new HttpGet(urlPath);
            httpResponse = httpClient.execute(httpGet);
            HttpEntity responseEntity = httpResponse.getEntity();
            stringEntity = EntityUtils.toString(responseEntity,"UTF-8");
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                closeHttp();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return stringEntity;
    }
    /**
     * 构造此类时直接获取accessToken;
     */
    public ClientUtil() {
        try {
            String getAccessTokenUrl = "http://10.10.31.140:5009/open_api/authentication/get_access_token?key="+appKey+"&secret="+appSecret;
            String stringEntity = executeGet(getAccessTokenUrl);
            jsonNode = objectMapper.readValue(stringEntity,JsonNode.class);
            JsonNode resultJsonNode = jsonNode.get("result");
            accessToken = resultJsonNode.get("access_token").asText();
        } catch (IOException e) {
            e.printStackTrace();
        }finally {
            try {
                closeHttp();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }



}
