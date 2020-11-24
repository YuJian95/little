create table power_admin
(
    id           bigint auto_increment comment '编号'
        primary key,
    icon         varchar(512) default 'http://image.baokangnet.cn/Fj637_Wy8lBHHE4xQageqJtE3_77' not null comment '头像',
    nickname     varchar(32)  default '管理员'                                                     not null comment '昵称',
    username     varchar(32)                                                                    not null comment '登录账号 唯一',
    password     varchar(512)                                                                   not null comment '登录密码 使用md5加密',
    note         varchar(200) default '管理员账号'                                                   not null comment '备注信息',
    status       int          default 1                                                         not null comment '账号状态 1：正常，0：锁定',
    first_login  timestamp                                                                      null comment '第一次登陆时间',
    login_time   datetime                                                                       null comment '最后登录时间',
    gmt_create   datetime     default CURRENT_TIMESTAMP                                         not null comment '创建时间',
    gmt_modified datetime     default CURRENT_TIMESTAMP                                         not null comment '更新时间',
    constraint power_account_name_uindex
        unique (username)
)
    comment '权限账号';

create table power_menu
(
    id           bigint auto_increment comment '菜单编号'
        primary key,
    parent_id    bigint                             null comment '父级菜单',
    title        varchar(32)                        not null comment '菜单名称',
    level        int                                not null comment '菜单级数',
    sort         int                                not null comment '菜单排序',
    name         varchar(32)                        not null comment '前端路径',
    icon         varchar(32)                        not null comment '前端图标',
    hidden       int      default 1                 not null comment '前端隐藏 0：隐藏，1：显示',
    gmt_create   datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    gmt_modified datetime default CURRENT_TIMESTAMP not null comment '更新时间',
    constraint power_menu_name_uindex
        unique (name),
    constraint power_menu_title_uindex
        unique (title)
)
    comment '权限菜单 ';

create table power_resource
(
    id           bigint auto_increment comment '资源编号'
        primary key,
    category_id  bigint                             not null comment '资源分类编号',
    name         varchar(32)                        not null comment '资源名称',
    url          varchar(32)                        not null comment '资源URL',
    description  varchar(64)                        not null comment '资源描述',
    gmt_create   datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    gmt_modified datetime default CURRENT_TIMESTAMP not null comment '更新时间',
    constraint power_resource_name_uindex
        unique (name),
    constraint power_resource_url_uindex
        unique (url)
)
    comment '权限资源 ';

create index power_resource_power_resource_category_id_fk
    on power_resource (category_id);

create table power_resource_category
(
    id           bigint auto_increment comment '分类编号'
        primary key,
    name         varchar(32)                        not null comment '分类名称',
    sort         int      default 1                 not null comment '分类排序 数值越小，越靠前',
    gmt_create   datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    gmt_modified datetime default CURRENT_TIMESTAMP not null comment '更新时间',
    constraint power_resource_category_name_uindex
        unique (name)
)
    comment '权限资源分类 ';

create table power_role
(
    id           bigint auto_increment comment '角色编号'
        primary key,
    name         varchar(32)                        not null comment '英文名称',
    chinese_name varchar(32)                        not null comment '中文名称',
    admin_count  int      default 0                 not null comment '用户数目',
    sort         int      default 0                 not null comment '排序 越小越靠前',
    status       int      default 1                 not null comment '角色状态 1：启用，0：禁用',
    gmt_create   datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    gmt_modified datetime default CURRENT_TIMESTAMP not null comment '更新时间',
    constraint power_role_name_uindex
        unique (name)
)
    comment '权限角色';

create table power_admin_role_relation
(
    id           bigint auto_increment comment '账号角色关系编号'
        primary key,
    admin_id     bigint                             not null comment '管理员编号',
    role_id      bigint                             not null comment '角色编号',
    gmt_create   datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    gmt_modified datetime default CURRENT_TIMESTAMP not null comment '更新时间',
    constraint power_admin_role_relation_power_admin_id_fk
        foreign key (admin_id) references power_admin (id)
            on update cascade on delete cascade,
    constraint power_admin_role_relation_power_role_id_fk
        foreign key (role_id) references power_role (id)
            on update cascade on delete cascade
)
    comment '权限账号关联角色';

