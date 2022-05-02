# ZJUI 机械臂运动学

## ZJUI 机械臂说明

ZJUI 机械臂的 DH 参数如下：

| α    | a     | d      | θ                  |
| ---- | ----- | ------ | ------------------ |
| 0    | 0     | 0.23   | θ<sub>1</sub>      |
| -π/2 | 0     | -0.054 | -π/2+θ<sub>2</sub> |
| 0    | 0.185 | 0      | θ<sub>3</sub>      |
| 0    | 0.17  | 0.077  | π/2+θ<sub>4</sub>  |
| π/2  | 0     | 0.077  | π/2+θ<sub>5</sub>  |
| π/2  | 0     | 0.0855 | θ<sub>6</sub>      |

变换矩阵：

![](https://latex.codecogs.com/svg.image?%5Cleft%5B%20%7B%5Cbegin%7Barray%7D%7B*%7B20%7D%7Bc%7D%7D%7B%20-%20%7Bc_6%7D(%7Bc_5%7D%7Bs_1%7D%20&plus;%20%7Bc_1%7D%7Bc_%7B234%7D%7D%7Bs_5%7D)%20&plus;%20%7Bc_1%7D%7Bs_%7B234%7D%7D%7Bs_6%7D%7D&%7B%7Bc_5%7D%7Bs_1%7D%7Bs_6%7D%20&plus;%20%7Bc_1%7D(%7Bc_6%7D%7Bs_%7B234%7D%7D%20&plus;%20%7Bc_%7B234%7D%7D%7Bs_5%7D%7Bs_6%7D)%7D&%7B%7Bc_1%7D%7Bc_%7B234%7D%7D%7Bc_5%7D%20-%20%7Bs_1%7D%7Bs_5%7D%7D&%7B%7Bc_1%7D(0.0855%7Bc_%7B234%7D%7D%7Bc_5%7D%20&plus;%200.185%7Bs_2%7D%20&plus;%200.17%7Bs_%7B23%7D%7D%20&plus;%200.077%7Bs_%7B234%7D%7D)%20&plus;%20%7Bs_1%7D(%20-%200.023%20-%200.0855%7Bs_5%7D)%7D%5C%5C%7B%7Bc_1%7D%7Bc_5%7D%7Bc_6%7D%20&plus;%20%7Bs_1%7D(%20-%20%7Bc_%7B234%7D%7D%7Bc_6%7D%7Bs_5%7D%20&plus;%20%7Bs_%7B234%7D%7D%7Bs_6%7D)%7D&%7B%7Bc_6%7D%7Bs_1%7D%7Bs_%7B234%7D%7D%20&plus;%20(%20-%20%7Bc_1%7D%7Bc_5%7D%20&plus;%20%7Bc_%7B234%7D%7D%7Bs_1%7D%7Bs_5%7D)%7Bs_6%7D%7D&%7B%7Bc_%7B234%7D%7D%7Bc_5%7D%7Bs_1%7D%20&plus;%20%7Bc_1%7D%7Bs_5%7D%7D&%7B%7Bs_1%7D(0.0855%7Bc_%7B234%7D%7D%7Bc_5%7D%20&plus;%200.185%7Bs_2%7D%20&plus;%200.17%7Bs_%7B23%7D%7D%20&plus;%200.077%7Bs_%7B234%7D%7D)%20&plus;%20%7Bc_1%7D(0.023%20&plus;%200.0855%7Bs_5%7D)%7D%5C%5C%7B%7Bc_6%7D%7Bs_%7B234%7D%7D%7Bs_5%7D%20&plus;%20%7Bc_%7B234%7D%7D%7Bs_6%7D%7D&%7B%7Bc_%7B234%7D%7D%7Bc_6%7D%20-%20%7Bs_%7B234%7D%7D%7Bs_5%7D%7Bs_6%7D%7D&%7B%20-%20%7Bc_5%7D%7Bs_%7B234%7D%7D%7D&%7B0.23%20&plus;%200.185%7Bc_2%7D%20&plus;%200.17%7Bc_%7B23%7D%7D%20&plus;%200.077%7Bc_%7B234%7D%7D%20-%200.0855%7Bc_5%7D%7Bs_%7B234%7D%7D%7D%5C%5C0&0&0&1%5Cend%7Barray%7D%7D%20%5Cright%5D%5C)

## 程序说明

zjui.wl 包中有两个常用函数：

+ ForwardKinematicsZJU
  
  正运动学计算，输入关节角，得到末端空间位置和 XYZ 欧拉角

+ BackwardKinematicsZJU

  逆运动学计算，输入末端空间位置和 XYZ 欧拉角，得到 6 个关节角

具体使用可参考 demo.nb 笔记本

## 贡献者

+ [Myth](https://github.com/Mythologyli)
+ [DX3906G](https://github.com/DX3906G)