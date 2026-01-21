#RenewHelper
##RenewHelper - 时序·守望 是一款基于 Cloudflare Workers 的全栈服务生命周期提醒、管理工具。它专为管理周期性订阅、域名续费、服务器到期等场景设计。

✨ 核心特性
⚡️ Serverless 架构：完全运行在 Cloudflare Workers 上，利用 KV 存储数据，无需购买 VPS，免费额度通常足够个人使用。v1.3.5+ 已同时支持单机Docker方式部署。
������ 智能周期管理：
支持公历与农历（Lunar）周期计算。内置高精度农历算法（1900-2100），支持公历循环（如月付/年付）和农历循环（如生日、传统节日）。
支持按天、月、年为周期的自动推算。
提供“循环订阅”与“到期重置”两种模式。
������ 多渠道通知：
内置支持 Telegram, Bark, PushPlus, NotifyX, Resend (Email), Webhook。
支持自定义提前提醒天数和每日推送时间。
������ 自动化管理：
自动续期：到期自动更新下次提醒时间。
自动禁用：过期太久未处理的服务自动标记为禁用。
Cron 触发：支持通过 Cloudflare Cron Triggers 每日定时检查。
������ ICS 日历订阅：提供标准的 .ics 订阅链接，可完美接入 iOS 日历、Google Calendar 或 Outlook，支持基于时区的精确提醒并同步到您的手机日程中。
������️ 安全可靠：
JWT 身份验证，支持高强度密钥自动生成。
混合限流策略（内存 + KV），防止暴力破解。
数据仅存储在您私有的 Cloudflare KV 中。
敏感操作（删除、重置）二次确认。
������ 现代化 UI：
Vue 3 + Element Plus 构建的单文件前端。
支持深色/浅色模式切换。
响应式设计，完美适配移动端和桌面端。
中英双语界面。
支持数据导入/导出备份。

来源页面:https://www.ywsj365.com/archives/yong-docker-bu-shu-yi-ge-dao-qi-ti-xing-fu-wu-renewhelper
###加入时间:2026.01.21
