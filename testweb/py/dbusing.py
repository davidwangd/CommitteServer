# encoding: utf-8
import pymssql


def select(ss):
    conn = pymssql.connect(host='.', database='testdb')
    cur = conn.cursor()
    cur.execute(ss)
    yuanzu = cur.fetchall()
    cur.close()
    conn.close()
    return yuanzu


def yunxing(ss):
    conn = pymssql.connect(host='.', database='testdb')
    cur = conn.cursor()
    cur.execute(ss)
    conn.commit()
    cur.close()
    conn.close()




'''
如果和本机数据库交互，只需修改链接字符串
conn=pymssql.connect(host='.',database='Michael')
'''
'''
cur.execute('select top 5 * from Users')
#如果update/delete/insert记得要conn.commit()
#否则数据库事务无法提交
print(cur.fetchall())

cur.close()

conn.close()ement not executed or executed statement has no resultset
'''
print(select('select top 2 * from Users'))
