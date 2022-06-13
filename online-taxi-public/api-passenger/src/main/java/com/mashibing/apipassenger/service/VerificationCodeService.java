package com.mashibing.apipassenger.service;

import com.mashibing.apipassenger.remote.ServiceVefificationcodeClient;
import com.mashibing.internalcommon.constant.CommonStatusEnum;
import com.mashibing.internalcommon.dto.ResponseResult;
import com.mashibing.internalcommon.responese.NumberCodeResponse;
import com.mashibing.internalcommon.responese.TokenResponse;
import net.sf.json.JSONObject;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.stereotype.Service;

import java.util.concurrent.TimeUnit;

@Service
public class VerificationCodeService {

    @Autowired
    private ServiceVefificationcodeClient serviceVefificationcodeClient;

    // 乘客验证码的前缀
    private String verificationCodePrefix = "passenger-verification-code-";

    @Autowired
    private StringRedisTemplate stringRedisTemplate;

    public ResponseResult generatorCode(String passengerPhone){
        // 调用验证码服务，获取验证码
        ResponseResult<NumberCodeResponse> numberCodeResponse = serviceVefificationcodeClient.getNumberCode(6);
        int numberCode = numberCodeResponse.getData().getNumberCode();

        // 存入redis
        // key,value,过期时间
        String key = generatorKeyByPhone(passengerPhone);
        // 存入redis
        stringRedisTemplate.opsForValue().set(key,numberCode+"",2, TimeUnit.MINUTES);

        // 通过短信服务商，将对应的验证码发送到手机上。阿里短信服务，腾讯短信通，华信，容联
        return ResponseResult.success("");

    }

    /**
     * 根据乘客手机号，生成验证码的redis key。
     * @param passengerPhone
     * @return
     */
    private String generatorKeyByPhone(String passengerPhone){
        return verificationCodePrefix + passengerPhone;
    }

    /**
     * 校验手机号和对于的验证码
     * @param passengerPhone
     * @param verificationCode
     * @return
     */
    public ResponseResult checkCode(String passengerPhone , String verificationCode){
        System.out.println("进入 checkCode 方法");
        // 去redis 读取验证码
        // 生成key
        String key = generatorKeyByPhone(passengerPhone);
        // 根据key去获取value
        String codeRedis = stringRedisTemplate.opsForValue().get(key);
        System.out.println("redis中的验证码："+codeRedis);

        // 校验验证码
        if (StringUtils.isBlank(codeRedis)){
            return ResponseResult.fail(CommonStatusEnum.VERIFICATION_CODE_ERROR.getCode(),CommonStatusEnum.VERIFICATION_CODE_ERROR.getValue());
        }
        if(!verificationCode.trim().equals(codeRedis.trim())){
            return ResponseResult.fail(CommonStatusEnum.VERIFICATION_CODE_ERROR.getCode(),CommonStatusEnum.VERIFICATION_CODE_ERROR.getValue());
        }
        System.out.println("验证码校验通过");


        // 判断原来是否有用户

        // 颁发令牌
        TokenResponse tokenResponse = new TokenResponse();
        tokenResponse.setToken("token str");
        return ResponseResult.success(tokenResponse);

    }
}