package com.mashibing.serviceDriverUser.service;

import com.mashibing.internalcommon.constant.CommonStatusEnum;
import com.mashibing.internalcommon.constant.DriverCarConstants;
import com.mashibing.internalcommon.dto.DriverCarBindingRelationship;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mashibing.internalcommon.dto.ResponseResult;
import com.mashibing.serviceDriverUser.mapper.DriverCarBindingRelationshipMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 晁鹏飞
 * @since 2022-08-13
 */
@Service
public class DriverCarBindingRelationshipService {

    @Autowired
    DriverCarBindingRelationshipMapper driverCarBindingRelationshipMapper;

    public ResponseResult bind(DriverCarBindingRelationship driverCarBindingRelationship){
        LocalDateTime now = LocalDateTime.now();
        driverCarBindingRelationship.setBindingTime(now);

        driverCarBindingRelationship.setBindState(DriverCarConstants.DRIVER_CAR_BIND);

        driverCarBindingRelationshipMapper.insert(driverCarBindingRelationship);
        return ResponseResult.success("");

    }


    public ResponseResult unbind(DriverCarBindingRelationship driverCarBindingRelationship){
        LocalDateTime now = LocalDateTime.now();

        Map<String,Object> map = new HashMap<>();
        map.put("driver_id",driverCarBindingRelationship.getDriverId());
        map.put("car_id",driverCarBindingRelationship.getCarId());
        map.put("bind_state", DriverCarConstants.DRIVER_CAR_BIND);

        List<DriverCarBindingRelationship> driverCarBindingRelationships = driverCarBindingRelationshipMapper.selectByMap(map);
        if (driverCarBindingRelationships.isEmpty()){
            return ResponseResult.fail(CommonStatusEnum.DRIVER_CAR_BIND_NOT_EXISTS.getCode(),CommonStatusEnum.DRIVER_CAR_BIND_NOT_EXISTS.getValue());
        }
        DriverCarBindingRelationship relationship = driverCarBindingRelationships.get(0);
        relationship.setBindState(DriverCarConstants.DRIVER_CAR_UNBIND);
        relationship.setUnBindingTime(now);

        driverCarBindingRelationshipMapper.updateById(relationship);
        return ResponseResult.success("");

    }

}
