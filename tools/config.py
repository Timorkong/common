#!/usr/bin/python
# encoding=utf-8
"""
配置文件
"""

import os
import subprocess

class ExeRsp(object):
    def __init__(self):
        self.returncode = 0
        self.stderr = ''

class Config(object):
    def __init__(self):
        self.table_path = './../table/'
        self.proto_path = './../proto/proto_table/'
        self.proto_command_path = './../proto/proto_command/'
        self.proto_table_path = './../proto/proto_table/'

        self.client_table_prefix = 'c_table_'  # 客户端表格二进制文件前缀
        self.server_table_prefix = 's_table_'  # 服务端表格二进制文件前缀
        self.common_prefix = 'common_'  # 公共库文件前缀
        self.command_prefix = ''

        self.client_table_package = 'Table'  # 客户端表格包名
        self.server_table_package = 'table'  # 服务端表格包名

        self.table_cs_path = './../../lockStep/Assets/PackTable/table_cs/'  # 表格代码文件存储相对路径
        self.table_data_path = './../../lockStep/Assets/PackTable/table_byte/'  # 表格二进制文件存储相对路径
        self.command_cs_path = './../../lockStep/Assets/PackTable/command/'  # 表格二进制文件存储相对路径

    @classmethod
    def generate_proto_py_file(cls, proto_name):
        """
        根据proto文件生成python文件\n
        proto_name proto文件名称（不带后缀）
        """
        # ret = Config.execute_shell_command(['protoc', '-I.', '--python_out=.', '{}.proto'.format(proto_name)], 'T')
        cmd = 'protoc -I. --python_out=. {0}*.proto'.format(proto_name)
        ret = Config.excute_shell_command_system(cmd)
        return ret
    
    @classmethod
    def generate_cs_file(cls, out_path, prefix):
        cmd = 'protoc --csharp_out={0} {1}*.proto'.format(out_path,prefix)
        ret = Config.excute_shell_command_system(cmd)
        # ret = Config.execute_shell_command(['protoc', '--csharp_out={}'.format(out_path), '{}*.proto'.format(prefix)], 'T')
        return ret

    @classmethod
    def execute_shell_command(cls, args, wait = 'T'):
        ret = ExeRsp()
        p = subprocess.Popen(args, stderr=subprocess.PIPE)
        if wait == 'T':
            ret.returncode = p.wait()
            ret.stderr = p.stderr.read()
            return ret
        else:
            ret.returncode = 0
            return ret
    @classmethod
    def excute_shell_command_system(cls , val):
        ret = ExeRsp()  
        os.system(val)
        return ret