create table power_role_menu_relation
(
    id           bigint auto_increment comment '关系编号'
        primary key,
    role_id      bigint                             not null comment '角色编号',
    menu_id      bigint                             not null comment '菜单编号',
    gmt_create   datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    gmt_modified datetime default CURRENT_TIMESTAMP not null comment '更新时间',
    constraint power_role_menu_relation_power_menu_id_fk
        foreign key (menu_id) references power_menu (id)
            on update cascade on delete cascade,
    constraint power_role_menu_relation_power_role_id_fk
        foreign key (role_id) references power_role (id)
            on update cascade on delete cascade
)
    comment '权限角色关联菜单 ';

create table power_role_resource_relation
(
    id           bigint auto_increment comment '关系编号'
        primary key,
    role_id      bigint                             not null comment '角色编号',
    resource_id  bigint                             not null comment '资源编号',
    gmt_create   datetime default CURRENT_TIMESTAMP not null comment '创建时间',
    gmt_modified datetime default CURRENT_TIMESTAMP not null comment '更新时间',
    constraint power_role_resource_relation_power_resource_id_fk
        foreign key (resource_id) references power_resource (id)
            on update cascade on delete cascade,
    constraint power_role_resource_relation_power_role_id_fk
        foreign key (role_id) references power_role (id)
            on update cascade on delete cascade
)
    comment '权限角色关联资源 ';

create table system_api_log
(
    id           bigint auto_increment comment '编号'
        primary key,
    type         varchar(32)  not null comment '类型 微信端：wx，管理端：admin',
    user_name    varchar(32)  null comment '操作用户',
    description  varchar(128) not null comment '操作描述',
    start_time   datetime     not null comment '操作时间',
    spend_time   double       null comment '消耗时间',
    base_path    varchar(128) null comment '请求域名',
    uri          varchar(128) null comment 'URI',
    url          varchar(512) null comment 'URL',
    method       varchar(32)  not null comment '请求类型 post、put、get、delete',
    ip           varchar(32)  null comment 'IP地址',
    parameter    text         null comment '请求参数',
    result       text         null comment '返回结果',
    gmt_create   datetime     not null comment '创建时间',
    gmt_modified datetime     not null comment '更新时间'
)
    comment '系统接口日志 ';

create table system_dictionary
(
    id           bigint auto_increment comment '编号'
        primary key,
    parent_id    varchar(32)                            null comment '父对象',
    code         varchar(32)                            not null comment '字典码',
    show_value   varchar(32)                            not null comment '显示值',
    type         varchar(32)                            not null comment '类型',
    sort         int                                    not null comment '排序（从1开始排序）',
    status       int          default 0                 not null comment '状态(-1 ： 全部，0：正常，1：锁定)',
    remark       varchar(128) default ''                null comment '备注说明(小于120字)',
    logic_delete int          default 0                 not null comment '逻辑删除 0：正常，1：删除',
    created_by   bigint       default 10000004          not null comment '创建人',
    gmt_create   datetime     default CURRENT_TIMESTAMP not null comment '创建时间',
    modified_by  bigint       default 10000004          not null comment '更新人',
    gmt_modified datetime     default CURRENT_TIMESTAMP not null comment '更新时间'
)
    comment '系统数据字典';

create table system_login_log
(
    id           bigint auto_increment comment '记录编号'
        primary key,
    type         int                                 not null comment '类型0：微信端1：管理端',
    account_id   bigint                              not null comment '小程序用户编号/管理员编号',
    name         varchar(255)                        not null comment '账号名称',
    ip_address   varchar(255)                        null comment 'ip地址',
    gmt_create   timestamp default CURRENT_TIMESTAMP not null comment '创建日期',
    gmt_modified timestamp default CURRENT_TIMESTAMP not null comment '更新日期'
)
    comment '系统用户登录日志' charset = utf8;

create index log_admin_login_power_admin_id_fk
    on system_login_log (account_id);

create table user_info
(
    id           bigint auto_increment comment '用户编号'
        primary key,
    nickname     varchar(32)                           not null comment '昵称',
    username     varchar(32)                           not null comment '用户名',
    open_id      varchar(64)                           null comment 'OpenID',
    phone        varchar(32)                           not null comment '手机号',
    password     varchar(255)                          not null comment '密码',
    status       int         default 1                 not null comment '状态 0：禁用，1：启用',
    logic_delete varchar(10) default 'no'              not null comment '逻辑删除 yes：删除，no：正常',
    gmt_create   datetime    default CURRENT_TIMESTAMP not null comment '注册日期',
    gmt_modified datetime    default CURRENT_TIMESTAMP not null comment '修改日期'
)
    comment '用户信息 ';


