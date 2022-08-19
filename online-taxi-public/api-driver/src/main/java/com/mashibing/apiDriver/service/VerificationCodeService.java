package com.mashibing.apiDriver.service;

import com.mashibing.internalcommon.dto.ResponseResult;
import org.springframework.stereotype.Service;

@Service
public class VerificationCodeService {

    public ResponseResult checkAndsendVerificationCode(String driverPhone){
        // 查询 service-driver-user，该手机号的司机是否存在

        // 获取验证码

        // 调用第三方发生验证码

        // 存入reids

        return ResponseResult.success("");
    }
}
