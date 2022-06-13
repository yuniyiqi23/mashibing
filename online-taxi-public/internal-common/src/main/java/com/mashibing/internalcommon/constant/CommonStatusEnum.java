package com.mashibing.internalcommon.constant;

import lombok.Data;
import lombok.Getter;


public enum CommonStatusEnum {

    /**
     * 短信验证码的错误范围 1000-1099
     */

    VERIFICATION_CODE_ERROR(1099,"验证码错误"),

    /**
     * 成功
     */
    SUCCESS(1,"success"),
    /**
     * 失败
     */
    FAIL(0,"fail")

    ;
    @Getter
    private int code;
    @Getter
    private String value;

    CommonStatusEnum(int code, String value) {
        this.code = code;
        this.value = value;
    }
}
