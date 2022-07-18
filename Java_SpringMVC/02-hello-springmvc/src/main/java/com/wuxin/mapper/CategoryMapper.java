package com.wuxin.mapper;

import com.wuxin.pojo.Category;
import com.wuxin.vo.CategoryVo;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author: wuxin001
 * @date: 2022/7/16 12:07
 * @Description:
 */

public interface CategoryMapper {

    /**
     * 查询分类list
     *
     * @return list
     */
    List<Category> list();

    /**
     * 安装category 名称统计 文件数量
     *
     * @return CategoryVo
     */
    CategoryVo queryCount();

    /**
     * 通过ID查询
     *
     * @param cid 主键id
     * @return category
     */
    Category queryOne(@Param("cid") int cid);

    /**
     * 根据主键删除
     *
     * @param cid 主键id
     * @return 1
     */
    int delete(@Param("cid") int cid);

    /**
     * 修改category
     *
     * @param category DTO
     * @return 1
     */
    int update(Category category);

    /**
     * 添加
     *
     * @param category DTO
     * @return 1
     */
    int add(Category category);
}
