package me.allen.newBlog.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import me.allen.newBlog.mapper.CashMapper;
import me.allen.newBlog.model.entity.Cash;
import me.allen.newBlog.service.CashService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author allen
 */
@Service
@Transactional(rollbackFor = Exception.class)
public class CashServiceImpl extends ServiceImpl<CashMapper, Cash> implements CashService {
}
