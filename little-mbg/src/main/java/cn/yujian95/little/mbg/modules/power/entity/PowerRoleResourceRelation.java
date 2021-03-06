package cn.yujian95.little.mbg.modules.power.entity;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 权限角色关联资源 
 * </p>
 *
 * @author yujian95 yujian95_cn@163.com
 * @since 2020-10-18
 */
@Data
@EqualsAndHashCode(callSuper = false)
@TableName("power_role_resource_relation")
@ApiModel(value = "权限角色关联资源 对象", description = "权限角色关联资源 ")
public class PowerRoleResourceRelation implements Serializable {

    private static final long serialVersionUID = 1L;

    @ApiModelProperty(value = "关系编号")
    @TableId(value = "id", type = IdType.AUTO)
    private Long id;

    @ApiModelProperty(value = "角色编号")
    private Long roleId;

    @ApiModelProperty(value = "资源编号")
    private Long resourceId;

    @ApiModelProperty(value = "创建时间")
    private Date gmtCreate;

    @ApiModelProperty(value = "更新时间")
    private Date gmtModified;


}
