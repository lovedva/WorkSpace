using System;
using System.Net;
using System.Windows.Forms;

namespace SimpleWinFormsApp
{
    static class Program
    {
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            // 创建窗口
            Form form = new Form()
            {
                Text = "显示内网 IP 地址",
                ClientSize = new System.Drawing.Size(200, 100) // 窗口大小
            };

            // 创建一个标签来显示 IP 地址
            Label label = new Label()
            {
                AutoSize = true,
                Location = new System.Drawing.Point(10, 10) // 标签的位置
            };

            // 获取内网 IP 地址并设置为标签的文本
            string ipAddress = GetLocalIPAddress();
            label.Text = $"内网 IP 地址: {ipAddress}";

            // 将标签添加到窗口中
            form.Controls.Add(label);

            // 运行应用
            Application.Run(form);
        }

        // 获取内网 IP 地址的方法
        private static string GetLocalIPAddress()
        {
            var host = Dns.GetHostEntry(Dns.GetHostName());
            foreach (var ip in host.AddressList)
            {
                if (ip.AddressFamily == System.Net.Sockets.AddressFamily.InterNetwork)
                {
                    return ip.ToString();
                }
            }
            return "IP 地址未找到";
        }
    }
}
