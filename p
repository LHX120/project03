<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no, viewport-fit=cover">
    <title>账单详情</title>
    <style>
        * {
            box-sizing: border-box;
            -webkit-font-smoothing: antialiased;
        }
        body {
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            font-family: -apple-system, BlinkMacSystemFont, "Helvetica Neue", "PingFang SC", "Microsoft YaHei", sans-serif;
            color: #333333;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }
        
        /* Main Container */
        .container {
            width: 100%;
            max-width: 414px;
            padding: 12px 12px 24px 12px;
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        /* Card Style */
        .card {
            background-color: #ffffff;
            border-radius: 12px;
            padding: 24px 16px 16px 16px;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        /* Merchant Icon */
        .merchant-icon-container {
            width: 48px;
            height: 48px;
            background-color: #eb6825;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 12px;
        }
        .merchant-icon {
            width: 24px;
            height: 24px;
            fill: #ffffff;
        }

        .merchant-name {
            font-size: 15px;
            color: #333333;
            margin-bottom: 6px;
        }

        .amount {
            font-size: 34px;
            font-weight: 500;
            color: #000000;
            margin-bottom: 4px;
            font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
        }

        .status {
            font-size: 13px;
            color: #888888;
            margin-bottom: 28px;
        }

        /* Details Rows */
        .detail-box {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 14px;
            border-bottom: 1px solid #f2f2f2;
            padding-bottom: 16px;
            margin-bottom: 14px;
        }

        .row {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            font-size: 14px;
            line-height: 1.4;
        }

        .label {
            color: #999999;
            width: 80px;
            flex-shrink: 0;
        }

        .value {
            color: #333333;
            text-align: right;
            word-break: break-all;
        }
        
        .value.orange-text {
            color: #f43530;
        }
        
        .value .arrow {
            color: #cccccc;
            margin-left: 4px;
            font-family: "SimSun", sans-serif;
        }

        /* Reward Section */
        .reward-row {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 14px;
            margin-bottom: 14px;
            }
        .reward-btn {
            display: inline-flex;
            align-items: center;
            color: #ff8200;
            font-size: 13px;
            background: none;
            border: none;
            padding: 0;
            cursor: pointer;
        }
        .reward-icon {
            width: 14px;
            height: 14px;
            background-color: #ffb400;
            color: #ffffff;
            border-radius: 50%;
            font-size: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-right: 4px;
            font-weight: bold;
        }

        /* Bank Info Rows */
        .bank-box {
            width: 100%;
            display: flex;
            flex-direction: column;
            gap: 14px;
        }

        /* More Button */
        .more-btn {
            font-size: 13px;
            color: #999999;
            margin-top: 18px;
            display: flex;
            align-items: center;
            gap: 4px;
            cursor: pointer;
        }
        .more-btn::after {
            content: "";
            display: inline-block;
            width: 6px;
            height: 6px;
            border-right: 1px solid #999999;
            border-bottom: 1px solid #999999;
            transform: rotate(45deg);
            margin-bottom: 3px;
        }

        /* Management Card */
        .mgt-card {
            background-color: #ffffff;
            border-radius: 12px;
            padding: 14px 16px;
            width: 100%;
        }
        .mgt-title {
            font-size: 15px;
            font-weight: 500;
            color: #000000;
            margin-bottom: 12px;
        }
        .banner {
            background-color: #fdf7ee;
            border-radius: 8px;
            padding: 10px 12px;
            display: flex;
            align-items: center;
            justify-content: space-between;
            cursor: pointer;
        }
        .banner-left {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        .banner-icon {
            width: 32px;
            height: 32px;
            background-color: #d1e9ff;
            border-radius: 6px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 18px;
        }
        .banner-text {
            font-size: 13px;
            color: #666666;
        }
        .banner-text span {
            color: #ff8200;
        }
        .banner-arrow {
            color: #cccccc;
            font-size: 14px;
            font-family: "SimSun", sans-serif;
        }

        /* Category Card */
        .cat-card {
            background-color: #ffffff;
            border-radius: 12px;
            padding: 14px 16px;
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            cursor: pointer;
        }
        .cat-title {
            font-size: 15px;
            color: #000000;
        }
        .cat-value {
            font-size: 14px;
            color: #999999;
            display: flex;
            align-items: center;
            gap: 4px;
        }
    </style>
</head>
<body>

    <div class="container">
        
        <div class="card">
            <div class="merchant-icon-container">
                <svg class="merchant-icon" viewBox="0 0 24 24">
                    <path d="M19 6h-2c0-2.76-2.24-5-5-5S7 3.24 7 6H5c-1.1 0-2 .9-2 2v12c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V8c0-1.1-.9-2-2-2zm-7-3c1.66 0 3 1.34 3 3H9c0-1.66 1.34-3 3-3zm7 17H5V8h14v12zM12 10c-1.66 0-3 1.34-3 3s1.34 3 3 3 3-1.34 3-3-1.34-3-3-3z"/>
                </svg>
            </div>
            <div class="merchant-name">城发橘子洲</div>
            <div class="amount">39.31</div>
            <div class="status">交易成功</div>

            <div class="detail-box">
                <div class="row">
                    <div class="label">订单金额</div>
                    <div class="value">40.00</div>
                </div>
                <div class="row">
                    <div class="label">碰友日立减</div>
                    <div class="value orange-text">-0.69</div>
                </div>
                <div class="row">
                    <div class="label">支付时间</div>
                    <div class="value" id="pay-time">---- --:--:--</div>
                </div>
                <div class="row">
                    <div class="label">付款方式</div>
                    <div class="value">支付宝小荷包(日常小开支) <span class="arrow">&gt;</span></div>
                </div>
                <div class="row">
                    <div class="label">商品说明</div>
                    <div class="value">支付订单:环全洲游览线（可直达毛泽东青年艺术雕塑站，含往返）--购票</div>
                </div>
            </div>

            <div class="reward-row">
                <div class="label">支付奖励</div>
                <button class="reward-btn">
                    <span class="reward-icon">v</span>立即领取4积分
                </button>
            </div>

            <div class="bank-box">
                <div class="row">
                    <div class="label">收单机构</div>
                    <div class="value">兴业银行股份有限公司</div>
                </div>
                <div class="row">
                    <div class="label">清算机构</div>
                    <div class="value">中国银联股份有限公司</div>
                </div>
                <div class="row">
                    <div class="label">收款方全称</div>
                    <div class="value">长沙城发橘子洲旅游服务开发有限责任公司</div>
                </div>
            </div>

            <div class="more-btn">更多</div>
        </div>

        <div class="mgt-card">
            <div class="mgt-title">账单管理</div>
            <div class="banner">
                <div class="banner-left">
                    <div class="banner-icon">🧻</div>
                    <div class="banner-text">你因这笔消费解锁了<span>“日用百货”</span>贴纸</div>
                </div>
                <div class="banner-arrow">&gt;</div>
            </div>
        </div>

        <div class="cat-card">
            <div class="cat-title">账单分类</div>
            <div class="cat-value">日用百货 <span class="banner-arrow">&gt;</span></div>
        </div>

    </div>

    <script>
        (function() {
            // 获取客户端当前的北京时间/本地日期
            const now = new Date();
            const year = now.getFullYear();
            const month = String(now.getMonth() + 1).padStart(2, '0');
            const date = String(now.getDate()).padStart(2, '0');
            
            // 拼接当天的日期 + 固定的初始交易具体时间
            const fixedTime = "17:06:06";
            const targetString = `${year}-${month}-${date} ${fixedTime}`;
            
            // 写入页面容器
            document.getElementById("pay-time").innerText = targetString;
        })();
    </script>
</body>
</html>
