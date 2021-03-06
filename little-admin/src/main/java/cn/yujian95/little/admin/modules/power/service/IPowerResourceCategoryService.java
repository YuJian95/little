package cn.yujian95.little.admin.modules.power.service;

import cn.yujian95.little.mbg.modules.power.entity.PowerResourceCategory;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 * 权限资源分类  接口类
 * </p>
 *
 * @author yujian95 yujian95_cn@163.com
 * @since 2020-10-14
 */
public interface IPowerResourceCategoryService extends IService<PowerResourceCategory> {

    /**
     * 判断是否，不存在该记录编号
     *
     * @param id 记录编号
     * @return 是否不存在
     */
    boolean isNotExist(Long id);

    /**
     * 获取全部资源分类排序
     *
     * @return 资源分类
     */
    List<PowerResourceCategory> listAll();
}
